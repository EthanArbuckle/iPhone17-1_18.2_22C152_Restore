@interface CSIntuitiveConvRequestHandler
- (BOOL)_isRequestIdCurrent:(id)a3;
- (BOOL)audioSessionMonitoringInProgress;
- (BOOL)isPromptRequestImpending;
- (BOOL)pendingStartAttendingDecision;
- (BOOL)supportTCU;
- (CSAggressiveECModeHandler)aggressiveECHandler;
- (CSAsset)mitigationAsset;
- (CSAsset)vtAsset;
- (CSAttSiriAFTMNode)aFTMNode;
- (CSAttSiriAssetDownloadPromptIOS)downloadPrompter;
- (CSAttSiriAudioCoordinator)audioCoordinator;
- (CSAttSiriAudioMetricsNode)audioMetricsNode;
- (CSAttSiriAudioSessionStateClient)siriStateClient;
- (CSAttSiriAudioSrcNode)audioSrcNode;
- (CSAttSiriBridgeMessageHandler)bridgeMessageHandler;
- (CSAttSiriContinuityEndDetector)continuityEndDetector;
- (CSAttSiriEagerMitigator)eagerMitigator;
- (CSAttSiriEndpointerNode)endpointerNode;
- (CSAttSiriMagusSupportedPolicy)magusSupportedPolicy;
- (CSAttSiriNLDAClassifierNode)nldaClassifierNode;
- (CSAttSiriOSDNode)osdNode;
- (CSAttSiriRCHandler)rcHandler;
- (CSAttSiriSSRNode)ssrNode;
- (CSAttSiriSpeechRecognitionNode)speechRecognitionNode;
- (CSAttSiriTCUGenerator)tcuGenerator;
- (CSAttSiriUresNode)uresNode;
- (CSAttendingHintProviding)hintProvider;
- (CSAttendingStatesMessageHandling)attendingStatesMessageHandler;
- (CSAudioRecordContext)audioRecordContext;
- (CSAudioSessionInfoProvider)audioSessionInfoProvider;
- (CSAudioStream)siriClientStream;
- (CSEndpointDetectedSelfLogger)endpointDetectedSelfLogger;
- (CSIntuitiveConvAudioCaptureMonitor)intuitiveConvAudioCaptureMonitor;
- (CSIntuitiveConvRequestHandler)init;
- (CSIntuitiveConvRequestHandler)initWithAudioSrcNode:(id)a3 endpointerNode:(id)a4 osdNode:(id)a5 ssrNode:(id)a6 speechRecognitionNode:(id)a7 uresNode:(id)a8 needsSSRNode:(BOOL)a9 aFtmNode:(id)a10 speechManager:(id)a11 siriEnabledMonitor:(id)a12 siriClientBehaviorMonitor:(id)a13 intuitiveConvAudioCaptureMonitor:(id)a14 rcHandler:(id)a15 tcuGenerator:(id)a16 continuityEndDetector:(id)a17 bridgeMessageHandler:(id)a18 audioCoordinator:(id)a19 magusSupportedPolicy:(id)a20 supportsAcousticProgressiveChecker:(BOOL)a21 supportsUnderstandingOnDevice:(BOOL)a22 requireASROnDevice:(BOOL)a23 supportsHybridUnderstandingOnDevice:(BOOL)a24 supportsLogger:(BOOL)a25 supportTCU:(BOOL)a26 audioSessionInfoProvider:(id)a27 aggressiveECHandler:(id)a28;
- (CSIntuitiveConvRequestHandlerDelegate)requestHandlerDelegate;
- (CSIntuitiveConversationLogger)signalsLogger;
- (CSOSTransaction)attSiriTransaction;
- (CSSiriAudioMessageRequestHandler)audioMessageRequestHandler;
- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor;
- (CSSiriEnabledMonitor)siriEnabledMonitor;
- (CSSpeechManager)speechManager;
- (NSMapTable)nodesCache;
- (NSString)currentRequestId;
- (NSString)dismissedRequestId;
- (NSString)pendingAttendingStartRootRequestID;
- (NSString)recordingEventUUIDToIgnore;
- (NSString)requestMHUUID;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)targetQueueForASR;
- (id)_createRequestLinkInfo:(id)a3 component:(int)a4;
- (id)_recordContextForContinuousConversation;
- (id)_startStreamOption;
- (id)_startStreamOptionWithMachAbsTime:(unint64_t)a3;
- (id)fetchRecordingEventUUIDToIgnore;
- (id)getAsrProxyObj;
- (id)getAudioMessageServiceProxyObj;
- (id)getEndpointerProxyObj;
- (id)getRcHandlerProxyObj;
- (id)getSsrProxyObj;
- (void)CSSiriEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)_attendingDismissalAndBlockHelper;
- (void)_cacheStartAttendingInfo:(id)a3 attendingDecision:(BOOL)a4;
- (void)_configureAllNodes;
- (void)_fetchMitigationAssets;
- (void)_fetchRequiredAssetsForRecordContext:(id)a3;
- (void)_fetchVoiceTriggerAssets;
- (void)_generateStartAttendingHint:(id)a3 attendingDecision:(BOOL)a4;
- (void)_handleClientDidStartStreamWithOption:(id)a3 successfully:(BOOL)a4;
- (void)_handleClientDidStopWithOption:(id)a3;
- (void)_handleClientPreparedAudioStream:(id)a3 successfully:(BOOL)a4;
- (void)_handleClientWillStartStreamWithContext:(id)a3 option:(id)a4;
- (void)_handleClientWillStopStreamWithReason:(unint64_t)a3 stopStreamOption:(id)a4;
- (void)_handleStartProcessingWithRecordContext:(id)a3 withAudioStartStreamOptions:(id)a4 completion:(id)a5;
- (void)_handleStopProcessingForRequestId:(id)a3;
- (void)_setupAudioSrcNodeWithSiriClientStream:(id)a3;
- (void)_startMonitoringAudioSession;
- (void)_stopMonitoringAudioSession;
- (void)attSiriAudioSrcNodeDidStopUnexpectedly:(id)a3;
- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6;
- (void)attendingXpcDisconnection;
- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4;
- (void)dismissAttendingRequested;
- (void)emitRequestLinkEventForMHUUID:(id)a3 withRequestId:(id)a4;
- (void)intuitiveConvAudioCaptureMonitor:(id)a3 didStartAudioCaptureSuccessfully:(BOOL)a4 option:(id)a5 eventUUID:(id)a6;
- (void)intuitiveConvAudioCaptureMonitor:(id)a3 fetchedAudioStream:(id)a4 successfully:(BOOL)a5;
- (void)intuitiveConvAudioCaptureMonitor:(id)a3 willStartAudioCaptureWithContext:(id)a4 option:(id)a5;
- (void)intuitiveConvAudioCaptureMonitor:(id)a3 willStopAudioCaptureReason:(unint64_t)a4;
- (void)intuitiveConvAudioCaptureMonitorDidStopAudioCapture:(id)a3 stopStreamOption:(id)a4 eventUUID:(id)a5;
- (void)mxSessionMonitorSomeClientWentActive:(id)a3;
- (void)notifyRequestCompletion;
- (void)setAFTMNode:(id)a3;
- (void)setAggressiveECHandler:(id)a3;
- (void)setAttSiriTransaction:(id)a3;
- (void)setAttendingStatesMessageHandler:(id)a3;
- (void)setAudioCoordinator:(id)a3;
- (void)setAudioMessageRequestHandler:(id)a3;
- (void)setAudioMetricsNode:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setAudioSessionInfoProvider:(id)a3;
- (void)setAudioSessionMonitoringInProgress:(BOOL)a3;
- (void)setAudioSrcNode:(id)a3;
- (void)setBridgeMessageHandler:(id)a3;
- (void)setContinuityEndDetector:(id)a3;
- (void)setCurrentRequestId:(id)a3;
- (void)setDismissedRequestId:(id)a3;
- (void)setDownloadPrompter:(id)a3;
- (void)setEagerMitigator:(id)a3;
- (void)setEndpointDetectedSelfLogger:(id)a3;
- (void)setEndpointerNode:(id)a3;
- (void)setHintProvider:(id)a3;
- (void)setIntuitiveConvAudioCaptureMonitor:(id)a3;
- (void)setIsPromptRequestImpending:(BOOL)a3;
- (void)setMagusSupportedPolicy:(id)a3;
- (void)setMitigationAsset:(id)a3;
- (void)setNldaClassifierNode:(id)a3;
- (void)setNodesCache:(id)a3;
- (void)setOsdNode:(id)a3;
- (void)setPendingAttendingStartRootRequestID:(id)a3;
- (void)setPendingStartAttendingDecision:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setRcHandler:(id)a3;
- (void)setRecordingEventUUIDToIgnore:(id)a3;
- (void)setRequestHandlerDelegate:(id)a3;
- (void)setRequestMHUUID:(id)a3;
- (void)setSignalsLogger:(id)a3;
- (void)setSiriClientBehaviorMonitor:(id)a3;
- (void)setSiriClientStream:(id)a3;
- (void)setSiriEnabledMonitor:(id)a3;
- (void)setSiriStateClient:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setSpeechRecognitionNode:(id)a3;
- (void)setSsrNode:(id)a3;
- (void)setSupportTCU:(BOOL)a3;
- (void)setTargetQueueForASR:(id)a3;
- (void)setTcuGenerator:(id)a3;
- (void)setUresNode:(id)a3;
- (void)setVtAsset:(id)a3;
- (void)setup;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5;
- (void)siriClientBehaviorMonitor:(id)a3 fetchedSiriClientAudioStream:(id)a4 successfully:(BOOL)a5;
- (void)siriClientBehaviorMonitor:(id)a3 preparedSiriClientAudioStream:(id)a4 successfully:(BOOL)a5;
- (void)siriClientBehaviorMonitor:(id)a3 willStartStreamWithContext:(id)a4 option:(id)a5 withEventUUID:(id)a6;
- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5 withEventUUID:(id)a6;
- (void)siriPromptWillStart;
- (void)siriUIDismissed;
- (void)start;
@end

@implementation CSIntuitiveConvRequestHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAttendingStartRootRequestID, 0);
  objc_storeStrong((id *)&self->_siriStateClient, 0);
  objc_storeStrong((id *)&self->_audioSessionInfoProvider, 0);
  objc_storeStrong((id *)&self->_magusSupportedPolicy, 0);
  objc_storeStrong((id *)&self->_recordingEventUUIDToIgnore, 0);
  objc_storeStrong((id *)&self->_currentRequestId, 0);
  objc_storeStrong((id *)&self->_dismissedRequestId, 0);
  objc_storeStrong((id *)&self->_signalsLogger, 0);
  objc_storeStrong((id *)&self->_aggressiveECHandler, 0);
  objc_storeStrong((id *)&self->_audioMetricsNode, 0);
  objc_storeStrong((id *)&self->_eagerMitigator, 0);
  objc_storeStrong((id *)&self->_downloadPrompter, 0);
  objc_storeStrong((id *)&self->_audioCoordinator, 0);
  objc_storeStrong((id *)&self->_endpointDetectedSelfLogger, 0);
  objc_storeStrong((id *)&self->_audioMessageRequestHandler, 0);
  objc_storeStrong((id *)&self->_bridgeMessageHandler, 0);
  objc_storeStrong((id *)&self->_continuityEndDetector, 0);
  objc_storeStrong((id *)&self->_tcuGenerator, 0);
  objc_storeStrong((id *)&self->_rcHandler, 0);
  objc_storeStrong((id *)&self->_nldaClassifierNode, 0);
  objc_storeStrong((id *)&self->_aFTMNode, 0);
  objc_storeStrong((id *)&self->_siriEnabledMonitor, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_vtAsset, 0);
  objc_storeStrong((id *)&self->_mitigationAsset, 0);
  objc_storeStrong((id *)&self->_siriClientStream, 0);
  objc_storeStrong((id *)&self->_intuitiveConvAudioCaptureMonitor, 0);
  objc_storeStrong((id *)&self->_siriClientBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_requestMHUUID, 0);
  objc_storeStrong((id *)&self->_attSiriTransaction, 0);
  objc_storeStrong((id *)&self->_audioRecordContext, 0);
  objc_storeStrong((id *)&self->_targetQueueForASR, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_ssrNode, 0);
  objc_storeStrong((id *)&self->_audioSrcNode, 0);
  objc_storeStrong((id *)&self->_uresNode, 0);
  objc_storeStrong((id *)&self->_speechRecognitionNode, 0);
  objc_storeStrong((id *)&self->_osdNode, 0);
  objc_storeStrong((id *)&self->_endpointerNode, 0);
  objc_storeStrong((id *)&self->_nodesCache, 0);
  objc_storeStrong((id *)&self->_attendingStatesMessageHandler, 0);
  objc_storeStrong((id *)&self->_hintProvider, 0);
  objc_storeStrong((id *)&self->_requestHandlerDelegate, 0);
}

- (void)setIsPromptRequestImpending:(BOOL)a3
{
  self->_isPromptRequestImpending = a3;
}

- (BOOL)isPromptRequestImpending
{
  return self->_isPromptRequestImpending;
}

- (void)setPendingAttendingStartRootRequestID:(id)a3
{
}

- (NSString)pendingAttendingStartRootRequestID
{
  return self->_pendingAttendingStartRootRequestID;
}

- (void)setPendingStartAttendingDecision:(BOOL)a3
{
  self->_pendingStartAttendingDecision = a3;
}

- (BOOL)pendingStartAttendingDecision
{
  return self->_pendingStartAttendingDecision;
}

- (void)setSiriStateClient:(id)a3
{
}

- (CSAttSiriAudioSessionStateClient)siriStateClient
{
  return self->_siriStateClient;
}

- (void)setAudioSessionInfoProvider:(id)a3
{
}

- (CSAudioSessionInfoProvider)audioSessionInfoProvider
{
  return self->_audioSessionInfoProvider;
}

- (void)setAudioSessionMonitoringInProgress:(BOOL)a3
{
  self->_audioSessionMonitoringInProgress = a3;
}

- (BOOL)audioSessionMonitoringInProgress
{
  return self->_audioSessionMonitoringInProgress;
}

- (void)setMagusSupportedPolicy:(id)a3
{
}

- (CSAttSiriMagusSupportedPolicy)magusSupportedPolicy
{
  return self->_magusSupportedPolicy;
}

- (void)setRecordingEventUUIDToIgnore:(id)a3
{
}

- (NSString)recordingEventUUIDToIgnore
{
  return self->_recordingEventUUIDToIgnore;
}

- (void)setCurrentRequestId:(id)a3
{
}

- (NSString)currentRequestId
{
  return self->_currentRequestId;
}

- (void)setDismissedRequestId:(id)a3
{
}

- (NSString)dismissedRequestId
{
  return self->_dismissedRequestId;
}

- (void)setSupportTCU:(BOOL)a3
{
  self->_supportTCU = a3;
}

- (BOOL)supportTCU
{
  return self->_supportTCU;
}

- (void)setSignalsLogger:(id)a3
{
}

- (CSIntuitiveConversationLogger)signalsLogger
{
  return self->_signalsLogger;
}

- (void)setAggressiveECHandler:(id)a3
{
}

- (CSAggressiveECModeHandler)aggressiveECHandler
{
  return self->_aggressiveECHandler;
}

- (void)setAudioMetricsNode:(id)a3
{
}

- (CSAttSiriAudioMetricsNode)audioMetricsNode
{
  return self->_audioMetricsNode;
}

- (void)setEagerMitigator:(id)a3
{
}

- (CSAttSiriEagerMitigator)eagerMitigator
{
  return self->_eagerMitigator;
}

- (void)setDownloadPrompter:(id)a3
{
}

- (CSAttSiriAssetDownloadPromptIOS)downloadPrompter
{
  return self->_downloadPrompter;
}

- (void)setAudioCoordinator:(id)a3
{
}

- (CSAttSiriAudioCoordinator)audioCoordinator
{
  return self->_audioCoordinator;
}

- (void)setEndpointDetectedSelfLogger:(id)a3
{
}

- (CSEndpointDetectedSelfLogger)endpointDetectedSelfLogger
{
  return self->_endpointDetectedSelfLogger;
}

- (void)setAudioMessageRequestHandler:(id)a3
{
}

- (CSSiriAudioMessageRequestHandler)audioMessageRequestHandler
{
  return self->_audioMessageRequestHandler;
}

- (void)setBridgeMessageHandler:(id)a3
{
}

- (CSAttSiriBridgeMessageHandler)bridgeMessageHandler
{
  return self->_bridgeMessageHandler;
}

- (void)setContinuityEndDetector:(id)a3
{
}

- (CSAttSiriContinuityEndDetector)continuityEndDetector
{
  return self->_continuityEndDetector;
}

- (void)setTcuGenerator:(id)a3
{
}

- (CSAttSiriTCUGenerator)tcuGenerator
{
  return self->_tcuGenerator;
}

- (void)setRcHandler:(id)a3
{
}

- (CSAttSiriRCHandler)rcHandler
{
  return self->_rcHandler;
}

- (void)setNldaClassifierNode:(id)a3
{
}

- (CSAttSiriNLDAClassifierNode)nldaClassifierNode
{
  return self->_nldaClassifierNode;
}

- (void)setAFTMNode:(id)a3
{
}

- (CSAttSiriAFTMNode)aFTMNode
{
  return self->_aFTMNode;
}

- (void)setSiriEnabledMonitor:(id)a3
{
}

- (CSSiriEnabledMonitor)siriEnabledMonitor
{
  return self->_siriEnabledMonitor;
}

- (void)setSpeechManager:(id)a3
{
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setVtAsset:(id)a3
{
}

- (CSAsset)vtAsset
{
  return self->_vtAsset;
}

- (void)setMitigationAsset:(id)a3
{
}

- (CSAsset)mitigationAsset
{
  return self->_mitigationAsset;
}

- (void)setSiriClientStream:(id)a3
{
}

- (CSAudioStream)siriClientStream
{
  return self->_siriClientStream;
}

- (void)setIntuitiveConvAudioCaptureMonitor:(id)a3
{
}

- (CSIntuitiveConvAudioCaptureMonitor)intuitiveConvAudioCaptureMonitor
{
  return self->_intuitiveConvAudioCaptureMonitor;
}

- (void)setSiriClientBehaviorMonitor:(id)a3
{
}

- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor
{
  return self->_siriClientBehaviorMonitor;
}

- (void)setRequestMHUUID:(id)a3
{
}

- (NSString)requestMHUUID
{
  return self->_requestMHUUID;
}

- (void)setAttSiriTransaction:(id)a3
{
}

- (CSOSTransaction)attSiriTransaction
{
  return self->_attSiriTransaction;
}

- (void)setAudioRecordContext:(id)a3
{
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (void)setTargetQueueForASR:(id)a3
{
}

- (OS_dispatch_queue)targetQueueForASR
{
  return self->_targetQueueForASR;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setSsrNode:(id)a3
{
}

- (CSAttSiriSSRNode)ssrNode
{
  return self->_ssrNode;
}

- (void)setAudioSrcNode:(id)a3
{
}

- (CSAttSiriAudioSrcNode)audioSrcNode
{
  return self->_audioSrcNode;
}

- (void)setUresNode:(id)a3
{
}

- (CSAttSiriUresNode)uresNode
{
  return self->_uresNode;
}

- (void)setSpeechRecognitionNode:(id)a3
{
}

- (CSAttSiriSpeechRecognitionNode)speechRecognitionNode
{
  return self->_speechRecognitionNode;
}

- (void)setOsdNode:(id)a3
{
}

- (CSAttSiriOSDNode)osdNode
{
  return self->_osdNode;
}

- (void)setEndpointerNode:(id)a3
{
}

- (CSAttSiriEndpointerNode)endpointerNode
{
  return self->_endpointerNode;
}

- (void)setNodesCache:(id)a3
{
}

- (NSMapTable)nodesCache
{
  return self->_nodesCache;
}

- (void)setAttendingStatesMessageHandler:(id)a3
{
}

- (CSAttendingStatesMessageHandling)attendingStatesMessageHandler
{
  return self->_attendingStatesMessageHandler;
}

- (void)setHintProvider:(id)a3
{
}

- (CSAttendingHintProviding)hintProvider
{
  return self->_hintProvider;
}

- (CSIntuitiveConvRequestHandlerDelegate)requestHandlerDelegate
{
  return self->_requestHandlerDelegate;
}

- (id)fetchRecordingEventUUIDToIgnore
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10003C638;
  v10 = sub_10003C648;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003C650;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_createRequestLinkInfo:(id)a3 component:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = objc_alloc((Class)SISchemaUUID);
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:v5];

  id v8 = [v6 initWithNSUUID:v7];
  id v9 = objc_alloc_init((Class)SISchemaRequestLinkInfo);
  [v9 setUuid:v8];
  [v9 setComponent:v4];

  return v9;
}

- (void)emitRequestLinkEventForMHUUID:(id)a3 withRequestId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSIntuitiveConvRequestHandler *)self _createRequestLinkInfo:v7 component:1];
  id v9 = [(CSIntuitiveConvRequestHandler *)self _createRequestLinkInfo:v6 component:9];
  id v10 = objc_alloc_init((Class)SISchemaRequestLink);
  [v10 setSource:v8];
  [v10 setTarget:v9];
  id v11 = +[AssistantSiriAnalytics sharedStream];
  [v11 emitMessage:v10];

  v12 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    v14 = "-[CSIntuitiveConvRequestHandler emitRequestLinkEventForMHUUID:withRequestId:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Emit link msg for mhId %@ with reqId %@", (uint8_t *)&v13, 0x20u);
  }
}

- (id)_startStreamOptionWithMachAbsTime:(unint64_t)a3
{
  uint64_t v4 = +[CSAudioStartStreamOption noAlertOption];
  [v4 setRequestHistoricalAudioDataWithHostTime:1];
  [v4 setStartRecordingHostTime:a3];
  [v4 setRequireSingleChannelLookup:1];
  [v4 setSelectedChannel:0];
  return v4;
}

- (id)_startStreamOption
{
  uint64_t v3 = mach_absolute_time();
  return [(CSIntuitiveConvRequestHandler *)self _startStreamOptionWithMachAbsTime:v3];
}

- (void)attSiriAudioSrcNodeDidStopUnexpectedly:(id)a3
{
  uint64_t v4 = [(CSIntuitiveConvRequestHandler *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C9B8;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (BOOL)_isRequestIdCurrent:(id)a3
{
  if (a3) {
    return -[NSString isEqualToString:](self->_currentRequestId, "isEqualToString:");
  }
  else {
    return 1;
  }
}

- (void)_handleStopProcessingForRequestId:(id)a3
{
  id v4 = a3;
  id v5 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[CSIntuitiveConvRequestHandler _handleStopProcessingForRequestId:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s requestId:%@", (uint8_t *)&v8, 0x16u);
  }
  if ([(CSIntuitiveConvRequestHandler *)self _isRequestIdCurrent:v4])
  {
    [(CSAttSiriEndpointerNode *)self->_endpointerNode stop];
    [(CSAttSiriOSDNode *)self->_osdNode stop];
    [(CSAttSiriAFTMNode *)self->_aFTMNode stop];
    [(CSAttSiriSSRNode *)self->_ssrNode stop];
    [(CSAttSiriEagerMitigator *)self->_eagerMitigator requestEndedForId:self->_currentRequestId];
  }
  else
  {
    id v6 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      currentRequestId = self->_currentRequestId;
      int v8 = 136315650;
      id v9 = "-[CSIntuitiveConvRequestHandler _handleStopProcessingForRequestId:]";
      __int16 v10 = 2112;
      id v11 = v4;
      __int16 v12 = 2112;
      int v13 = currentRequestId;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Stop received for invalid requestId:%@, currentRequestId:%@", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (void)_handleStartProcessingWithRecordContext:(id)a3 withAudioStartStreamOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v43 = "-[CSIntuitiveConvRequestHandler _handleStartProcessingWithRecordContext:withAudioStartStreamOptions:completion:]";
    __int16 v44 = 2112;
    id v45 = v8;
    __int16 v46 = 2112;
    id v47 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s recordContext:%@, streamOptions:%@", buf, 0x20u);
  }
  if ([v8 isVoiceTriggered])
  {
    __int16 v12 = +[CSVoiceTriggerEventInfoProvider sharedInstance];
    id v41 = 0;
    [v12 fetchVoiceTriggerInfoWithAudioContext:v8 resultVoiceTriggerInfo:&v41 resultRTSTriggerInfo:0];
    id v13 = v41;
  }
  else
  {
    id v13 = 0;
  }
  if ([v8 type] == (id)17 || objc_msgSend(v8, "type") == (id)18)
  {
    v14 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[CSIntuitiveConvRequestHandler _handleStartProcessingWithRecordContext:withAudioStartStreamOptions:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Skip processing for remora requests!", buf, 0xCu);
    }
  }
  else
  {
    [(CSAttSiriOSDNode *)self->_osdNode setPrefetchedAsset:self->_mitigationAsset];
    [(CSAttSiriUresNode *)self->_uresNode setPrefetchedAsset:self->_mitigationAsset];
    [(CSAttSiriEagerMitigator *)self->_eagerMitigator setPrefetchedAsset:self->_mitigationAsset];
    [(CSAttSiriSpeechRecognitionNode *)self->_speechRecognitionNode prepareToStartSpeechRequestWithStartStreamOption:v9 audioRecordContext:v8 voiceTriggerInfo:v13];
    [(CSAttSiriSpeechRecognitionNode *)self->_speechRecognitionNode start];
    v36 = -[CSEndpointerSettings initWithDisableEndpointer:]([CSEndpointerSettings alloc], "initWithDisableEndpointer:", [v9 disableEndpointer]);
    -[CSAttSiriOSDNode resetForNewRequestWithRecordContext:endpointerSettings:voiceTriggerInfo:](self->_osdNode, "resetForNewRequestWithRecordContext:endpointerSettings:voiceTriggerInfo:", v8);
    endpointerNode = self->_endpointerNode;
    +[CSConfig inputRecordingSampleRate];
    [(CSAttSiriEndpointerNode *)endpointerNode resetForNewRequestWithSampleRate:(unint64_t)v16 recordContext:v8 recordOption:v9 voiceTriggerInfo:v13];
    tcuGenerator = self->_tcuGenerator;
    id v18 = [v9 siriSessionUUID];
    [(CSAttSiriTCUGenerator *)tcuGenerator startWithRecordContext:v8 withRequestId:v18];

    [(CSEndpointDetectedSelfLogger *)self->_endpointDetectedSelfLogger reset];
    -[CSAttSiriContinuityEndDetector setUpWithContinuityEndUsage:](self->_continuityEndDetector, "setUpWithContinuityEndUsage:", [v8 isDictation] ^ 1);
    eagerMitigator = self->_eagerMitigator;
    v20 = [v9 siriSessionUUID];
    [(CSAttSiriEagerMitigator *)eagerMitigator requestStartedWithId:v20 forRecordContext:v8];

    uint64_t v21 = [(CSAsset *)self->_mitigationAsset getCategoryKeyWithRecordCtx:v8];
    if ((CSIsCommunalDevice() & 1) != 0
      || [(CSAsset *)self->_mitigationAsset shouldRunSpkrIdForCategory:v21])
    {
      [(CSAttSiriSSRNode *)self->_ssrNode setPrefetchedAsset:self->_vtAsset];
      ssrNode = self->_ssrNode;
      v23 = [v9 siriSessionUUID];
      [(CSAttSiriSSRNode *)ssrNode resetForNewRequestWithRecordContext:v8 voiceTriggerInfo:v13 withReqId:v23];
    }
    v24 = @"AcousticSLTaskTypeVoiceTrigger";
    v25 = @"AcousticSLTaskTypeVoiceTrigger";
    if ([v8 isContinuousConversation])
    {
      v24 = @"AcousticSLTaskTypeContConv";
      v26 = @"AcousticSLTaskTypeContConv";
    }
    -[CSAttSiriAFTMNode setPrefetchedAsset:](self->_aFTMNode, "setPrefetchedAsset:", self->_mitigationAsset, v21);
    aFTMNode = self->_aFTMNode;
    v28 = [v9 siriSessionUUID];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10003D09C;
    v37[3] = &unk_10024FEA0;
    id v38 = v8;
    v39 = self;
    id v29 = v9;
    id v40 = v29;
    [(CSAttSiriAFTMNode *)aFTMNode startRequestWithContext:v38 withVtei:v13 taskType:v24 withRequestId:v28 completion:v37];

    signalsLogger = self->_signalsLogger;
    audioRecordContext = self->_audioRecordContext;
    v32 = [v29 siriSessionUUID];
    [(CSIntuitiveConversationLogger *)signalsLogger startLoggingWithAudioRecordContext:audioRecordContext requestId:v32];

    if (+[CSUtils supportsAudioMessage])
    {
      audioMessageRequestHandler = self->_audioMessageRequestHandler;
      v34 = [v29 siriSessionUUID];
      [(CSSiriAudioMessageRequestHandler *)audioMessageRequestHandler startLoggingWithRequestId:v34 recordContext:self->_audioRecordContext];
    }
  }
}

- (void)_setupAudioSrcNodeWithSiriClientStream:(id)a3
{
  id v4 = a3;
  id v5 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[CSIntuitiveConvRequestHandler _setupAudioSrcNodeWithSiriClientStream:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  [(CSAttSiriAudioCoordinator *)self->_audioCoordinator reset];
  [(CSAttSiriAudioSrcNode *)self->_audioSrcNode attachToMasterStream:v4 name:@"CSIntuitiveConvRequestHandler" completion:&stru_10024F080];
}

- (void)_fetchRequiredAssetsForRecordContext:(id)a3
{
  if (([a3 isDictation] & 1) == 0)
  {
    [(CSIntuitiveConvRequestHandler *)self _fetchVoiceTriggerAssets];
    [(CSIntuitiveConvRequestHandler *)self _fetchMitigationAssets];
  }
}

- (void)_fetchVoiceTriggerAssets
{
  uint64_t v3 = +[CSVoiceTriggerAssetHandler sharedHandler];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003D55C;
  v4[3] = &unk_100252DF0;
  v4[4] = self;
  [v3 getVoiceTriggerAssetWithEndpointId:0 completion:v4];
}

- (void)_fetchMitigationAssets
{
  uint64_t v3 = +[CSAttSiriMitigationAssetHandler sharedHandler];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003D80C;
  v4[3] = &unk_100252DF0;
  v4[4] = self;
  [v3 getMitigationAssetWithEndpointId:0 completion:v4];
}

- (void)mxSessionMonitorSomeClientWentActive:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003DA6C;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_stopMonitoringAudioSession
{
  if (self->_audioSessionMonitoringInProgress)
  {
    uint64_t v3 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[CSIntuitiveConvRequestHandler _stopMonitoringAudioSession]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
    }
    id v4 = +[CSMXSessionMonitor sharedInstance];
    [v4 removeObserver:self];

    self->_audioSessionMonitoringInProgress = 0;
  }
}

- (void)_startMonitoringAudioSession
{
  if (!self->_audioSessionMonitoringInProgress)
  {
    uint64_t v3 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[CSIntuitiveConvRequestHandler _startMonitoringAudioSession]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
    }
    id v4 = +[CSMXSessionMonitor sharedInstance];
    [v4 addObserver:self];

    self->_audioSessionMonitoringInProgress = 1;
  }
}

- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4
{
  audioSrcNode = self->_audioSrcNode;
  if (audioSrcNode)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10003DD60;
    v6[3] = &unk_10024F010;
    v6[4] = self;
    -[CSAttSiriAudioSrcNode fetchRoutesWithCompletion:](audioSrcNode, "fetchRoutesWithCompletion:", v6, a4);
  }
}

- (void)siriPromptWillStart
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003DFD4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriUIDismissed
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E100;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_attendingDismissalAndBlockHelper
{
  uint64_t v3 = [(CSAudioStream *)self->_siriClientStream startStreamOption];
  id v4 = [v3 siriSessionUUID];
  dismissedRequestId = self->_dismissedRequestId;
  self->_dismissedRequestId = v4;

  id v6 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = self->_dismissedRequestId;
    int v10 = 136315394;
    id v11 = "-[CSIntuitiveConvRequestHandler _attendingDismissalAndBlockHelper]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s dismissed requestId : %@", (uint8_t *)&v10, 0x16u);
  }
  id v8 = [[CSAttendingStopHintInfo alloc] initWithOrigin:1 reason:4];
  [(CSAttendingHintProviding *)self->_hintProvider postAttendingStopHintWithInfo:v8];
  [(CSIntuitiveConvRequestHandler *)self _stopMonitoringAudioSession];
  [(CSAggressiveECModeHandler *)self->_aggressiveECHandler siriDismissed];
  pendingAttendingStartRootRequestID = self->_pendingAttendingStartRootRequestID;
  self->_pendingAttendingStartRootRequestID = 0;

  self->_pendingStartAttendingDecision = 0;
  [(CSAttSiriSSRNode *)self->_ssrNode handleSiriSessionEnd];
}

- (void)attendingXpcDisconnection
{
  uint64_t v3 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[CSIntuitiveConvRequestHandler attendingXpcDisconnection]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Triggering asset refresh due to XPC disconnection", buf, 0xCu);
  }
  id v4 = +[CSAttSiriMitigationAssetHandler sharedHandler];
  [v4 triggerAssetRefresh];

  int v5 = +[CSVoiceTriggerAssetHandler sharedHandler];
  [v5 triggerAssetRefresh];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E3E0;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dismissAttendingRequested
{
  uint64_t v3 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[CSIntuitiveConvRequestHandler dismissAttendingRequested]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Triggering asset refresh at Siri UI dismissal", buf, 0xCu);
  }
  id v4 = +[CSAttSiriMitigationAssetHandler sharedHandler];
  [v4 triggerAssetRefresh];

  int v5 = +[CSVoiceTriggerAssetHandler sharedHandler];
  [v5 triggerAssetRefresh];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E520;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E5A0;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSSiriEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSIntuitiveConvRequestHandler CSSiriEnabledMonitor:didReceiveEnabled:]";
    __int16 v12 = 1026;
    BOOL v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Siri enabled : %{public}d", buf, 0x12u);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003E774;
  v8[3] = &unk_100253AB8;
  BOOL v9 = v4;
  v8[4] = self;
  dispatch_async(queue, v8);
}

- (void)_handleClientPreparedAudioStream:(id)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (v4)
  {
    objc_storeStrong((id *)&self->_siriClientStream, a3);
    id v8 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      BOOL v13 = "-[CSIntuitiveConvRequestHandler _handleClientPreparedAudioStream:successfully:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Cached siri client stream, attach after nodes start", (uint8_t *)&v12, 0xCu);
    }
    BOOL v9 = [(CSAudioStream *)self->_siriClientStream streamRequest];
    int v10 = [v9 recordContext];
    [(CSIntuitiveConvRequestHandler *)self _fetchRequiredAssetsForRecordContext:v10];
  }
  else
  {
    id v11 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      BOOL v13 = "-[CSIntuitiveConvRequestHandler _handleClientPreparedAudioStream:successfully:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Skip asking audioSrcNode to prepare since Siri client failed to prepare audio", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (id)_recordContextForContinuousConversation
{
  uint64_t v3 = [(CSSiriClientBehaviorMonitor *)self->_siriClientBehaviorMonitor recordRoute];
  BOOL v4 = [(CSSiriClientBehaviorMonitor *)self->_siriClientBehaviorMonitor deviceId];
  if ([(CSAudioRecordContext *)self->_audioRecordContext isContinuousConversation])
  {
    id v5 = [(CSAudioRecordContext *)self->_audioRecordContext copy];
  }
  else
  {
    id v5 = +[CSAudioRecordContext contextForContinuousConversationWithRecordRoute:v3 deviceId:v4];
  }
  id v6 = v5;

  return v6;
}

- (void)_generateStartAttendingHint:(id)a3 attendingDecision:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    *(_DWORD *)float v16 = 136315650;
    *(void *)&v16[4] = "-[CSIntuitiveConvRequestHandler _generateStartAttendingHint:attendingDecision:]";
    *(_WORD *)&v16[12] = 2112;
    *(void *)&v16[14] = v6;
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    *(_WORD *)&v16[22] = 2112;
    CFStringRef v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s rootRequestId : %@, shouldStartAttending : %@", v16, 0x20u);
  }
  if (v4)
  {
    BOOL v9 = [CSAttendingStartHintInfo alloc];
    int v10 = [(CSIntuitiveConvRequestHandler *)self _recordContextForContinuousConversation];
    id v11 = [(CSAttendingStartHintInfo *)v9 initWithOrigin:1 reason:1 recordContext:v10 rootRequestId:v6 mhUUID:self->_requestMHUUID];

    [(CSAttendingHintProviding *)self->_hintProvider postAttendingStartHintWithInfo:v11];
    aggressiveECHandler = self->_aggressiveECHandler;
    uint64_t v13 = 1;
LABEL_13:
    -[CSAggressiveECModeHandler setAttendingState:](aggressiveECHandler, "setAttendingState:", v13, *(_OWORD *)v16, *(void *)&v16[16]);
    goto LABEL_14;
  }
  unsigned int v14 = 0;
  if (v6)
  {
    dismissedRequestId = self->_dismissedRequestId;
    if (dismissedRequestId) {
      unsigned int v14 = [(NSString *)dismissedRequestId isEqualToString:v6];
    }
  }
  id v11 = [[CSAttendingMagusNotSupportedHintInfo alloc] initWithOrigin:1 reason:1 rootRequestId:v6];
  [(CSAttendingHintProviding *)self->_hintProvider postAttendingMagusNotSupportedHintWithInfo:v11];
  [(CSAttSiriAssetDownloadPromptIOS *)self->_downloadPrompter checkIfNewAssetRequiredGivenCurrentVTAsset:self->_vtAsset mitigationAsset:self->_mitigationAsset];
  aggressiveECHandler = self->_aggressiveECHandler;
  if (!v14)
  {
    uint64_t v13 = 0;
    goto LABEL_13;
  }
  [(CSAggressiveECModeHandler *)aggressiveECHandler siriDismissed];
LABEL_14:
}

- (void)_cacheStartAttendingInfo:(id)a3 attendingDecision:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  objc_storeStrong((id *)&self->_pendingAttendingStartRootRequestID, a3);
  self->_pendingStartAttendingDecision = v4;
  CFStringRef v8 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    pendingAttendingStartRootRequestID = self->_pendingAttendingStartRootRequestID;
    int v10 = 136315650;
    id v11 = "-[CSIntuitiveConvRequestHandler _cacheStartAttendingInfo:attendingDecision:]";
    __int16 v12 = 1024;
    BOOL v13 = v4;
    __int16 v14 = 2112;
    __int16 v15 = pendingAttendingStartRootRequestID;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Cached: startAttendingDecision:%u, attendingStartRootRequestID:%@", (uint8_t *)&v10, 0x1Cu);
  }
}

- (void)_handleClientDidStopWithOption:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestId];
  id v6 = (void *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    CFStringRef v8 = [v4 description];
    *(_DWORD *)buf = 136315650;
    id v29 = "-[CSIntuitiveConvRequestHandler _handleClientDidStopWithOption:]";
    __int16 v30 = 2114;
    v31 = v8;
    __int16 v32 = 2114;
    v33 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s stopOption : %{public}@, stopOptionRequestId : %{public}@", buf, 0x20u);
  }
  if ([(CSIntuitiveConvRequestHandler *)self _isRequestIdCurrent:v5])
  {
    [(CSIntuitiveConvRequestHandler *)self _handleStopProcessingForRequestId:v5];
    BOOL v9 = [(CSAudioStream *)self->_siriClientStream startStreamOption];
    int v10 = [v9 siriSessionUUID];

    dismissedRequestId = self->_dismissedRequestId;
    unsigned int v12 = 1;
    if (dismissedRequestId && v10) {
      unsigned int v12 = ![(NSString *)dismissedRequestId isEqualToString:v10];
    }
    if ([v4 stopRecordingReason] == (id)5) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = [v4 supportsMagus] & v12;
    }
    float v16 = +[CSFPreferences sharedPreferences];
    unsigned int v17 = [v16 isBargeInSupportEnabled];
    char v18 = v17;
    int v19 = v17 ^ 1;

    v20 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v29 = "-[CSIntuitiveConvRequestHandler _handleClientDidStopWithOption:]";
      __int16 v30 = 1024;
      LODWORD(v31) = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s BargeIn disabled:%u", buf, 0x12u);
    }
    uint64_t v21 = +[CSCarKitUtils sharedInstance];
    unsigned int v22 = [v21 isBargeInDisabledForConnectedVehicle];

    if (v22)
    {
      audioSrcNode = self->_audioSrcNode;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10003EF84;
      v24[3] = &unk_10024F060;
      v24[4] = self;
      char v26 = v19;
      id v25 = v10;
      char v27 = v13;
      [(CSAttSiriAudioSrcNode *)audioSrcNode fetchRoutesWithCompletion:v24];
    }
    else if (v18)
    {
      [(CSIntuitiveConvRequestHandler *)self _generateStartAttendingHint:v10 attendingDecision:v13];
    }
    else
    {
      [(CSIntuitiveConvRequestHandler *)self _cacheStartAttendingInfo:v10 attendingDecision:v13];
    }
  }
  else
  {
    __int16 v14 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      currentRequestId = self->_currentRequestId;
      *(_DWORD *)buf = 136315650;
      id v29 = "-[CSIntuitiveConvRequestHandler _handleClientDidStopWithOption:]";
      __int16 v30 = 2112;
      v31 = v5;
      __int16 v32 = 2112;
      v33 = currentRequestId;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Stop received for invalid requestId:%@, currentRequestId:%@", buf, 0x20u);
    }
  }
}

- (void)_handleClientWillStopStreamWithReason:(unint64_t)a3 stopStreamOption:(id)a4
{
}

- (void)_handleClientDidStartStreamWithOption:(id)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    CFStringRef v8 = [v6 requestMHUUID];
    requestMHUUID = self->_requestMHUUID;
    self->_requestMHUUID = v8;

    int v10 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = self->_requestMHUUID;
      *(_DWORD *)buf = 136315650;
      unsigned int v17 = "-[CSIntuitiveConvRequestHandler _handleClientDidStartStreamWithOption:successfully:]";
      __int16 v18 = 2112;
      int v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s _requestMHUUID set to :%@ option:%@", buf, 0x20u);
    }
    [(CSAttSiriAFTMNode *)self->_aFTMNode setMhId:self->_requestMHUUID];
    [(CSAttSiriSSRNode *)self->_ssrNode setMhId:self->_requestMHUUID];
    [(CSAttSiriSpeechRecognitionNode *)self->_speechRecognitionNode setMhId:self->_requestMHUUID];
    [(CSIntuitiveConversationLogger *)self->_signalsLogger setMhId:self->_requestMHUUID];
    [(CSAttSiriTCUGenerator *)self->_tcuGenerator setMhId:self->_requestMHUUID];
    [(CSAttSiriEndpointerNode *)self->_endpointerNode setMhId:self->_requestMHUUID];
    [(CSEndpointDetectedSelfLogger *)self->_endpointDetectedSelfLogger setMhId:self->_requestMHUUID];
    [(CSAttSiriOSDNode *)self->_osdNode setMhId:self->_requestMHUUID];
    audioSrcNode = self->_audioSrcNode;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003F2F0;
    v15[3] = &unk_10024F010;
    v15[4] = self;
    [(CSAttSiriAudioSrcNode *)audioSrcNode fetchRoutesWithCompletion:v15];
  }
  else
  {
    uint64_t v13 = [v6 siriSessionUUID];
    [(CSIntuitiveConvRequestHandler *)self _handleStopProcessingForRequestId:v13];

    __int16 v14 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v17 = "-[CSIntuitiveConvRequestHandler _handleClientDidStartStreamWithOption:successfully:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Skip asking audioSrcNode to record since Siri client failed to start audio", buf, 0xCu);
    }
  }
}

- (void)_handleClientWillStartStreamWithContext:(id)a3 option:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    float v16 = "-[CSIntuitiveConvRequestHandler _handleClientWillStartStreamWithContext:option:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s context : %@", (uint8_t *)&v15, 0x16u);
  }
  BOOL v9 = [v7 siriSessionUUID];
  currentRequestId = self->_currentRequestId;
  self->_currentRequestId = v9;

  id v11 = (CSAudioRecordContext *)[v6 copy];
  audioRecordContext = self->_audioRecordContext;
  self->_audioRecordContext = v11;

  [(CSIntuitiveConvRequestHandler *)self _handleStartProcessingWithRecordContext:self->_audioRecordContext withAudioStartStreamOptions:v7 completion:0];
  if (self->_siriClientStream) {
    -[CSIntuitiveConvRequestHandler _setupAudioSrcNodeWithSiriClientStream:](self, "_setupAudioSrcNodeWithSiriClientStream:");
  }
  uint64_t v13 = [[CSAttendingStopHintInfo alloc] initWithOrigin:1 reason:1];
  [(CSAttendingHintProviding *)self->_hintProvider postAttendingStopHintWithInfo:v13];
  __int16 v14 = [v7 requestMHUUID];
  [(CSIntuitiveConvRequestHandler *)self emitRequestLinkEventForMHUUID:v14 withRequestId:self->_currentRequestId];
}

- (void)notifyRequestCompletion
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F6A4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 preparedSiriClientAudioStream:(id)a4 successfully:(BOOL)a5
{
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F98C;
  block[3] = &unk_1002537C0;
  block[4] = self;
  id v11 = v7;
  BOOL v12 = a5;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 fetchedSiriClientAudioStream:(id)a4 successfully:(BOOL)a5
{
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FA44;
  block[3] = &unk_1002537C0;
  block[4] = self;
  id v11 = v7;
  BOOL v12 = a5;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FB1C;
  block[3] = &unk_100253540;
  block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5 withEventUUID:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003FC44;
  v14[3] = &unk_1002511C0;
  v14[4] = self;
  id v15 = v10;
  id v16 = v9;
  unint64_t v17 = a5;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(queue, v14);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  id v10 = a6;
  id v11 = a7;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003FD74;
  v15[3] = &unk_100252588;
  v15[4] = self;
  id v16 = v11;
  id v17 = v10;
  BOOL v18 = a5;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(queue, v15);
}

- (void)siriClientBehaviorMonitor:(id)a3 willStartStreamWithContext:(id)a4 option:(id)a5 withEventUUID:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003FEBC;
  v16[3] = &unk_100252E18;
  id v17 = v10;
  BOOL v18 = self;
  id v19 = v11;
  id v20 = v9;
  id v13 = v9;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(queue, v16);
}

- (void)intuitiveConvAudioCaptureMonitor:(id)a3 fetchedAudioStream:(id)a4 successfully:(BOOL)a5
{
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040098;
  block[3] = &unk_1002537C0;
  block[4] = self;
  id v11 = v7;
  BOOL v12 = a5;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)intuitiveConvAudioCaptureMonitorDidStopAudioCapture:(id)a3 stopStreamOption:(id)a4 eventUUID:(id)a5
{
  id v6 = a4;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100040140;
  v9[3] = &unk_100253B08;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)intuitiveConvAudioCaptureMonitor:(id)a3 willStopAudioCaptureReason:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000401C0;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)intuitiveConvAudioCaptureMonitor:(id)a3 didStartAudioCaptureSuccessfully:(BOOL)a4 option:(id)a5 eventUUID:(id)a6
{
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040278;
  block[3] = &unk_1002537C0;
  BOOL v14 = a4;
  id v12 = v8;
  id v13 = self;
  id v10 = v8;
  dispatch_async(queue, block);
}

- (void)intuitiveConvAudioCaptureMonitor:(id)a3 willStartAudioCaptureWithContext:(id)a4 option:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040414;
  block[3] = &unk_100253540;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)setRequestHandlerDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000404BC;
  v7[3] = &unk_100253B08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_configureAllNodes
{
  if (self->_bridgeMessageHandler)
  {
    -[CSAttSiriSpeechRecognitionNode addResultCandidateReceiver:](self->_speechRecognitionNode, "addResultCandidateReceiver:");
    [(CSAttSiriSpeechRecognitionNode *)self->_speechRecognitionNode addSpeechRecognitionReceiver:self->_bridgeMessageHandler];
    [(CSAttSiriEndpointerNode *)self->_endpointerNode addReceiver:self->_bridgeMessageHandler];
    uint64_t v3 = [[CSAttSiriAssetDownloadPromptIOS alloc] initWithDelegate:self->_bridgeMessageHandler];
    downloadPrompter = self->_downloadPrompter;
    self->_downloadPrompter = v3;
  }
  if (self->_supportTCU)
  {
    [(CSAttSiriTCUGenerator *)self->_tcuGenerator addTCUReceiver:self->_continuityEndDetector];
    [(CSAttSiriTCUGenerator *)self->_tcuGenerator addTCUReceiver:self->_bridgeMessageHandler];
    [(CSAttSiriContinuityEndDetector *)self->_continuityEndDetector addContinuityDetectionReceiver:self->_bridgeMessageHandler];
    [(CSAttSiriTCUGenerator *)self->_tcuGenerator setDelegate:self->_endpointerNode];
    [(CSAttSiriTCUGenerator *)self->_tcuGenerator addTCUReceiver:self->_uresNode];
    [(CSAttSiriTCUGenerator *)self->_tcuGenerator addTRPCandidateExecutionStateReceiver:self->_continuityEndDetector];
  }
  audioSrcNode = self->_audioSrcNode;
  if (audioSrcNode) {
    [(CSAttSiriAudioSrcNode *)audioSrcNode setDelegate:self];
  }
  if (self->_audioCoordinator)
  {
    -[CSAttSiriAudioSrcNode addReceiver:](self->_audioSrcNode, "addReceiver:");
    [(CSAttSiriEndpointerNode *)self->_endpointerNode addReceiver:self->_audioCoordinator];
    [(CSSiriClientBehaviorMonitor *)self->_siriClientBehaviorMonitor registerObserver:self->_audioCoordinator];
    [(CSIntuitiveConvAudioCaptureMonitor *)self->_intuitiveConvAudioCaptureMonitor registerObserver:self->_audioCoordinator];
  }
  endpointerNode = self->_endpointerNode;
  if (endpointerNode)
  {
    [(CSAttSiriEndpointerNode *)endpointerNode setDelegate:self];
    [(CSAttSiriOSDNode *)self->_osdNode addReceiver:self->_endpointerNode];
    [(CSAttSiriAudioCoordinator *)self->_audioCoordinator addReceiver:self->_endpointerNode];
    [(CSAttSiriSpeechRecognitionNode *)self->_speechRecognitionNode addEndpointFeatureReceiver:self->_endpointerNode];
    [(CSAttSiriSpeechRecognitionNode *)self->_speechRecognitionNode addResultCandidateReceiver:self->_endpointerNode];
    [(CSAttSiriRCHandler *)self->_rcHandler addResultCandidateReceiver:self->_endpointerNode];
  }
  if (self->_osdNode)
  {
    -[CSAttSiriAudioCoordinator addReceiver:](self->_audioCoordinator, "addReceiver:");
    +[CSUtils isContinuousConversationSupported];
  }
  if (self->_ssrNode) {
    -[CSAttSiriAudioCoordinator addReceiver:](self->_audioCoordinator, "addReceiver:");
  }
  speechRecognitionNode = self->_speechRecognitionNode;
  if (speechRecognitionNode)
  {
    [(CSAttSiriSpeechRecognitionNode *)speechRecognitionNode registerEndpointerNode:self->_endpointerNode];
    [(CSAttSiriSpeechRecognitionNode *)self->_speechRecognitionNode registerSSRNode:self->_ssrNode];
    [(CSAttSiriSpeechRecognitionNode *)self->_speechRecognitionNode addSpeechRecognitionReceiver:self->_attendingStatesMessageHandler];
    [(CSAttSiriAudioCoordinator *)self->_audioCoordinator addReceiver:self->_speechRecognitionNode];
    [(CSAttSiriEndpointerNode *)self->_endpointerNode addReceiver:self->_speechRecognitionNode];
  }
  if (self->_uresNode)
  {
    if (+[CSUtils supportsUnderstandingOnDevice])
    {
      [(CSAttSiriUresNode *)self->_uresNode registerSSRNode:self->_ssrNode];
      [(CSAttSiriUresNode *)self->_uresNode registerOSDNode:self->_osdNode];
      [(CSAttSiriSpeechRecognitionNode *)self->_speechRecognitionNode addReceiver:self->_uresNode];
      [(CSAttSiriAFTMNode *)self->_aFTMNode addReceiver:self->_uresNode];
      [(CSAttSiriOSDNode *)self->_osdNode addReceiver:self->_uresNode];
      [(CSAttSiriSSRNode *)self->_ssrNode addReceiver:self->_uresNode];
      [(CSAttSiriNLDAClassifierNode *)self->_nldaClassifierNode addReceiver:self->_uresNode];
      [(CSAttSiriSpeechRecognitionNode *)self->_speechRecognitionNode addEndpointFeatureReceiver:self->_uresNode];
      [(CSAttSiriSpeechRecognitionNode *)self->_speechRecognitionNode addSpeechRecognitionReceiver:self->_uresNode];
      [(CSAttSiriTCUGenerator *)self->_tcuGenerator registerUresNode:self->_uresNode];
      if (self->_supportTCU)
      {
        id v8 = objc_alloc_init(CSAttSiriEagerMitigator);
        eagerMitigator = self->_eagerMitigator;
        self->_eagerMitigator = v8;

        [(CSAttSiriUresNode *)self->_uresNode addReceiver:self->_eagerMitigator];
      }
    }
  }
  if (self->_nldaClassifierNode) {
    -[CSAttSiriUresNode registerNLDAClassifierNode:](self->_uresNode, "registerNLDAClassifierNode:");
  }
  if (self->_tcuGenerator)
  {
    -[CSAttSiriEndpointerNode addReceiver:](self->_endpointerNode, "addReceiver:");
    [(CSAttSiriSpeechRecognitionNode *)self->_speechRecognitionNode addResultCandidateReceiver:self->_tcuGenerator];
    [(CSAttSiriSpeechRecognitionNode *)self->_speechRecognitionNode addRecognitionTaskCompletionReceiver:self->_tcuGenerator];
    [(CSAttSiriContinuityEndDetector *)self->_continuityEndDetector addContinuityDetectionReceiver:self->_tcuGenerator];
    [(CSAttSiriEndpointerNode *)self->_endpointerNode registerEndpointerProxyAt:self->_tcuGenerator];
    [(CSAttSiriRCHandler *)self->_rcHandler addResultCandidateReceiver:self->_tcuGenerator];
    [(CSAttSiriUresNode *)self->_uresNode registerTCUGenerator:self->_tcuGenerator];
  }
  if (self->_continuityEndDetector)
  {
    -[CSAttSiriTCUGenerator addRecognitionTaskCompletionReceiver:](self->_tcuGenerator, "addRecognitionTaskCompletionReceiver:");
    [(CSAttSiriContinuityEndDetector *)self->_continuityEndDetector addRecognitionTaskCompletionReceiver:self->_attendingStatesMessageHandler];
    [(CSAttSiriContinuityEndDetector *)self->_continuityEndDetector addRecognitionTaskCompletionReceiver:self->_bridgeMessageHandler];
  }
  if (self->_aFTMNode
    && +[CSUtils supportsUnderstandingOnDevice])
  {
    [(CSAttSiriAudioCoordinator *)self->_audioCoordinator addReceiver:self->_aFTMNode];
  }
  id v10 = +[CSFPreferences sharedPreferences];
  unsigned int v11 = [v10 isAttentiveSiriAudioLoggingEnabled];

  if (v11 && self->_signalsLogger) {
    -[CSAttSiriAudioCoordinator addReceiver:](self->_audioCoordinator, "addReceiver:");
  }
  if (self->_audioMessageRequestHandler) {
    -[CSAttSiriAudioCoordinator addReceiver:](self->_audioCoordinator, "addReceiver:");
  }
  endpointDetectedSelfLogger = self->_endpointDetectedSelfLogger;
  if (endpointDetectedSelfLogger)
  {
    [(CSEndpointDetectedSelfLogger *)endpointDetectedSelfLogger registerEndpointerNode:self->_endpointerNode];
    [(CSAttSiriEndpointerNode *)self->_endpointerNode addReceiver:self->_endpointDetectedSelfLogger];
    [(CSAttSiriTCUGenerator *)self->_tcuGenerator addRecognitionTaskCompletionReceiver:self->_endpointDetectedSelfLogger];
    [(CSAttSiriTCUGenerator *)self->_tcuGenerator addTCUReceiver:self->_endpointDetectedSelfLogger];
    [(CSEndpointDetectedSelfLogger *)self->_endpointDetectedSelfLogger setup];
  }
  if (self->_audioMetricsNode)
  {
    audioCoordinator = self->_audioCoordinator;
    -[CSAttSiriAudioCoordinator addReceiver:](audioCoordinator, "addReceiver:");
  }
}

- (void)start
{
  uint64_t v3 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[CSIntuitiveConvRequestHandler start]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040A30;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)setup
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v3 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[CSIntuitiveConvRequestHandler setup]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(CSSiriClientBehaviorMonitor *)self->_siriClientBehaviorMonitor registerObserver:self];
  [(CSIntuitiveConvAudioCaptureMonitor *)self->_intuitiveConvAudioCaptureMonitor registerObserver:self];
  [(CSSiriEnabledMonitor *)self->_siriEnabledMonitor addObserver:self];
  [(CSAudioSessionInfoProvider *)self->_audioSessionInfoProvider registerObserver:self];
}

- (id)getAudioMessageServiceProxyObj
{
  return self->_audioMessageRequestHandler;
}

- (id)getRcHandlerProxyObj
{
  return self->_rcHandler;
}

- (id)getSsrProxyObj
{
  return self->_ssrNode;
}

- (id)getAsrProxyObj
{
  return self->_bridgeMessageHandler;
}

- (id)getEndpointerProxyObj
{
  return self->_endpointerNode;
}

- (CSIntuitiveConvRequestHandler)initWithAudioSrcNode:(id)a3 endpointerNode:(id)a4 osdNode:(id)a5 ssrNode:(id)a6 speechRecognitionNode:(id)a7 uresNode:(id)a8 needsSSRNode:(BOOL)a9 aFtmNode:(id)a10 speechManager:(id)a11 siriEnabledMonitor:(id)a12 siriClientBehaviorMonitor:(id)a13 intuitiveConvAudioCaptureMonitor:(id)a14 rcHandler:(id)a15 tcuGenerator:(id)a16 continuityEndDetector:(id)a17 bridgeMessageHandler:(id)a18 audioCoordinator:(id)a19 magusSupportedPolicy:(id)a20 supportsAcousticProgressiveChecker:(BOOL)a21 supportsUnderstandingOnDevice:(BOOL)a22 requireASROnDevice:(BOOL)a23 supportsHybridUnderstandingOnDevice:(BOOL)a24 supportsLogger:(BOOL)a25 supportTCU:(BOOL)a26 audioSessionInfoProvider:(id)a27 aggressiveECHandler:(id)a28
{
  id v33 = a3;
  id v111 = a4;
  id v110 = a5;
  id v104 = a6;
  id v103 = a7;
  id v102 = a8;
  id v34 = a10;
  id v35 = a11;
  id v36 = a12;
  id v37 = a13;
  id v38 = a14;
  id v39 = a15;
  id v40 = a16;
  id v41 = a17;
  id v105 = a18;
  id v109 = a19;
  id v108 = a20;
  id v107 = a27;
  id v106 = a28;
  v112.receiver = self;
  v112.super_class = (Class)CSIntuitiveConvRequestHandler;
  v42 = [(CSIntuitiveConvRequestHandler *)&v112 init];
  if (v42)
  {
    dispatch_queue_t v43 = dispatch_queue_create("CSIntuitiveConvRequestHandler queue", 0);
    queue = v42->_queue;
    v42->_queue = (OS_dispatch_queue *)v43;

    uint64_t v45 = +[CSUtils getSerialQueue:@"targetQueue for ASR" qualityOfService:33];
    targetQueueForASR = v42->_targetQueueForASR;
    v42->_targetQueueForASR = (OS_dispatch_queue *)v45;

    uint64_t v47 = +[NSMapTable strongToWeakObjectsMapTable];
    nodesCache = v42->_nodesCache;
    v42->_nodesCache = (NSMapTable *)v47;

    v42->_supportTCU = a26;
    if (v33) {
      v49 = (CSAttSiriAudioSrcNode *)v33;
    }
    else {
      v49 = [[CSAttSiriAudioSrcNode alloc] initWithTargetQueue:v42->_targetQueueForASR];
    }
    audioSrcNode = v42->_audioSrcNode;
    v42->_audioSrcNode = v49;

    if (v109) {
      v51 = (CSAttSiriAudioCoordinator *)v109;
    }
    else {
      v51 = [[CSAttSiriAudioCoordinator alloc] initWithTargetQueue:v42->_targetQueueForASR];
    }
    audioCoordinator = v42->_audioCoordinator;
    v42->_audioCoordinator = v51;

    if (v111) {
      v53 = (CSAttSiriEndpointerNode *)v111;
    }
    else {
      v53 = objc_alloc_init(CSAttSiriEndpointerNode);
    }
    endpointerNode = v42->_endpointerNode;
    v42->_endpointerNode = v53;

    if (a9)
    {
      if (v104) {
        v55 = (CSAttSiriSSRNode *)v104;
      }
      else {
        v55 = objc_alloc_init(CSAttSiriSSRNode);
      }
      ssrNode = v42->_ssrNode;
      v42->_ssrNode = v55;
    }
    if (a23 || a24)
    {
      if (v103) {
        v57 = (CSAttSiriSpeechRecognitionNode *)v103;
      }
      else {
        v57 = objc_alloc_init(CSAttSiriSpeechRecognitionNode);
      }
      speechRecognitionNode = v42->_speechRecognitionNode;
      v42->_speechRecognitionNode = v57;
    }
    if (a22 || a24)
    {
      if (v102) {
        v59 = (CSAttSiriUresNode *)v102;
      }
      else {
        v59 = objc_alloc_init(CSAttSiriUresNode);
      }
      uresNode = v42->_uresNode;
      v42->_uresNode = v59;

      v61 = objc_alloc_init(CSAttSiriNLDAClassifierNode);
      nldaClassifierNode = v42->_nldaClassifierNode;
      v42->_nldaClassifierNode = v61;

      if (v39) {
        v63 = (CSAttSiriRCHandler *)v39;
      }
      else {
        v63 = [[CSAttSiriRCHandler alloc] initWithEndpointerNode:v42->_endpointerNode uresNode:v42->_uresNode];
      }
      rcHandler = v42->_rcHandler;
      v42->_rcHandler = v63;
    }
    if (a21)
    {
      if (v34) {
        v65 = (CSAttSiriAFTMNode *)v34;
      }
      else {
        v65 = objc_alloc_init(CSAttSiriAFTMNode);
      }
      aFTMNode = v42->_aFTMNode;
      v42->_aFTMNode = v65;
    }
    if (v110) {
      v67 = (CSAttSiriOSDNode *)v110;
    }
    else {
      v67 = objc_alloc_init(CSAttSiriOSDNode);
    }
    osdNode = v42->_osdNode;
    v42->_osdNode = v67;

    if (v42->_supportTCU)
    {
      if (v40) {
        v69 = (CSAttSiriTCUGenerator *)v40;
      }
      else {
        v69 = objc_alloc_init(CSAttSiriTCUGenerator);
      }
      tcuGenerator = v42->_tcuGenerator;
      v42->_tcuGenerator = v69;
    }
    if (v41) {
      v71 = (CSAttSiriContinuityEndDetector *)v41;
    }
    else {
      v71 = objc_alloc_init(CSAttSiriContinuityEndDetector);
    }
    continuityEndDetector = v42->_continuityEndDetector;
    v42->_continuityEndDetector = v71;

    if (v105) {
      v73 = (CSAttSiriBridgeMessageHandler *)v105;
    }
    else {
      v73 = [[CSAttSiriBridgeMessageHandler alloc] initWithSpeechRecognitionNode:v42->_speechRecognitionNode tcuGenerator:v42->_tcuGenerator supportTCU:a26];
    }
    bridgeMessageHandler = v42->_bridgeMessageHandler;
    v42->_bridgeMessageHandler = v73;

    if (v35)
    {
      v75 = (CSSpeechManager *)v35;
    }
    else
    {
      v75 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
    }
    speechManager = v42->_speechManager;
    v42->_speechManager = v75;

    if (v36)
    {
      v77 = (CSSiriEnabledMonitor *)v36;
    }
    else
    {
      v77 = +[CSSiriEnabledMonitor sharedInstance];
    }
    siriEnabledMonitor = v42->_siriEnabledMonitor;
    v42->_siriEnabledMonitor = v77;

    if (v37)
    {
      v79 = (CSSiriClientBehaviorMonitor *)v37;
    }
    else
    {
      v79 = +[CSSiriClientBehaviorMonitor sharedInstance];
    }
    siriClientBehaviorMonitor = v42->_siriClientBehaviorMonitor;
    v42->_siriClientBehaviorMonitor = v79;

    if (v38)
    {
      v81 = (CSIntuitiveConvAudioCaptureMonitor *)v38;
    }
    else
    {
      v81 = +[CSIntuitiveConvAudioCaptureMonitor sharedInstance];
    }
    intuitiveConvAudioCaptureMonitor = v42->_intuitiveConvAudioCaptureMonitor;
    v42->_intuitiveConvAudioCaptureMonitor = v81;

    if (v106) {
      v83 = (CSAggressiveECModeHandler *)v106;
    }
    else {
      v83 = objc_alloc_init(CSAggressiveECModeHandler);
    }
    aggressiveECHandler = v42->_aggressiveECHandler;
    v42->_aggressiveECHandler = v83;

    if (a25)
    {
      v85 = objc_alloc_init(CSIntuitiveConversationLogger);
      signalsLogger = v42->_signalsLogger;
      v42->_signalsLogger = v85;

      [(CSIntuitiveConversationLogger *)v42->_signalsLogger start];
    }
    v87 = objc_alloc_init(CSSiriAudioMessageRequestHandler);
    audioMessageRequestHandler = v42->_audioMessageRequestHandler;
    v42->_audioMessageRequestHandler = v87;

    v89 = objc_alloc_init(CSEndpointDetectedSelfLogger);
    endpointDetectedSelfLogger = v42->_endpointDetectedSelfLogger;
    v42->_endpointDetectedSelfLogger = v89;

    if (v108)
    {
      v91 = (CSAttSiriMagusSupportedPolicy *)v108;
    }
    else
    {
      v91 = +[CSAttSiriMagusSupportedPolicy sharedInstance];
    }
    magusSupportedPolicy = v42->_magusSupportedPolicy;
    v42->_magusSupportedPolicy = v91;

    if (v107)
    {
      v93 = (CSAudioSessionInfoProvider *)v107;
    }
    else
    {
      v93 = +[CSAudioSessionInfoProvider sharedInstance];
    }
    audioSessionInfoProvider = v42->_audioSessionInfoProvider;
    v42->_audioSessionInfoProvider = v93;

    v42->_audioSessionMonitoringInProgress = 0;
    v95 = [[CSAttSiriAudioSessionStateClient alloc] initWithDelegate:v42];
    siriStateClient = v42->_siriStateClient;
    v42->_siriStateClient = v95;

    pendingAttendingStartRootRequestID = v42->_pendingAttendingStartRootRequestID;
    v42->_pendingAttendingStartRootRequestID = 0;

    v42->_pendingStartAttendingDecision = 0;
    if (+[CSUtils isExclaveHardware])
    {
      v98 = objc_alloc_init(CSAttSiriAudioMetricsNode);
      audioMetricsNode = v42->_audioMetricsNode;
      v42->_audioMetricsNode = v98;
    }
  }

  return v42;
}

- (CSIntuitiveConvRequestHandler)init
{
  if (CSIsCommunalDevice() & 1) != 0 || (CSIsIOS()) {
    char v3 = 1;
  }
  else {
    char v3 = CSIsMac();
  }
  unsigned __int8 v4 = +[CSUtils supportAcousticProgressiveChecker];
  unsigned __int8 v5 = +[CSUtils supportsUnderstandingOnDevice];
  unsigned __int8 v6 = +[CSUtils supportsSpeechRecognitionOnDevice];
  unsigned __int8 v7 = +[CSUtils supportsHybridUnderstandingOnDevice];
  unsigned __int8 v8 = +[CSUtils supportsLogger];
  BYTE5(v11) = +[CSUtils isTCUSupported];
  BYTE4(v11) = v8;
  BYTE3(v11) = v7;
  BYTE2(v11) = v6;
  BYTE1(v11) = v5;
  LOBYTE(v11) = v4;
  LOBYTE(v10) = v3;
  return -[CSIntuitiveConvRequestHandler initWithAudioSrcNode:endpointerNode:osdNode:ssrNode:speechRecognitionNode:uresNode:needsSSRNode:aFtmNode:speechManager:siriEnabledMonitor:siriClientBehaviorMonitor:intuitiveConvAudioCaptureMonitor:rcHandler:tcuGenerator:continuityEndDetector:bridgeMessageHandler:audioCoordinator:magusSupportedPolicy:supportsAcousticProgressiveChecker:supportsUnderstandingOnDevice:requireASROnDevice:supportsHybridUnderstandingOnDevice:supportsLogger:supportTCU:audioSessionInfoProvider:aggressiveECHandler:](self, "initWithAudioSrcNode:endpointerNode:osdNode:ssrNode:speechRecognitionNode:uresNode:needsSSRNode:aFtmNode:speechManager:siriEnabledMonitor:siriClientBehaviorMonitor:intuitiveConvAudioCaptureMonitor:rcHandler:tcuGenerator:continuityEndDetector:bridgeMessageHandler:audioCoordinator:magusSupportedPolicy:supportsAcousticProgressiveChecker:supportsUnderstandingOnDevice:requireASROnDevice:supportsHybridUnderstandingOnDevice:supportsLogger:supportTCU:audioSessionInfoProvider:aggressiveECHandler:", 0, 0, 0, 0, 0, 0, v10, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0,
           0,
           0,
           v11,
           0,
           0);
}

@end