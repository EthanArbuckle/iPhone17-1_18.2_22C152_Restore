@interface CSAttSiriController
- (BOOL)_shouldFetchMitigationAssets;
- (BOOL)boronScore;
- (BOOL)deferredActivation;
- (BOOL)deferredAsrResults;
- (BOOL)getPendingActivationStatus;
- (BOOL)isCurrentRequestCCTriggered;
- (BOOL)isDeferredActivationEnabled;
- (BOOL)pendingActivationProcessing;
- (BOOL)shouldSkipAttending;
- (CSAsset)mitigationAsset;
- (CSAsset)vtAsset;
- (CSAttSiriAFTMNode)aFTMNode;
- (CSAttSiriAsrNode)asrNode;
- (CSAttSiriAttendingAudioSrcNode)attendingAudioNode;
- (CSAttSiriAudioSrcNode)audioSrcNode;
- (CSAttSiriContConvController)ccController;
- (CSAttSiriController)init;
- (CSAttSiriController)initWithEndpointerNode:(id)a3 osdNode:(id)a4 ssrNode:(id)a5 asrNode:(id)a6 uresNode:(id)a7 needsSSRNode:(BOOL)a8 aFtmNode:(id)a9 speechDetectionNode:(id)a10 ccController:(id)a11 isContinuousConverationEnabled:(BOOL)a12 speechManager:(id)a13 siriEnabledMonitor:(id)a14 siriClientBehaviorMonitor:(id)a15 rcHandler:(id)a16 supportsAcousticProgressiveChecker:(BOOL)a17 supportsUnderstandingOnDevice:(BOOL)a18 requireASROnDevice:(BOOL)a19 supportsHybridUnderstandingOnDevice:(BOOL)a20;
- (CSAttSiriEndpointerNode)endpointerNode;
- (CSAttSiriNLDAClassifierNode)nldaClassifierNode;
- (CSAttSiriOSDNode)osdNode;
- (CSAttSiriRCHandler)rcHandler;
- (CSAttSiriSSRNode)ssrNode;
- (CSAttSiriSpeechDetectionNode)speechDetectionNode;
- (CSAttSiriUresNode)uresNode;
- (CSAudioRecordContext)audioRecordContext;
- (CSAudioRouteChangeMonitor)audioRouteChangeMonitor;
- (CSAudioStartStreamOption)siriClientAudioStartStreamOption;
- (CSAudioStream)siriClientStream;
- (CSConnectionListener)attSiriSvcListener;
- (CSOSTransaction)attSiriTransaction;
- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor;
- (CSSiriEnabledMonitor)siriEnabledMonitor;
- (CSSpeechManager)speechManager;
- (NSMapTable)nodesCache;
- (NSString)requestMHUUID;
- (OS_dispatch_queue)mitigationAssetFetchQueue;
- (OS_dispatch_queue)queue;
- (id)_startStreamOption;
- (id)_startStreamOptionWithMachAbsTime:(unint64_t)a3;
- (id)getNodeOfType:(unint64_t)a3;
- (id)getRequestMHUUID;
- (int64_t)hearstRouteStatus;
- (unint64_t)activationStartSampleId;
- (void)CSAudioRouteChangeMonitor:(id)a3 didReceiveAudioRouteChangeEvent:(int64_t)a4;
- (void)CSSiriEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)_detachAttendingStreamAndAttachSiriClientStream;
- (void)_detachSiriClientStreamAndAttachAttendingStream;
- (void)_fetchMitigationAssets;
- (void)_fetchRequiredAssets;
- (void)_fetchVoiceTriggerAssets;
- (void)_forceBuildGraph:(BOOL)a3;
- (void)_handleCCTriggeredRequestStart;
- (void)_handleCCTriggeredRequestStop;
- (void)_handleStartProcessingWithRecordContext:(id)a3 withAudioStartStreamOptions:(id)a4 completion:(id)a5;
- (void)_handleStopProcessing;
- (void)_holdAttSiriTransactionIfNeeded;
- (void)_prepareAttendingAudioSrcNodeWithStreamRequest:(id)a3 audioProviderUUID:(id)a4;
- (void)_receivedHearstRoutedEvent:(int64_t)a3;
- (void)_reconfigureRequiredNodes:(id)a3 enforceAttendingAudioNode:(BOOL)a4;
- (void)_releaseAttSiriTransactionIfNeeded;
- (void)_resetAttendingState;
- (void)_setPendingActivationStatus:(BOOL)a3;
- (void)_setupAttendingAudioSrcNodeWithStreamRequest:(id)a3 audioProviderUUID:(id)a4;
- (void)_setupAudioSrcNodeWithSiriClientStream:(id)a3;
- (void)_startAudioStreamForContinuousConversation:(id)a3 withStartStreamOption:(id)a4;
- (void)_startProcessingContinuousConversationRequest:(unint64_t)a3;
- (void)_tearDownBuildGraph:(id)a3;
- (void)_triggerSiriActivation;
- (void)attSiriAttendingAudioSrcNodeDidStopUnexpectedly:(id)a3;
- (void)attSiriAudioSrcNodeDidStopUnexpectedly:(id)a3;
- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6;
- (void)attSiriNode:(id)a3 didDetectSpeechWithTriggerInfo:(id)a4;
- (void)attSiriNodeDidNotDetectSpeechWithTimeout;
- (void)gazeEstimates:(CGPoint)a3 landmarks:(id)a4;
- (void)gazeTrackerFaceTrackingMetaDataUpdate:(id)a3 atMachAbsTime:(unint64_t)a4;
- (void)handleAttendingAudioStopUnexpectedly;
- (void)handleAudioStopUnexpectedly;
- (void)handleEndOfAttendingForRequestId:(id)a3;
- (void)handleOrbTransition;
- (void)resetAttendingState;
- (void)setAFTMNode:(id)a3;
- (void)setActivationStartSampleId:(unint64_t)a3;
- (void)setAsrNode:(id)a3;
- (void)setAttSiriSvcListener:(id)a3;
- (void)setAttSiriTransaction:(id)a3;
- (void)setAttendingAudioNode:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setAudioRouteChangeMonitor:(id)a3;
- (void)setAudioSrcNode:(id)a3;
- (void)setBoronScore:(BOOL)a3;
- (void)setCcController:(id)a3;
- (void)setDeferredActivation:(BOOL)a3;
- (void)setDeferredAsrResults:(BOOL)a3;
- (void)setEndpointerNode:(id)a3;
- (void)setHearstRouteStatus:(int64_t)a3;
- (void)setMitigationAsset:(id)a3;
- (void)setMitigationAssetFetchQueue:(id)a3;
- (void)setNldaClassifierNode:(id)a3;
- (void)setNodesCache:(id)a3;
- (void)setOsdNode:(id)a3;
- (void)setPendingActivationProcessing:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setRcHandler:(id)a3;
- (void)setRequestMHUUID:(id)a3;
- (void)setShouldSkipAttending:(BOOL)a3;
- (void)setSiriClientAudioStartStreamOption:(id)a3;
- (void)setSiriClientBehaviorMonitor:(id)a3;
- (void)setSiriClientStream:(id)a3;
- (void)setSiriEnabledMonitor:(id)a3;
- (void)setSpeechDetectionNode:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setSsrNode:(id)a3;
- (void)setUresNode:(id)a3;
- (void)setVtAsset:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5;
- (void)siriClientBehaviorMonitor:(id)a3 fetchedSiriClientAudioStream:(id)a4 successfully:(BOOL)a5;
- (void)siriClientBehaviorMonitor:(id)a3 preparedSiriClientAudioStream:(id)a4 successfully:(BOOL)a5;
- (void)siriClientBehaviorMonitor:(id)a3 willStartStreamWithContext:(id)a4 option:(id)a5;
- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5;
- (void)siriMitigator:(id)a3 mitigationDecision:(unint64_t)a4;
- (void)start;
- (void)startAttendingWithContext:(id)a3;
- (void)startSpeechProcessing:(unint64_t)a3;
- (void)stopAttendingWithContext:(id)a3;
- (void)triggerSiriActivation;
- (void)updateSiriOrbLocation:(CGRect)a3;
@end

@implementation CSAttSiriController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attendingAudioNode, 0);
  objc_storeStrong((id *)&self->_ccController, 0);
  objc_storeStrong((id *)&self->_audioRouteChangeMonitor, 0);
  objc_storeStrong((id *)&self->_speechDetectionNode, 0);
  objc_storeStrong((id *)&self->_nldaClassifierNode, 0);
  objc_storeStrong((id *)&self->_aFTMNode, 0);
  objc_storeStrong((id *)&self->_siriEnabledMonitor, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_vtAsset, 0);
  objc_storeStrong((id *)&self->_mitigationAsset, 0);
  objc_storeStrong((id *)&self->_siriClientStream, 0);
  objc_storeStrong((id *)&self->_siriClientBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_requestMHUUID, 0);
  objc_storeStrong((id *)&self->_attSiriTransaction, 0);
  objc_storeStrong((id *)&self->_siriClientAudioStartStreamOption, 0);
  objc_storeStrong((id *)&self->_audioRecordContext, 0);
  objc_storeStrong((id *)&self->_mitigationAssetFetchQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_ssrNode, 0);
  objc_storeStrong((id *)&self->_audioSrcNode, 0);
  objc_storeStrong((id *)&self->_uresNode, 0);
  objc_storeStrong((id *)&self->_asrNode, 0);
  objc_storeStrong((id *)&self->_osdNode, 0);
  objc_storeStrong((id *)&self->_endpointerNode, 0);
  objc_storeStrong((id *)&self->_nodesCache, 0);
  objc_storeStrong((id *)&self->_rcHandler, 0);
  objc_storeStrong((id *)&self->_attSiriSvcListener, 0);
}

- (void)setShouldSkipAttending:(BOOL)a3
{
  self->_shouldSkipAttending = a3;
}

- (BOOL)shouldSkipAttending
{
  return self->_shouldSkipAttending;
}

- (void)setDeferredAsrResults:(BOOL)a3
{
  self->_deferredAsrResults = a3;
}

- (BOOL)deferredAsrResults
{
  return self->_deferredAsrResults;
}

- (void)setDeferredActivation:(BOOL)a3
{
  self->_deferredActivation = a3;
}

- (BOOL)deferredActivation
{
  return self->_deferredActivation;
}

- (void)setActivationStartSampleId:(unint64_t)a3
{
  self->_activationStartSampleId = a3;
}

- (unint64_t)activationStartSampleId
{
  return self->_activationStartSampleId;
}

- (void)setPendingActivationProcessing:(BOOL)a3
{
  self->_pendingActivationProcessing = a3;
}

- (BOOL)pendingActivationProcessing
{
  return self->_pendingActivationProcessing;
}

- (void)setBoronScore:(BOOL)a3
{
  self->_boronScore = a3;
}

- (BOOL)boronScore
{
  return self->_boronScore;
}

- (void)setAttendingAudioNode:(id)a3
{
}

- (CSAttSiriAttendingAudioSrcNode)attendingAudioNode
{
  return self->_attendingAudioNode;
}

- (void)setCcController:(id)a3
{
}

- (CSAttSiriContConvController)ccController
{
  return self->_ccController;
}

- (void)setHearstRouteStatus:(int64_t)a3
{
  self->_hearstRouteStatus = a3;
}

- (int64_t)hearstRouteStatus
{
  return self->_hearstRouteStatus;
}

- (void)setAudioRouteChangeMonitor:(id)a3
{
}

- (CSAudioRouteChangeMonitor)audioRouteChangeMonitor
{
  return self->_audioRouteChangeMonitor;
}

- (void)setSpeechDetectionNode:(id)a3
{
}

- (CSAttSiriSpeechDetectionNode)speechDetectionNode
{
  return self->_speechDetectionNode;
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

- (void)setSiriClientAudioStartStreamOption:(id)a3
{
}

- (CSAudioStartStreamOption)siriClientAudioStartStreamOption
{
  return self->_siriClientAudioStartStreamOption;
}

- (void)setAudioRecordContext:(id)a3
{
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (void)setMitigationAssetFetchQueue:(id)a3
{
}

- (OS_dispatch_queue)mitigationAssetFetchQueue
{
  return self->_mitigationAssetFetchQueue;
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

- (void)setAsrNode:(id)a3
{
}

- (CSAttSiriAsrNode)asrNode
{
  return self->_asrNode;
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

- (void)setRcHandler:(id)a3
{
}

- (CSAttSiriRCHandler)rcHandler
{
  return self->_rcHandler;
}

- (void)setAttSiriSvcListener:(id)a3
{
}

- (CSConnectionListener)attSiriSvcListener
{
  return self->_attSiriSvcListener;
}

- (void)handleAttendingAudioStopUnexpectedly
{
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v3 = 136315138;
    v4 = "-[CSAttSiriController handleAttendingAudioStopUnexpectedly]";
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "%s Calling unimplemented [CSAttSiriController handleAttendingAudioStopUnexpectedly]", (uint8_t *)&v3, 0xCu);
  }
}

- (void)triggerSiriActivation
{
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v3 = 136315138;
    v4 = "-[CSAttSiriController triggerSiriActivation]";
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "%s Calling unimplemented [CSAttSiriController triggerSiriActivation]", (uint8_t *)&v3, 0xCu);
  }
}

- (void)resetAttendingState
{
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v3 = 136315138;
    v4 = "-[CSAttSiriController resetAttendingState]";
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "%s Calling unimplemented [CSAttSiriController resetAttendingState]", (uint8_t *)&v3, 0xCu);
  }
}

- (void)handleAudioStopUnexpectedly
{
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v3 = 136315138;
    v4 = "-[CSAttSiriController handleAudioStopUnexpectedly]";
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "%s Calling unimplemented [CSAttSiriController handleAudioStopUnexpectedly]", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_receivedHearstRoutedEvent:(int64_t)a3
{
  if (self->_hearstRouteStatus != a3)
  {
    v5 = +[CSAttSiriStateMonitor sharedInstance];
    unsigned int v6 = [v5 isAttending];

    if (v6)
    {
      v7 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315138;
        v9 = "-[CSAttSiriController _receivedHearstRoutedEvent:]";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Routed device changed during attending, stop attending", (uint8_t *)&v8, 0xCu);
      }
      [(CSAttSiriContConvController *)self->_ccController stopAttendingForRequestId:self->_requestMHUUID isReqCC:1 forceStop:1];
    }
  }
  self->_hearstRouteStatus = a3;
}

- (void)CSAudioRouteChangeMonitor:(id)a3 didReceiveAudioRouteChangeEvent:(int64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100107B44;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (id)getRequestMHUUID
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100107D20;
  v10 = sub_100107D30;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100107D38;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)getPendingActivationStatus
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    BOOL pendingActivationProcessing = self->_pendingActivationProcessing;
    *(_DWORD *)buf = 136315394;
    v14 = "-[CSAttSiriController getPendingActivationStatus]";
    __int16 v15 = 1024;
    BOOL v16 = pendingActivationProcessing;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s _pendingActivationProcessing:%u", buf, 0x12u);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100107E94;
  v8[3] = &unk_100253A90;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(queue, v8);
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)_resetAttendingState
{
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    BOOL deferredActivation = self->_deferredActivation;
    BOOL pendingActivationProcessing = self->_pendingActivationProcessing;
    *(_DWORD *)buf = 136315650;
    v14 = "-[CSAttSiriController _resetAttendingState]";
    __int16 v15 = 1024;
    BOOL v16 = deferredActivation;
    __int16 v17 = 1024;
    BOOL v18 = pendingActivationProcessing;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s _deferredActivation:%u _pendingActivationProcessing:%u", buf, 0x18u);
  }
  if (!self->_deferredActivation)
  {
    uint64_t v9 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136315138;
    v14 = "-[CSAttSiriController _resetAttendingState]";
    v10 = "%s deferredActivation not enabled!";
LABEL_11:
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);
    return;
  }
  if (self->_pendingActivationProcessing)
  {
    [(CSAttSiriController *)self _setPendingActivationStatus:0];
    char v6 = [[CSAttSiriRequestContext alloc] initWithRequestSource:0];
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001080AC;
    v11[3] = &unk_100253B08;
    v11[4] = self;
    char v12 = v6;
    uint64_t v8 = v6;
    dispatch_async(queue, v11);

    return;
  }
  uint64_t v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[CSAttSiriController _resetAttendingState]";
    v10 = "%s _pendingActivationProcessing not set!";
    goto LABEL_11;
  }
}

- (void)_startProcessingContinuousConversationRequest:(unint64_t)a3
{
  v5 = +[NSUUID UUID];
  char v6 = [v5 UUIDString];
  requestMHUUID = self->_requestMHUUID;
  self->_requestMHUUID = v6;

  uint64_t v8 = [(CSAudioRecordContext *)self->_audioRecordContext deviceId];
  uint64_t v9 = +[CSAudioRecordContext contextForContinuousConversation];
  audioRecordContext = self->_audioRecordContext;
  self->_audioRecordContext = v9;

  [(CSAudioRecordContext *)self->_audioRecordContext setDeviceId:v8];
  uint64_t v11 = +[CSAudioStartStreamOption noAlertOption];
  [v11 setStartRecordingSampleCount:a3];
  [v11 setRequestHistoricalAudioDataSampleCount:1];
  [v11 setRequestHistoricalAudioDataWithHostTime:0];
  [v11 setRequestMHUUID:self->_requestMHUUID];
  [v11 setSiriSessionUUID:self->_requestMHUUID];
  [v11 setDisableRCSelection:1];
  char v12 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    v13 = self->_audioRecordContext;
    v14 = self->_requestMHUUID;
    *(_DWORD *)buf = 136315650;
    v20 = "-[CSAttSiriController _startProcessingContinuousConversationRequest:]";
    __int16 v21 = 2112;
    v22 = v13;
    __int16 v23 = 2112;
    v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s recordContext:%@ _requestMHUUID:%@", buf, 0x20u);
  }
  __int16 v15 = self->_audioRecordContext;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001082F8;
  v17[3] = &unk_100251BA0;
  v17[4] = self;
  id v18 = v11;
  id v16 = v11;
  [(CSAttSiriController *)self _handleStartProcessingWithRecordContext:v15 withAudioStartStreamOptions:v16 completion:v17];
}

- (void)_startAudioStreamForContinuousConversation:(id)a3 withStartStreamOption:(id)a4
{
  id v5 = a4;
  char v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    attendingAudioNode = self->_attendingAudioNode;
    *(_DWORD *)buf = 136315650;
    v13 = "-[CSAttSiriController _startAudioStreamForContinuousConversation:withStartStreamOption:]";
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    __int16 v17 = attendingAudioNode;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s startOption:%@ _attendingAudioNode:%@", buf, 0x20u);
  }
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001085F8;
  v10[3] = &unk_100253B08;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(queue, v10);
}

- (void)_setPendingActivationStatus:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[CSAttSiriController _setPendingActivationStatus:]";
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s status:%u", (uint8_t *)&v6, 0x12u);
  }
  self->_BOOL pendingActivationProcessing = v3;
}

- (void)_triggerSiriActivation
{
  BOOL v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    BOOL deferredActivation = self->_deferredActivation;
    BOOL pendingActivationProcessing = self->_pendingActivationProcessing;
    int v8 = 136315650;
    BOOL v9 = "-[CSAttSiriController _triggerSiriActivation]";
    __int16 v10 = 1024;
    BOOL v11 = deferredActivation;
    __int16 v12 = 1024;
    BOOL v13 = pendingActivationProcessing;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s _deferredActivation:%u _pendingActivationProcessing:%u", (uint8_t *)&v8, 0x18u);
  }
  if (!self->_deferredActivation)
  {
    int v6 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v8 = 136315138;
    BOOL v9 = "-[CSAttSiriController _triggerSiriActivation]";
    v7 = "%s deferredActivation not enabled!";
LABEL_11:
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v8, 0xCu);
    return;
  }
  if (self->_pendingActivationProcessing)
  {
    [(CSAttSiriContConvController *)self->_ccController triggerActivation:self->_activationStartSampleId];
    self->_activationStartSampleId = 0;
    return;
  }
  int v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315138;
    BOOL v9 = "-[CSAttSiriController _triggerSiriActivation]";
    v7 = "%s _pendingActivationProcessing not set!";
    goto LABEL_11;
  }
}

- (void)startSpeechProcessing:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100108A7C;
  v4[3] = &unk_100253B58;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)_startStreamOptionWithMachAbsTime:(unint64_t)a3
{
  v4 = +[CSAudioStartStreamOption noAlertOption];
  [v4 setRequestHistoricalAudioDataWithHostTime:1];
  [v4 setStartRecordingHostTime:a3];
  [v4 setRequireSingleChannelLookup:1];
  [v4 setSelectedChannel:0];
  return v4;
}

- (id)_startStreamOption
{
  uint64_t v3 = mach_absolute_time();
  return [(CSAttSiriController *)self _startStreamOptionWithMachAbsTime:v3];
}

- (void)_handleCCTriggeredRequestStop
{
  if ([(CSAudioRecordContext *)self->_audioRecordContext isContinuousConversation])
  {
    id v4 = [(CSAttSiriContConvController *)self->_ccController attentionNode];
    [v4 removeReceiver:self->_uresNode];
  }
  else
  {
    uint64_t v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v6 = "-[CSAttSiriController _handleCCTriggeredRequestStop]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Nothing to do ", buf, 0xCu);
    }
  }
}

- (void)_handleCCTriggeredRequestStart
{
  id v3 = [(CSAudioRecordContext *)self->_audioRecordContext isContinuousConversation];
  [(CSAttSiriContConvController *)self->_ccController stopAttendingForRequestId:self->_requestMHUUID isReqCC:v3 forceStop:0];
  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[CSAttSiriController _handleCCTriggeredRequestStart]";
    __int16 v9 = 1024;
    int v10 = (int)v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s isReqCC:%u", (uint8_t *)&v7, 0x12u);
  }
  ccController = self->_ccController;
  if (v3)
  {
    int v6 = [(CSAttSiriContConvController *)ccController attentionNode];
    [v6 addReceiver:self->_uresNode];
  }
  else
  {
    [(CSAttSiriContConvController *)ccController startMagusLoggingForTriggerRequest];
  }
}

- (void)handleEndOfAttendingForRequestId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100108F78;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)handleOrbTransition
{
  id v2 = [(CSAttSiriController *)self attSiriSvcListener];
  [v2 notifyClientsWithBlock:&stru_100251B78];
}

- (void)gazeEstimates:(CGPoint)a3 landmarks:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    int v10 = "-[CSAttSiriController gazeEstimates:landmarks:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  -[CSAttSiriContConvController relayGazeEstimates:landmarks:](self->_ccController, "relayGazeEstimates:landmarks:", v7, x, y);
}

- (void)gazeTrackerFaceTrackingMetaDataUpdate:(id)a3 atMachAbsTime:(unint64_t)a4
{
}

- (void)updateSiriOrbLocation:(CGRect)a3
{
}

- (void)stopAttendingWithContext:(id)a3
{
  id v4 = a3;
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "-[CSAttSiriController stopAttendingWithContext:]";
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ctx: %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100109424;
  v8[3] = &unk_100253B08;
  id v9 = v4;
  int v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)startAttendingWithContext:(id)a3
{
  id v4 = a3;
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "-[CSAttSiriController startAttendingWithContext:]";
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ctx: %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001096CC;
  v8[3] = &unk_100253B08;
  id v9 = v4;
  int v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)attSiriAudioSrcNodeDidStopUnexpectedly:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001099C8;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)attSiriAttendingAudioSrcNodeDidStopUnexpectedly:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100109AF0;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_releaseAttSiriTransactionIfNeeded
{
  attSiriTransaction = self->_attSiriTransaction;
  if (attSiriTransaction)
  {
    self->_attSiriTransaction = 0;
  }
  else
  {
    id v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      id v5 = "-[CSAttSiriController _releaseAttSiriTransactionIfNeeded]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s attSiriTransaction already released", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)_holdAttSiriTransactionIfNeeded
{
  if (!self->_attSiriTransaction)
  {
    id v3 = (CSOSTransaction *)[objc_alloc((Class)CSOSTransaction) initWithDescription:@"attSiri transaction"];
    attSiriTransaction = self->_attSiriTransaction;
    self->_attSiriTransaction = v3;
  }
}

- (void)_handleStopProcessing
{
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[CSAttSiriController _handleStopProcessing]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  [(CSAttSiriEndpointerNode *)self->_endpointerNode stop];
  int v4 = +[CSAttSiriStateMonitor sharedInstance];
  unsigned __int8 v5 = [v4 isAttending];

  if ((v5 & 1) == 0) {
    [(CSAttSiriOSDNode *)self->_osdNode stop];
  }
  [(CSAttSiriAFTMNode *)self->_aFTMNode stop];
  [(CSAttSiriSSRNode *)self->_ssrNode stop];
  [(CSAttSiriController *)self _handleCCTriggeredRequestStop];
  if (!self->_shouldSkipAttending
    && [(CSAttSiriContConvController *)self->_ccController shouldRunCCForAudioRecordContext:self->_audioRecordContext]&& [(CSAttSiriAttendingAudioSrcNode *)self->_attendingAudioNode isStreaming])
  {
    id v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[CSAttSiriController _handleStopProcessing]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Don't stop audioStream, continue listening for CC", buf, 0xCu);
    }
    [(CSAttSiriController *)self _detachSiriClientStreamAndAttachAttendingStream];
    if ((+[CSUtils isIOSDeviceSupportingBargeIn] & 1) != 0
      || CSIsHorseman())
    {
      id v7 = +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor];
      id v8 = (char *)[v7 phoneCallState];

      if ((unint64_t)(v8 - 2) >= 3)
      {
        [(CSAttSiriContConvController *)self->_ccController startAttendingWithAudioRecordContext:self->_audioRecordContext withRequestId:self->_requestMHUUID shouldStartTimer:CSIsHorseman()];
      }
      else
      {
        id v9 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          id v15 = "-[CSAttSiriController _handleStopProcessing]";
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s skip since isRequestDuringActiveCall = YES", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    siriClientAudioStartStreamOption = self->_siriClientAudioStartStreamOption;
    self->_siriClientAudioStartStreamOption = 0;

    audioRecordContext = self->_audioRecordContext;
    self->_audioRecordContext = 0;

    attendingAudioNode = self->_attendingAudioNode;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100109FB0;
    v13[3] = &unk_1002531E0;
    v13[4] = self;
    [(CSAttSiriAttendingAudioSrcNode *)attendingAudioNode stopAudioStreamWithOption:0 completion:v13];
  }
}

- (void)_handleStartProcessingWithRecordContext:(id)a3 withAudioStartStreamOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[CSAttSiriController _handleStartProcessingWithRecordContext:withAudioStartStreamOptions:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if ([v8 isVoiceTriggered])
  {
    __int16 v12 = +[CSVoiceTriggerEventInfoProvider sharedInstance];
    id v29 = 0;
    [v12 fetchVoiceTriggerInfoWithAudioContext:v8 resultVoiceTriggerInfo:&v29 resultRTSTriggerInfo:0];
    id v13 = v29;
  }
  else
  {
    id v13 = 0;
  }
  if ([v8 type] == (id)17 || objc_msgSend(v8, "type") == (id)18)
  {
    id v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[CSAttSiriController _handleStartProcessingWithRecordContext:withAudioStartStreamOptions:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Skip processing for remora requests!", buf, 0xCu);
    }
  }
  else
  {
    if (+[CSUtils isContinuousConversationSupported])[(CSAttSiriController *)self _reconfigureRequiredNodes:v8 enforceAttendingAudioNode:0]; {
    self->_shouldSkipAttending = 0;
    }
    [(CSAttSiriController *)self _holdAttSiriTransactionIfNeeded];
    endpointerNode = self->_endpointerNode;
    +[CSConfig inputRecordingSampleRate];
    [(CSAttSiriEndpointerNode *)endpointerNode resetForNewRequestWithSampleRate:(unint64_t)v16 recordContext:v8 recordOption:v9 voiceTriggerInfo:v13];
    [(CSAttSiriOSDNode *)self->_osdNode setPrefetchedAsset:self->_mitigationAsset];
    [(CSAttSiriUresNode *)self->_uresNode setPrefetchedAsset:self->_mitigationAsset];
    v28 = -[CSEndpointerSettings initWithDisableEndpointer:]([CSEndpointerSettings alloc], "initWithDisableEndpointer:", [v9 disableEndpointer]);
    -[CSAttSiriOSDNode resetForNewRequestWithRecordContext:endpointerSettings:voiceTriggerInfo:](self->_osdNode, "resetForNewRequestWithRecordContext:endpointerSettings:voiceTriggerInfo:", v8);
    [(CSAttSiriAsrNode *)self->_asrNode prepareToStartSpeechRequestWithStartStreamOption:v9 audioRecordContext:v8 voiceTriggerInfo:v13];
    __int16 v17 = [(CSAsset *)self->_mitigationAsset getCategoryKeyWithRecordCtx:v8];
    if ((CSIsCommunalDevice() & 1) != 0
      || [(CSAsset *)self->_mitigationAsset shouldRunSpkrIdForCategory:v17])
    {
      [(CSAttSiriSSRNode *)self->_ssrNode setPrefetchedAsset:self->_vtAsset];
      ssrNode = self->_ssrNode;
      v19 = [v9 siriSessionUUID];
      [(CSAttSiriSSRNode *)ssrNode resetForNewRequestWithRecordContext:v8 voiceTriggerInfo:v13 withReqId:v19];
    }
    v20 = @"AcousticSLTaskTypeVoiceTrigger";
    __int16 v21 = @"AcousticSLTaskTypeVoiceTrigger";
    if ([v8 isContinuousConversation])
    {
      v20 = @"AcousticSLTaskTypeContConv";
      v22 = @"AcousticSLTaskTypeContConv";
    }
    [(CSAttSiriAFTMNode *)self->_aFTMNode setPrefetchedAsset:self->_mitigationAsset];
    aFTMNode = self->_aFTMNode;
    v24 = [v9 siriSessionUUID];
    [(CSAttSiriAFTMNode *)aFTMNode startRequestWithContext:v8 withVtei:v13 taskType:v20 withRequestId:v24 completion:&stru_100251B58];

    v25 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      BOOL deferredActivation = self->_deferredActivation;
      BOOL deferredAsrResults = self->_deferredAsrResults;
      *(_DWORD *)buf = 136315650;
      v31 = "-[CSAttSiriController _handleStartProcessingWithRecordContext:withAudioStartStreamOptions:completion:]";
      __int16 v32 = 1024;
      BOOL v33 = deferredActivation;
      __int16 v34 = 1024;
      BOOL v35 = deferredAsrResults;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s enabled feature: _deferredActivation:%u _deferredAsrResults:%u", buf, 0x18u);
    }
    if (!self->_deferredActivation || ([v8 isContinuousConversation] & 1) == 0) {
      [(CSAttSiriAsrNode *)self->_asrNode start];
    }
    [(CSAttSiriController *)self _handleCCTriggeredRequestStart];
    if (+[CSUtils isContinuousConversationSupported])[(CSAttSiriController *)self _forceBuildGraph:1]; {
  }
    }
}

- (void)_detachAttendingStreamAndAttachSiriClientStream
{
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    unsigned __int8 v5 = "-[CSAttSiriController _detachAttendingStreamAndAttachSiriClientStream]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(CSAttSiriAttendingAudioSrcNode *)self->_attendingAudioNode removeReceiver:self->_osdNode];
  [(CSAttSiriAudioSrcNode *)self->_audioSrcNode addReceiver:self->_osdNode];
}

- (void)_detachSiriClientStreamAndAttachAttendingStream
{
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    unsigned __int8 v5 = "-[CSAttSiriController _detachSiriClientStreamAndAttachAttendingStream]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(CSAttSiriAudioSrcNode *)self->_audioSrcNode removeReceiver:self->_osdNode];
  [(CSAttSiriAttendingAudioSrcNode *)self->_attendingAudioNode addReceiver:self->_osdNode];
}

- (void)_prepareAttendingAudioSrcNodeWithStreamRequest:(id)a3 audioProviderUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v17 = "-[CSAttSiriController _prepareAttendingAudioSrcNodeWithStreamRequest:audioProviderUUID:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s streamRequest:%@", buf, 0x16u);
  }
  [(CSAttSiriController *)self _setupAttendingAudioSrcNodeWithStreamRequest:v6 audioProviderUUID:v7];
  id v9 = [(CSAttSiriController *)self attendingAudioNode];
  id v15 = 0;
  [v9 prepareAudioStreamSyncWithRequest:v6 error:&v15];
  id v10 = v15;

  BOOL v11 = [(CSAttSiriController *)self attendingAudioNode];

  if (!v11 || v10)
  {
    __int16 v12 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      id v13 = v12;
      id v14 = [v10 localizedDescription];
      *(_DWORD *)buf = 136315394;
      __int16 v17 = "-[CSAttSiriController _prepareAttendingAudioSrcNodeWithStreamRequest:audioProviderUUID:]";
      __int16 v18 = 2114;
      id v19 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Failed to prepare audioSrcNode : %{public}@", buf, 0x16u);
    }
  }
}

- (void)_setupAttendingAudioSrcNodeWithStreamRequest:(id)a3 audioProviderUUID:(id)a4
{
  speechManager = self->_speechManager;
  id v7 = a3;
  id v8 = [(CSSpeechManager *)speechManager audioProviderWithUUID:a4];
  id v9 = [[CSAttSiriAttendingAudioSrcNode alloc] initWithAudioStreamProvider:v8 streamName:0 streamRequest:v7];

  [(CSAttSiriAttendingAudioSrcNode *)v9 setDelegate:self];
  if (v9)
  {
    [(NSMapTable *)self->_nodesCache setObject:v9 forKey:&off_10025E0E0];
    [(CSAttSiriAttendingAudioSrcNode *)v9 setIsWeakStream:0];
    [(CSAttSiriController *)self setAttendingAudioNode:v9];
    [(CSAttSiriController *)self _forceBuildGraph:1];
    id v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      id v15 = "-[CSAttSiriController _setupAttendingAudioSrcNodeWithStreamRequest:audioProviderUUID:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Attached attending audio src node", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    BOOL v11 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = v11;
      id v13 = [0 localizedDescription];
      int v14 = 136315394;
      id v15 = "-[CSAttSiriController _setupAttendingAudioSrcNodeWithStreamRequest:audioProviderUUID:]";
      __int16 v16 = 2114;
      __int16 v17 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Failed to setup audioSrcNode : %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)_setupAudioSrcNodeWithSiriClientStream:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[CSAttSiriController _setupAudioSrcNodeWithSiriClientStream:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s siriClientStream:%@", (uint8_t *)&v8, 0x16u);
  }
  id v6 = [[CSAttSiriAudioSrcNode alloc] initWithTargetQueue:0];
  [(CSAttSiriAudioSrcNode *)v6 setDelegate:self];
  if (v6)
  {
    [(NSMapTable *)self->_nodesCache setObject:v6 forKey:&off_10025E0C8];
    [(CSAttSiriController *)self setAudioSrcNode:v6];
    [(CSAttSiriController *)self _forceBuildGraph:1];
    [(CSAttSiriController *)self _detachAttendingStreamAndAttachSiriClientStream];
    [(CSAttSiriAudioSrcNode *)v6 attachToMasterStream:v4 name:@"CSAttSiriAudioSrcNode" completion:&stru_100251B38];
  }
  else
  {
    id v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[CSAttSiriController _setupAudioSrcNodeWithSiriClientStream:]";
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Failed to setup audioSrcNode", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_fetchRequiredAssets
{
  [(CSAttSiriController *)self _fetchVoiceTriggerAssets];
  if ([(CSAttSiriController *)self _shouldFetchMitigationAssets])
  {
    [(CSAttSiriController *)self _fetchMitigationAssets];
  }
}

- (BOOL)_shouldFetchMitigationAssets
{
  if (AFDeviceSupportsFullSiriUOD()) {
    return 1;
  }
  return _AFDeviceSupportsHybridUOD();
}

- (void)_fetchVoiceTriggerAssets
{
  id v3 = +[CSVoiceTriggerAssetHandler sharedHandler];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10010ADF4;
  v4[3] = &unk_100252DF0;
  v4[4] = self;
  [v3 getVoiceTriggerAssetWithEndpointId:0 completion:v4];
}

- (void)_fetchMitigationAssets
{
  mitigationAssetFetchQueue = self->_mitigationAssetFetchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010B0C0;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(mitigationAssetFetchQueue, block);
}

- (void)_forceBuildGraph:(BOOL)a3
{
  BOOL v3 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obj = self->_nodesCache;
  id v5 = [(NSMapTable *)obj countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v31;
    *(void *)&long long v6 = 136315394;
    long long v22 = v6;
    uint64_t v23 = *(void *)v31;
    do
    {
      id v9 = 0;
      id v24 = v7;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        __int16 v10 = -[NSMapTable objectForKey:](self->_nodesCache, "objectForKey:", *(void *)(*((void *)&v30 + 1) + 8 * (void)v9), v22);
        if ([v10 isReady]) {
          BOOL v11 = !v3;
        }
        else {
          BOOL v11 = 0;
        }
        if (!v11)
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          __int16 v12 = [v10 requiredNodes];
          id v13 = [v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
          if (!v13)
          {

            [v10 setIsReady:1];
LABEL_23:
            __int16 v21 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v22;
              BOOL v35 = "-[CSAttSiriController _forceBuildGraph:]";
              __int16 v36 = 2112;
              v37 = v10;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s %@ is ready", buf, 0x16u);
            }
            goto LABEL_25;
          }
          id v14 = v13;
          BOOL v15 = v3;
          uint64_t v16 = *(void *)v27;
          char v17 = 1;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v27 != v16) {
                objc_enumerationMutation(v12);
              }
              id v19 = [(NSMapTable *)self->_nodesCache objectForKey:*(void *)(*((void *)&v26 + 1) + 8 * i)];
              v20 = v19;
              if (v19) {
                [v19 addReceiver:v10];
              }
              else {
                char v17 = 0;
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
          }
          while (v14);

          [v10 setIsReady:v17 & 1];
          BOOL v3 = v15;
          uint64_t v8 = v23;
          id v7 = v24;
          if (v17) {
            goto LABEL_23;
          }
        }
LABEL_25:

        id v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [(NSMapTable *)obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v7);
  }
}

- (void)_reconfigureRequiredNodes:(id)a3 enforceAttendingAudioNode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v47 = "-[CSAttSiriController _reconfigureRequiredNodes:enforceAttendingAudioNode:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  long long v31 = v6;
  if ([v6 isContinuousConversation])
  {
    uint64_t v8 = +[CSFPreferences sharedPreferences];
    unsigned __int8 v9 = [v8 isDeferredActivationEnabled];

    if ((v9 & 1) == 0 && !v4) {
      goto LABEL_6;
    }
  }
  else if (!v4)
  {
LABEL_6:
    __int16 v10 = &off_10025E0C8;
    goto LABEL_9;
  }
  __int16 v10 = &off_10025E0E0;
LABEL_9:
  id v11 = objc_alloc_init((Class)NSMutableArray);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obj = self->_nodesCache;
  id v12 = [(NSMapTable *)obj countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v43;
    uint64_t v32 = *(void *)v43;
    long long v33 = self;
    do
    {
      uint64_t v15 = 0;
      id v34 = v13;
      do
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v15;
        uint64_t v16 = *(void **)(*((void *)&v42 + 1) + 8 * v15);
        if (([v16 isEqual:&off_10025E0B0] & 1) == 0)
        {
          char v17 = [(NSMapTable *)self->_nodesCache objectForKey:v16];
          if (v17)
          {
            __int16 v18 = v17;
            [(CSAttSiriController *)self _tearDownBuildGraph:v17];
            long long v40 = 0u;
            long long v41 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            __int16 v36 = v18;
            id v19 = [v18 requiredNodes];
            id v20 = [v19 countByEnumeratingWithState:&v38 objects:v52 count:16];
            if (v20)
            {
              id v21 = v20;
              char v22 = 0;
              uint64_t v23 = *(void *)v39;
              do
              {
                for (i = 0; i != v21; i = (char *)i + 1)
                {
                  if (*(void *)v39 != v23) {
                    objc_enumerationMutation(v19);
                  }
                  v25 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                  if (([v25 isEqual:&off_10025E0C8] & 1) != 0
                    || ([v25 isEqual:&off_10025E0E0] & 1) != 0)
                  {
                    if ((v22 & 1) == 0) {
                      [v11 addObject:v10];
                    }
                    char v22 = 1;
                  }
                  else
                  {
                    [v11 addObject:v25];
                  }
                }
                id v21 = [v19 countByEnumeratingWithState:&v38 objects:v52 count:16];
              }
              while (v21);
            }

            id v26 = [v11 copy];
            [v36 setRequiredNodes:v26];

            [v11 removeAllObjects];
            long long v27 = (void *)CSLogContextFacilityCoreSpeech;
            BOOL v28 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
            char v17 = v36;
            uint64_t v14 = v32;
            self = v33;
            id v13 = v34;
            if (v28)
            {
              long long v29 = v27;
              long long v30 = [v36 requiredNodes];
              *(_DWORD *)buf = 136315650;
              v47 = "-[CSAttSiriController _reconfigureRequiredNodes:enforceAttendingAudioNode:]";
              __int16 v48 = 2112;
              v49 = v36;
              __int16 v50 = 2112;
              v51 = v30;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s currDp:%@ newRequiredNodes:%@", buf, 0x20u);

              char v17 = v36;
            }
          }
        }
        uint64_t v15 = v37 + 1;
      }
      while ((id)(v37 + 1) != v13);
      id v13 = [(NSMapTable *)obj countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v13);
  }
}

- (void)_tearDownBuildGraph:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(v4, "requiredNodes", 0);
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      unsigned __int8 v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        __int16 v10 = [(NSMapTable *)self->_nodesCache objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * (void)v9)];
        id v11 = v10;
        if (v10) {
          [v10 removeReceiver:v4];
        }

        unsigned __int8 v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v4 setIsReady:0];
}

- (void)attSiriNodeDidNotDetectSpeechWithTimeout
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010BBD0;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)attSiriNode:(id)a3 didDetectSpeechWithTriggerInfo:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10010BCBC;
  v8[3] = &unk_100253B08;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010BDE0;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriMitigator:(id)a3 mitigationDecision:(unint64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (a4 == 1) {
      [(CSAttSiriController *)self _resetAttendingState];
    }
  }
  else
  {
    id v7 = [(CSAttSiriController *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010BEF4;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_async(v7, block);
  }
}

- (void)CSSiriEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSAttSiriController CSSiriEnabledMonitor:didReceiveEnabled:]";
    __int16 v12 = 1026;
    BOOL v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Siri enabled : %{public}d", buf, 0x12u);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10010C018;
  v8[3] = &unk_100253AB8;
  BOOL v9 = v4;
  void v8[4] = self;
  dispatch_async(queue, v8);
}

- (void)siriClientBehaviorMonitor:(id)a3 preparedSiriClientAudioStream:(id)a4 successfully:(BOOL)a5
{
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010C0D4;
  block[3] = &unk_1002537C0;
  BOOL v12 = a5;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 fetchedSiriClientAudioStream:(id)a4 successfully:(BOOL)a5
{
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010C2DC;
  block[3] = &unk_1002537C0;
  BOOL v12 = a5;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010C4B0;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10010C5D8;
  v6[3] = &unk_100253B58;
  v6[4] = self;
  v6[5] = a5;
  dispatch_async(queue, v6);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010C6D8;
  block[3] = &unk_100252620;
  block[4] = self;
  id v19 = v11;
  BOOL v22 = a5;
  id v20 = v12;
  id v21 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 willStartStreamWithContext:(id)a4 option:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "-[CSAttSiriController siriClientBehaviorMonitor:willStartStreamWithContext:option:]";
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s context : %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010CC80;
  block[3] = &unk_100253540;
  block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(queue, block);
}

- (BOOL)isCurrentRequestCCTriggered
{
  BOOL v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSAttSiriController isCurrentRequestCCTriggered]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010D040;
  v7[3] = &unk_100253A90;
  void v7[4] = self;
  v7[5] = &buf;
  dispatch_sync(queue, v7);
  char v5 = *(unsigned char *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  return v5;
}

- (BOOL)isDeferredActivationEnabled
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10010D124;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010D1B4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)getNodeOfType:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  char v10 = sub_100107D20;
  id v11 = sub_100107D30;
  id v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010D354;
  block[3] = &unk_100252430;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_async_and_wait(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (CSAttSiriController)initWithEndpointerNode:(id)a3 osdNode:(id)a4 ssrNode:(id)a5 asrNode:(id)a6 uresNode:(id)a7 needsSSRNode:(BOOL)a8 aFtmNode:(id)a9 speechDetectionNode:(id)a10 ccController:(id)a11 isContinuousConverationEnabled:(BOOL)a12 speechManager:(id)a13 siriEnabledMonitor:(id)a14 siriClientBehaviorMonitor:(id)a15 rcHandler:(id)a16 supportsAcousticProgressiveChecker:(BOOL)a17 supportsUnderstandingOnDevice:(BOOL)a18 requireASROnDevice:(BOOL)a19 supportsHybridUnderstandingOnDevice:(BOOL)a20
{
  BOOL v82 = a8;
  id v24 = a3;
  id v25 = a4;
  id v88 = a5;
  id v87 = a6;
  id v86 = a7;
  id v26 = a9;
  id v27 = a10;
  id v28 = a11;
  id v29 = a13;
  long long v30 = v24;
  id v31 = a14;
  id v32 = a15;
  id v33 = a16;
  v91.receiver = self;
  v91.super_class = (Class)CSAttSiriController;
  id v34 = [(CSAttSiriController *)&v91 init];
  if (!v34) {
    goto LABEL_53;
  }
  v85 = v25;
  dispatch_queue_t v35 = dispatch_queue_create("AttSiriController queue", 0);
  queue = v34->_queue;
  v34->_queue = (OS_dispatch_queue *)v35;

  v80 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v37 = dispatch_queue_create("AttSiriController mitigation asset fetch queue", v80);
  mitigationAssetFetchQueue = v34->_mitigationAssetFetchQueue;
  v34->_mitigationAssetFetchQueue = (OS_dispatch_queue *)v37;

  uint64_t v39 = +[NSMapTable strongToWeakObjectsMapTable];
  nodesCache = v34->_nodesCache;
  v34->_nodesCache = (NSMapTable *)v39;

  v34->_activationStartSampleId = 0;
  [(CSAttSiriController *)v34 setPendingActivationProcessing:0];
  long long v41 = +[CSFPreferences sharedPreferences];
  v34->_BOOL deferredActivation = [v41 isDeferredActivationEnabled];

  long long v42 = +[CSFPreferences sharedPreferences];
  v34->_BOOL deferredAsrResults = [v42 isDeferredAsrResultsEnabled];

  v81 = v30;
  if (v30) {
    long long v43 = v30;
  }
  else {
    long long v43 = objc_alloc_init(CSAttSiriEndpointerNode);
  }
  endpointerNode = v34->_endpointerNode;
  v34->_endpointerNode = v43;

  [(CSAttSiriEndpointerNode *)v34->_endpointerNode setDelegate:v34];
  [(NSMapTable *)v34->_nodesCache setObject:v34->_endpointerNode forKey:&off_10025E008];
  if (v82)
  {
    if (v88) {
      long long v45 = (CSAttSiriSSRNode *)v88;
    }
    else {
      long long v45 = objc_alloc_init(CSAttSiriSSRNode);
    }
    ssrNode = v34->_ssrNode;
    v34->_ssrNode = v45;

    [(NSMapTable *)v34->_nodesCache setObject:v34->_ssrNode forKey:&off_10025E020];
  }
  id v47 = v26;
  if (a19 || a20)
  {
    if (v87) {
      __int16 v48 = (CSAttSiriAsrNode *)v87;
    }
    else {
      __int16 v48 = objc_alloc_init(CSAttSiriAsrNode);
    }
    asrNode = v34->_asrNode;
    v34->_asrNode = v48;

    [(CSAttSiriAsrNode *)v34->_asrNode registerEndpointerNode:v34->_endpointerNode];
    [(CSAttSiriAsrNode *)v34->_asrNode registerSSRNode:v34->_ssrNode];
    [(NSMapTable *)v34->_nodesCache setObject:v34->_asrNode forKey:&off_10025E038];
  }
  id v83 = v27;
  id v50 = v28;
  id v25 = v85;
  if (a18 || a20)
  {
    if (v86) {
      v51 = (CSAttSiriUresNode *)v86;
    }
    else {
      v51 = objc_alloc_init(CSAttSiriUresNode);
    }
    uresNode = v34->_uresNode;
    v34->_uresNode = v51;

    [(NSMapTable *)v34->_nodesCache setObject:v34->_uresNode forKey:&off_10025E050];
    [(CSAttSiriUresNode *)v34->_uresNode setMitigatorDelegate:v34];
    v53 = objc_alloc_init(CSAttSiriNLDAClassifierNode);
    nldaClassifierNode = v34->_nldaClassifierNode;
    v34->_nldaClassifierNode = v53;

    [(NSMapTable *)v34->_nodesCache setObject:v34->_nldaClassifierNode forKey:&off_10025E068];
    [(CSAttSiriUresNode *)v34->_uresNode registerNLDAClassifierNode:v34->_nldaClassifierNode];
    [(CSAttSiriAsrNode *)v34->_asrNode registerUresNode:v34->_uresNode];
    [(CSAttSiriUresNode *)v34->_uresNode registerSSRNode:v34->_ssrNode];
    if (v33) {
      v55 = (CSAttSiriRCHandler *)v33;
    }
    else {
      v55 = [[CSAttSiriRCHandler alloc] initWithEndpointerNode:v34->_endpointerNode uresNode:v34->_uresNode];
    }
    rcHandler = v34->_rcHandler;
    v34->_rcHandler = v55;
  }
  if (a17)
  {
    if (v26) {
      v57 = (CSAttSiriAFTMNode *)v26;
    }
    else {
      v57 = objc_alloc_init(CSAttSiriAFTMNode);
    }
    aFTMNode = v34->_aFTMNode;
    v34->_aFTMNode = v57;

    [(NSMapTable *)v34->_nodesCache setObject:v34->_aFTMNode forKey:&off_10025E080];
  }
  v34->_boronScore = 0;
  if (a12)
  {
    if (v28) {
      v59 = (CSAttSiriContConvController *)v28;
    }
    else {
      v59 = [[CSAttSiriContConvController alloc] initWithAttSiriController:v34];
    }
    ccController = v34->_ccController;
    v34->_ccController = v59;

    v62 = [(CSAttSiriContConvController *)v34->_ccController nodesCache];
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_10010DA68;
    v89[3] = &unk_100251AD8;
    v63 = v34;
    v90 = v63;
    [v62 enumerateKeysAndObjectsUsingBlock:v89];

    [(CSAttSiriContConvController *)v34->_ccController setNodesCache:0];
    uint64_t v64 = [(CSAttSiriContConvController *)v34->_ccController osdNode];
    osdNode = v63->_osdNode;
    v63->_osdNode = (CSAttSiriOSDNode *)v64;

    if (CSIsIOS())
    {
      v66 = v63->_uresNode;
      v67 = [(CSAttSiriContConvController *)v34->_ccController gazeNode];
      [(CSAttSiriUresNode *)v66 registerGazeNode:v67];

      id v26 = v47;
    }
    [(CSAttSiriUresNode *)v63->_uresNode registerOSDNode:v63->_osdNode];
    [(CSAttSiriUresNode *)v63->_uresNode registerNLDAClassifierNode:v63->_nldaClassifierNode];
    v63->_shouldSkipAttending = 0;

    id v25 = v85;
    id v28 = v50;
    id v27 = v83;
    if (v83) {
      goto LABEL_39;
    }
LABEL_42:
    v68 = objc_alloc_init(CSAttSiriSpeechDetectionNode);
    goto LABEL_43;
  }
  if (v85) {
    v60 = v85;
  }
  else {
    v60 = objc_alloc_init(CSAttSiriOSDNode);
  }
  v69 = v34->_osdNode;
  v34->_osdNode = v60;
  id v27 = v83;

  [(NSMapTable *)v34->_nodesCache setObject:v34->_osdNode forKey:&off_10025E098];
  if (!v83) {
    goto LABEL_42;
  }
LABEL_39:
  v68 = (CSAttSiriSpeechDetectionNode *)v27;
LABEL_43:
  speechDetectionNode = v34->_speechDetectionNode;
  v34->_speechDetectionNode = v68;

  [(CSAttSiriSpeechDetectionNode *)v34->_speechDetectionNode setDelegate:v34];
  [(NSMapTable *)v34->_nodesCache setObject:v34->_speechDetectionNode forKey:&off_10025E0B0];
  [(CSAttSiriSpeechDetectionNode *)v34->_speechDetectionNode registerOSDNode:v34->_osdNode];
  if (v29)
  {
    v71 = (CSSpeechManager *)v29;
  }
  else
  {
    v71 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
  }
  speechManager = v34->_speechManager;
  v34->_speechManager = v71;

  if (v31)
  {
    v73 = (CSSiriEnabledMonitor *)v31;
  }
  else
  {
    v73 = +[CSSiriEnabledMonitor sharedInstance];
  }
  siriEnabledMonitor = v34->_siriEnabledMonitor;
  v34->_siriEnabledMonitor = v73;

  if (v32)
  {
    v75 = (CSSiriClientBehaviorMonitor *)v32;
  }
  else
  {
    v75 = +[CSSiriClientBehaviorMonitor sharedInstance];
  }
  siriClientBehaviorMonitor = v34->_siriClientBehaviorMonitor;
  v34->_siriClientBehaviorMonitor = v75;

  [(CSSiriClientBehaviorMonitor *)v34->_siriClientBehaviorMonitor registerObserver:v34];
  uint64_t v77 = +[CSAudioRouteChangeMonitor sharedInstance];
  audioRouteChangeMonitor = v34->_audioRouteChangeMonitor;
  v34->_audioRouteChangeMonitor = (CSAudioRouteChangeMonitor *)v77;

  long long v30 = v81;
LABEL_53:

  return v34;
}

- (CSAttSiriController)init
{
  if (+[CSUtils isMedocFeatureEnabled])
  {
    char v3 = 0;
  }
  else
  {
    if (CSIsCommunalDevice()) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = CSIsAppleSiliconMac();
    }
    unsigned __int8 v5 = +[CSUtils isContinuousConversationSupported];
    unsigned __int8 v6 = +[CSUtils supportAcousticProgressiveChecker];
    unsigned __int8 v7 = +[CSUtils supportsUnderstandingOnDevice];
    if (+[CSUtils supportsSpeechRecognitionOnDevice])unsigned __int8 v8 = 1; {
    else
    }
      unsigned __int8 v8 = +[CSUtils supportVoiceID];
    BYTE3(v11) = +[CSUtils supportsHybridUnderstandingOnDevice];
    BYTE2(v11) = v8;
    BYTE1(v11) = v7;
    LOBYTE(v11) = v6;
    LOBYTE(v10) = v5;
    self = objc_retain(-[CSAttSiriController initWithEndpointerNode:osdNode:ssrNode:asrNode:uresNode:needsSSRNode:aFtmNode:speechDetectionNode:ccController:isContinuousConverationEnabled:speechManager:siriEnabledMonitor:siriClientBehaviorMonitor:rcHandler:supportsAcousticProgressiveChecker:supportsUnderstandingOnDevice:requireASROnDevice:supportsHybridUnderstandingOnDevice:](self, "initWithEndpointerNode:osdNode:ssrNode:asrNode:uresNode:needsSSRNode:aFtmNode:speechDetectionNode:ccController:isContinuousConverationEnabled:speechManager:siriEnabledMonitor:siriClientBehaviorMonitor:rcHandler:supportsAcousticProgressiveChecker:supportsUnderstandingOnDevice:requireASROnDevice:supportsHybridUnderstandingOnDevice:", 0, 0, 0, 0, 0, v4, 0, 0, 0, v10, 0, 0, 0,
               0,
               v11));
    char v3 = self;
  }

  return v3;
}

@end