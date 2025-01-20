@interface ADClientConnection
- ($115C4C562B26FF47E01F9F4EA65B5887)adClientConnectionAuditToken;
- (ADClientConnection)initWithXPCConnection:(id)a3;
- (BOOL)_shouldSpeak;
- (BOOL)adSpeechSessionEnded;
- (BOOL)adTextToSpeechIsMuted;
- (BOOL)adWaitingForAudioFile;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_serviceDelegate;
- (id)_serviceDelegateWithErrorHandler:(id)a3;
- (id)currentBluetoothDevice;
- (void)_addAudioSessionAssertion:(id)a3;
- (void)_addSpeechCapturingContext:(id)a3;
- (void)_adjustSiriVolumeIfNeeded;
- (void)_barrierWithReply:(id)a3;
- (void)_broadcastCommandDictionary:(id)a3;
- (void)_clearAssistantInfoForAccountIdentifier:(id)a3;
- (void)_computeShouldSpeak;
- (void)_continuePendingSpeechRequestFromTimestamp:(double)a3;
- (void)_fetchAppContextForApplicationInfo:(id)a3 reply:(id)a4;
- (void)_handleRequestCompletedWithUUID:(id)a3 error:(id)a4;
- (void)_listInstalledServicesWithReply:(id)a3;
- (void)_logShouldSpeakState:(BOOL)a3;
- (void)_performCommandDictionary:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5;
- (void)_performTaskCommandDictionary:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5;
- (void)_pingServiceForIdentifier:(id)a3 reply:(id)a4;
- (void)_refreshAssistantValidation;
- (void)_registerForRingerStateNotification;
- (void)_removeAllAudioSessionAssertionsForReason:(id)a3;
- (void)_removeAllSpeechCapturingContextsForReason:(id)a3;
- (void)_requestBarrierIfNecessaryWithReply:(id)a3;
- (void)_requestBarrierWithReply:(id)a3;
- (void)_sendLargeData:(id)a3 reply:(id)a4;
- (void)_setADShouldSpeak:(BOOL)a3;
- (void)_setBluetoothDevice:(id)a3;
- (void)_setRequestCompletion:(id)a3;
- (void)_setRequestOptionsRequireTTS:(BOOL)a3;
- (void)_setServerForcedTTS:(BOOL)a3;
- (void)_speechRecordingDidFinish;
- (void)_startSpeechWithURL:(id)a3 isNarrowBand:(BOOL)a4;
- (void)_unregisterForRingerStateNotification;
- (void)_updateShouldSpeak;
- (void)_updateSpeechRequestOptions:(id)a3;
- (void)adAceConnectionWillRetryOnError:(id)a3;
- (void)adAcousticIDRequestDidFinishSuccessfully:(BOOL)a3;
- (void)adAcousticIDRequestWillStart;
- (void)adAudioSessionDidBecomeActive:(BOOL)a3;
- (void)adAudioSessionWillBecomeActive:(BOOL)a3;
- (void)adExtensionRequestFinishedForApplication:(id)a3 error:(id)a4;
- (void)adExtensionRequestWillStartForApplication:(id)a3;
- (void)adFailedToLaunchAppWithBundleIdentifier:(id)a3;
- (void)adGetBulletinContext:(id)a3;
- (void)adInvalidateCurrentUserActivity;
- (void)adMusicWasDetected;
- (void)adNetworkDidBecomeActive;
- (void)adQuickStopWasHandledWithActions:(unint64_t)a3;
- (void)adRequestDidCompleteWithSuccess:(BOOL)a3 error:(id)a4;
- (void)adRequestDidHandleFailedStartPlayback:(int64_t)a3;
- (void)adRequestDidReceiveCommand:(id)a3 reply:(id)a4;
- (void)adRequestDidReceiveTimeoutExtensionRequestWithDuration:(double)a3;
- (void)adRequestDidUpdateResponseMode:(id)a3;
- (void)adRequestEncounteredIntermediateError:(id)a3;
- (void)adRequestRequestedDismissAssistant;
- (void)adRequestRequestedDismissAssistantWithReason:(int64_t)a3;
- (void)adRequestRequestedOpenApplicationWithBundleID:(id)a3 URL:(id)a4 completion:(id)a5;
- (void)adRequestRequestedOpenURL:(id)a3 completion:(id)a4;
- (void)adRequestWillProcessStartPlayback:(int64_t)a3 intent:(id)a4 completion:(id)a5;
- (void)adRequestWillReceiveCommand:(id)a3;
- (void)adServerRequestsTTSStateUnmuted:(BOOL)a3;
- (void)adSetUserActivityInfo:(id)a3 webpageURL:(id)a4;
- (void)adShouldSpeakStateDidChange:(BOOL)a3;
- (void)adSpeechRecognitionDidFail:(id)a3 sessionUUID:(id)a4;
- (void)adSpeechRecognitionWillBeginRecognitionUpdateForTask:(id)a3;
- (void)adSpeechRecognized:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5;
- (void)adSpeechRecognizedPartialResult:(id)a3;
- (void)adSpeechRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4 bluetoothDevice:(id)a5 sessionRequestUUID:(id)a6 dictationOptions:(id)a7 context:(id)a8;
- (void)adSpeechRecordingDidCancelWithContext:(id)a3;
- (void)adSpeechRecordingDidChangeAVRecordRoute:(id)a3 bluetoothDevice:(id)a4 isDucking:(BOOL)a5 isTwoShot:(BOOL)a6 speechEndHostTime:(unint64_t)a7 context:(id)a8;
- (void)adSpeechRecordingDidDetectStartPointWithContext:(id)a3;
- (void)adSpeechRecordingDidEndWithContext:(id)a3;
- (void)adSpeechRecordingDidFail:(id)a3 context:(id)a4;
- (void)adSpeechRecordingPerformTwoShotPromptWithType:(int64_t)a3 context:(id)a4 completion:(id)a5;
- (void)adSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3 context:(id)a4;
- (void)adSpeechRecordingWillStopWithSignpostID:(unint64_t)a3;
- (void)adStartUIRequestWithText:(id)a3 completion:(id)a4;
- (void)adWantsToCacheImage:(id)a3;
- (void)adWillProcessAppLaunchWithBundleIdentifier:(id)a3;
- (void)adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3;
- (void)audioPlaybackService:(id)a3 didStartRequest:(id)a4;
- (void)audioPlaybackService:(id)a3 didStopRequest:(id)a4 error:(id)a5;
- (void)audioPlaybackService:(id)a3 willStartRequest:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionInterruptionNotificationWithUserInfo:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerLostNotification:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerResetNotification:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4;
- (void)bluetoothDevice:(id)a3 deviceInfoDidChangeFrom:(id)a4 to:(id)a5;
- (void)bluetoothDevice:(id)a3 headphoneInEarDetectionStateDidChangeFrom:(id)a4 to:(id)a5;
- (void)bluetoothDevice:(id)a3 headphoneListeningModeDidChangeFrom:(int64_t)a4 to:(int64_t)a5;
- (void)bluetoothDeviceDidInvalidate:(id)a3;
- (void)boostedPreheatWithStyle:(int64_t)a3 completion:(id)a4;
- (void)cancelRequestForReason:(int64_t)a3 withError:(id)a4;
- (void)cancelSpeech;
- (void)clearContext;
- (void)connectionDisconnected;
- (void)continuePendingSpeechRequestWithId:(unint64_t)a3 fromTimestamp:(double)a4;
- (void)dealloc;
- (void)didDismissUI;
- (void)emitHomeMetricInvocationEvent;
- (void)endSession;
- (void)fetchAppicationContextForApplicationInfo:(id)a3 supplementalContext:(id)a4 refID:(id)a5;
- (void)forceAudioSessionActiveWithContext:(id)a3 completion:(id)a4;
- (void)forceAudioSessionInactiveWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)getDeferredObjectsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)getRemoteClockTimerSnapshotWithCompletion:(id)a3;
- (void)getSerializedCachedObjectsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)performGenericAceCommand:(id)a3 interruptOutstandingRequest:(BOOL)a4 reply:(id)a5;
- (void)preheatWithStyle:(int64_t)a3 forOptions:(id)a4;
- (void)prepareForPhoneCall;
- (void)recordAWDSuccessMetrics;
- (void)recordCancellationMetrics;
- (void)recordFailureMetricsForError:(id)a3;
- (void)reportIssueForError:(id)a3 type:(int64_t)a4 context:(id)a5;
- (void)reportIssueForError:(id)a3 type:(int64_t)a4 subtype:(id)a5 context:(id)a6;
- (void)reportIssueForType:(id)a3 subtype:(id)a4 context:(id)a5;
- (void)requestShouldSpeakStateWithReply:(id)a3;
- (void)requestStateUpdateWithReply:(id)a3;
- (void)resumeInterruptedAudioPlaybackIfNeeded;
- (void)rollbackClearContext;
- (void)rollbackRequest;
- (void)setAdSpeechSessionEnded:(BOOL)a3;
- (void)setAlertContextDirty;
- (void)setApplicationContext:(id)a3;
- (void)setApplicationContextForApplicationInfos:(id)a3 withRefId:(id)a4;
- (void)setCarDNDActive:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setLockState:(BOOL)a3 showingLockScreen:(BOOL)a4;
- (void)setModesConfiguration:(id)a3;
- (void)setOverriddenApplicationContext:(id)a3 withContext:(id)a4;
- (void)startAcousticIDRequestWithOptions:(id)a3 context:(id)a4 completion:(id)a5;
- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 reply:(id)a5;
- (void)startRecordingForPendingSpeechRequestWithOptions:(id)a3 requestId:(unint64_t)a4 sessionUUID:(id)a5 completion:(id)a6;
- (void)startRequestWithInfo:(id)a3 completion:(id)a4;
- (void)startSpeechPronunciationRequestWithOptions:(id)a3 context:(id)a4 completion:(id)a5;
- (void)stopAllAudioPlaybackRequests:(BOOL)a3;
- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4;
- (void)stopSpeechWithOptions:(id)a3;
- (void)telephonyRequestCompleted;
- (void)updateSpeechOptions:(id)a3;
- (void)updateSpeechSynthesisRecord:(id)a3;
- (void)willPresentUIWithReply:(id)a3;
- (void)willSetApplicationContextWithRefId:(id)a3;
@end

@implementation ADClientConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_longLivedConnectionABCTimer, 0);
  objc_storeStrong((id *)&self->_speechCapturingContexts, 0);
  objc_storeStrong((id *)&self->_audioSessionAssertions, 0);
  objc_storeStrong((id *)&self->_bluetoothDevice, 0);
  objc_storeStrong((id *)&self->_presentedUITransaction, 0);
  objc_storeStrong(&self->_presentedUIReply, 0);
  objc_storeStrong(&self->_pendingSpeechRequestContinue, 0);
  objc_storeStrong((id *)&self->_clientConfiguration, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_requestGroup, 0);
  objc_storeStrong(&self->_requestCompletion, 0);
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)setAdSpeechSessionEnded:(BOOL)a3
{
  self->adSpeechSessionEnded = a3;
}

- (BOOL)adSpeechSessionEnded
{
  return self->adSpeechSessionEnded;
}

- (void)_continuePendingSpeechRequestFromTimestamp:(double)a3
{
  self->_pendingRequestTimestamp = a3;
  pendingSpeechRequestContinue = (void (**)(id, double))self->_pendingSpeechRequestContinue;
  if (pendingSpeechRequestContinue)
  {
    v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      v9 = "-[ADClientConnection _continuePendingSpeechRequestFromTimestamp:]";
      __int16 v10 = 2048;
      double v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s timestamp = %f", (uint8_t *)&v8, 0x16u);
      pendingSpeechRequestContinue = (void (**)(id, double))self->_pendingSpeechRequestContinue;
    }
    pendingSpeechRequestContinue[2](pendingSpeechRequestContinue, a3);
    id v7 = self->_pendingSpeechRequestContinue;
    self->_pendingSpeechRequestContinue = 0;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    __int16 v10 = "-[ADClientConnection listener:shouldAcceptNewConnection:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  id v7 = AFPendingSpeechRequestServiceInterface();
  [v5 setExportedInterface:v7];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)emitHomeMetricInvocationEvent
{
  id v2 = +[ADHomeInfoManager sharedInfoManager];
  [v2 emitHomeMetricInvocationEvent];
}

- (void)_refreshAssistantValidation
{
  id v2 = +[ADCommandCenter sharedCommandCenter];
  [v2 refreshAssistantValidation];
}

- (void)_startSpeechWithURL:(id)a3 isNarrowBand:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[ADCommandCenter sharedCommandCenter];
  [v7 startSpeechRequestWithURL:v6 isNarrowBand:v4 withDelegate:self];
}

- (void)_requestBarrierIfNecessaryWithReply:(id)a3
{
  id v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 requestBarrierIfNecessary:v3];
}

- (void)_requestBarrierWithReply:(id)a3
{
  id v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 requestBarrier:v3];
}

- (void)_barrierWithReply:(id)a3
{
}

- (void)_clearAssistantInfoForAccountIdentifier:(id)a3
{
  id v3 = +[ADAccount accountForIdentifier:a3];
  [v3 clearAssistantData];
  [v3 setServerCertificateData:0];
  [v3 setValidationData:0];
  [v3 save];
}

- (void)_fetchAppContextForApplicationInfo:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADCommandCenter sharedCommandCenter];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100313AEC;
  v9[3] = &unk_10050CE88;
  id v10 = v5;
  id v8 = v5;
  [v7 fetchContextForApplicationInfo:v6 completion:v9];
}

- (void)_broadcastCommandDictionary:(id)a3
{
  id v6 = +[AceObject aceObjectWithDictionary:a3];
  if (([v6 conformsToProtocol:&OBJC_PROTOCOL___SAClientBoundCommand] & 1) == 0)
  {
    id v3 = objc_alloc_init((Class)SAUIAddViews);
    id v4 = +[NSArray arrayWithObject:v6];
    [v3 setViews:v4];

    id v6 = v3;
  }
  id v5 = +[ADCommandCenter sharedCommandCenter];
  [v5 _broadcastCommand:v6];
}

- (void)_performTaskCommandDictionary:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[ADCommandCenter sharedQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100313D84;
  block[3] = &unk_10050E1D8;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, block);
}

- (void)_performCommandDictionary:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[ADCommandCenter sharedQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003141A4;
  v15[3] = &unk_10050C278;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  SEL v19 = a2;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)_sendLargeData:(id)a3 reply:(id)a4
{
}

- (void)_pingServiceForIdentifier:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[AFInstanceContext currentContext];
  id v8 = [[ADServiceManager alloc] initWithInstanceContext:v7];
  id v9 = [(ADServiceManager *)v8 serviceForIdentifier:v6];

  if (v9)
  {
    id v10 = objc_alloc_init((Class)SAPing);
    id v11 = SiriCoreUUIDStringCreate();
    [v10 setAceId:v11];
    id v12 = [v10 groupIdentifier];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100314674;
    v13[3] = &unk_10050CF00;
    id v14 = v5;
    [v9 handleCommand:v10 forDomain:v12 executionContext:0 reply:v13];
  }
  else
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

- (void)_listInstalledServicesWithReply:(id)a3
{
  id v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 _listInstalledServicesWithCompletion:v3];
}

- (void)adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 adviseSessionArbiterToContinueWithPreviousWinner:v3];
}

- (void)reportIssueForType:(id)a3 subtype:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    id v15 = "-[ADClientConnection reportIssueForType:subtype:context:]";
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Telling ABC about %@", (uint8_t *)&v14, 0x16u);
  }
  id v12 = +[SiriCoreSymptomsReporter sharedInstance];
  uint64_t v13 = [(NSXPCConnection *)self->_xpcConnection processIdentifier];
  [v12 reportIssueForType:v8 subType:v9 context:v10 processIdentifier:v13 walkboutStatus:byte_100585E38];
}

- (void)reportIssueForError:(id)a3 type:(int64_t)a4 subtype:(id)a5 context:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v16 = +[SiriCoreSymptomsReporter sharedInstance];
  uint64_t v13 = [(NSXPCConnection *)self->_xpcConnection processIdentifier];
  uint64_t v14 = byte_100585E38;
  id v15 = sub_100078668();
  [v16 reportIssueForError:v12 type:a4 subtype:v11 context:v10 processIdentifier:v13 walkboutStatus:v14 triggerForIDSIdentifiers:v15];
}

- (void)reportIssueForError:(id)a3 type:(int64_t)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v13 = +[SiriCoreSymptomsReporter sharedInstance];
  uint64_t v10 = [(NSXPCConnection *)self->_xpcConnection processIdentifier];
  uint64_t v11 = byte_100585E38;
  id v12 = sub_100078668();
  [v13 reportIssueForError:v9 type:a4 context:v8 processIdentifier:v10 walkboutStatus:v11 triggerForIDSIdentifiers:v12];
}

- (void)updateSpeechSynthesisRecord:(id)a3
{
  id v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 updateSpeechSynthesisRecord:v3];
}

- (void)stopAllAudioPlaybackRequests:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[ADSpeechManager sharedManager];
  id v4 = [v5 audioPlaybackService];
  [v4 stopAllRequests:v3 completion:0];
}

- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v7 = +[ADSpeechManager sharedManager];
  id v6 = [v7 audioPlaybackService];
  [v6 stopRequest:v5 immediately:v4];
}

- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 reply:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v10 = +[ADSpeechManager sharedManager];
  id v9 = [v10 audioPlaybackService];
  [v9 startRequest:v8 options:a4 completion:v7];
}

- (void)getRemoteClockTimerSnapshotWithCompletion:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = +[ADClockService sharedService];
    id v5 = [v4 remoteTimerManager];

    if (v5)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100314D5C;
      v7[3] = &unk_10050D080;
      id v8 = v3;
      [v5 getSnapshotsByDeviceIdentifierWithCompletion:v7];
    }
    else
    {
      id v6 = +[AFError errorWithCode:13];
      (*((void (**)(id, void, void *))v3 + 2))(v3, 0, v6);
    }
  }
}

- (void)getSerializedCachedObjectsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableSet);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v12);
          uint64_t v14 = +[INCache sharedCache];
          id v15 = [v14 cacheableObjectForIdentifier:v13];

          if (v15) {
            [v7 addObject:v15];
          }

          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100315148;
    v16[3] = &unk_10050C250;
    id v17 = v6;
    +[INSerializedCacheItem serializeCacheableObjects:v7 completion:v16];
  }
}

- (void)getDeferredObjectsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADCommandCenter sharedCommandCenter];
  [v7 getDeferredObjectsWithIdentifiers:v6 completion:v5];
}

- (void)recordAWDSuccessMetrics
{
  id v2 = +[ADCommandCenter sharedCommandCenter];
  objc_msgSend(v2, "_metrics_awdRequestEnd");
}

- (void)recordCancellationMetrics
{
  id v2 = +[ADCommandCenter sharedCommandCenter];
  objc_msgSend(v2, "_metrics_recordCancellationMetrics");
}

- (void)recordFailureMetricsForError:(id)a3
{
  id v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  objc_msgSend(v4, "_metrics_recordFailureMetricsForError:", v3);
}

- (void)telephonyRequestCompleted
{
  id v2 = +[ADCommandCenter sharedCommandCenter];
  [v2 telephonyRequestCompleted];
}

- (void)prepareForPhoneCall
{
  id v2 = +[ADCommandCenter sharedCommandCenter];
  [v2 prepareForPhoneCall];
}

- (void)setAlertContextDirty
{
  id v2 = +[ADCommandCenter sharedCommandCenter];
  [v2 setAlertContextDirty];
}

- (void)setOverriddenApplicationContext:(id)a3 withContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADCommandCenter sharedCommandCenter];
  [v7 setOverriddenApplicationContext:v6 withContext:v5];
}

- (void)setApplicationContextForApplicationInfos:(id)a3 withRefId:(id)a4
{
}

- (void)fetchAppicationContextForApplicationInfo:(id)a3 supplementalContext:(id)a4 refID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[ADCommandCenter sharedCommandCenter];
  [v10 fetchAppicationContextForApplicationInfo:v9 supplementalContext:v8 refID:v7];
}

- (void)setApplicationContext:(id)a3
{
  id v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 setApplicationContext:v3];
}

- (void)willSetApplicationContextWithRefId:(id)a3
{
  id v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 willSetApplicationContextWithRefId:v3];
}

- (void)rollbackClearContext
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[ADClientConnection rollbackClearContext]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
  }
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 rollbackClearContext];
}

- (void)clearContext
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[ADClientConnection clearContext]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
  }
  [(ADClientConnection *)self _setServerForcedTTS:0];
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 clearContext];
}

- (void)performGenericAceCommand:(id)a3 interruptOutstandingRequest:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = +[ADCommandCenter sharedCommandCenter];
  [v10 handleGenericAceCommand:v9 withDelegate:self interruptOutstandingRequest:v5 targetReplyQueue:self->_queue reply:v8];
}

- (void)requestStateUpdateWithReply:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(ADClientConnection *)self _shouldSpeak];
  BOOL v5 = +[ADSpeechManager sharedManager];
  id v6 = [v5 audioSessionController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003159F4;
  v8[3] = &unk_10050C228;
  id v9 = v4;
  char v10 = (char)self;
  id v7 = v4;
  [v6 getAudioSessionIDWithCompletion:v8];
}

- (void)requestShouldSpeakStateWithReply:(id)a3
{
  if (a3)
  {
    id v4 = (void (**)(id, BOOL))a3;
    v4[2](v4, [(ADClientConnection *)self _shouldSpeak]);
  }
}

- (void)stopSpeechWithOptions:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315650;
    id v8 = "-[ADClientConnection stopSpeechWithOptions:]";
    __int16 v9 = 2048;
    char v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p %@", (uint8_t *)&v7, 0x20u);
  }
  id v6 = +[ADCommandCenter sharedCommandCenter];
  [v6 stopSpeechWithOptions:v4 forDelegate:self];
}

- (void)cancelSpeech
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[ADClientConnection cancelSpeech]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
  }
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 cancelSpeechForDelegate:self];

  [(ADClientConnection *)self _continuePendingSpeechRequestFromTimestamp:0.0];
}

- (void)rollbackRequest
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[ADClientConnection rollbackRequest]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
  }
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 rollbackRequestForDelegate:self];
}

- (void)cancelRequestForReason:(int64_t)a3 withError:(id)a4
{
  id v6 = a4;
  __int16 v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v14 = "-[ADClientConnection cancelRequestForReason:withError:]";
    __int16 v15 = 2048;
    id v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  id v8 = @"Siri Event";
  CFStringRef v11 = @"Siri Event";
  CFStringRef v12 = @"ClientConnection cancelRequest";
  __int16 v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  sub_1001FC4B0(v9);

  char v10 = +[ADCommandCenter sharedCommandCenter];
  [v10 cancelRequestForDelegate:self reason:a3 error:v6];

  [(ADClientConnection *)self _continuePendingSpeechRequestFromTimestamp:0.0];
}

- (void)updateSpeechOptions:(id)a3
{
  id v4 = a3;
  int v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315650;
    id v8 = "-[ADClientConnection updateSpeechOptions:]";
    __int16 v9 = 2048;
    char v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p %@", (uint8_t *)&v7, 0x20u);
  }
  [(ADClientConnection *)self _updateSpeechRequestOptions:v4];
  id v6 = +[ADCommandCenter sharedCommandCenter];
  [v6 updateSpeechOptions:v4 forDelegate:self];
}

- (void)startAcousticIDRequestWithOptions:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  [(ADClientConnection *)self _setRequestCompletion:a5];
  [(ADClientConnection *)self _updateSpeechRequestOptions:v9];
  id v10 = +[ADCommandCenter sharedCommandCenter];
  [v10 startAcousticIDRequestWithDelegate:self withOptions:v9 context:v8];
}

- (void)startSpeechPronunciationRequestWithOptions:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  [(ADClientConnection *)self _setRequestCompletion:a5];
  [(ADClientConnection *)self _updateSpeechRequestOptions:v9];
  id v10 = +[ADCommandCenter sharedCommandCenter];
  [v10 startSpeechPronunciationRequestWithDelegate:self withOptions:v9 pronunciationContext:v8];
}

- (void)continuePendingSpeechRequestWithId:(unint64_t)a3 fromTimestamp:(double)a4
{
  unint64_t pendingRequestId = self->_pendingRequestId;
  if (pendingRequestId == a3)
  {
    [(ADClientConnection *)self _continuePendingSpeechRequestFromTimestamp:a4];
  }
  else
  {
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315650;
      id v8 = "-[ADClientConnection continuePendingSpeechRequestWithId:fromTimestamp:]";
      __int16 v9 = 2048;
      unint64_t v10 = pendingRequestId;
      __int16 v11 = 2048;
      unint64_t v12 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Ignoring due to id mismatch %lu != %lu", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)startRecordingForPendingSpeechRequestWithOptions:(id)a3 requestId:(unint64_t)a4 sessionUUID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v22 = "-[ADClientConnection startRecordingForPendingSpeechRequestWithOptions:requestId:sessionUUID:completion:]";
    __int16 v23 = 2048;
    v24 = self;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2048;
    unint64_t v28 = a4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s %p %@ %lu", buf, 0x2Au);
  }
  uint64_t v14 = @"Siri Event";
  CFStringRef v19 = @"Siri Event";
  CFStringRef v20 = @"ClientConnection startRecordingForPendingSpeechRequest";
  __int16 v15 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  sub_1001FC4B0(v15);

  +[AFDictationDiscoverabilitySignalsStreamManager sendSiriRequestStartedEventWithBundleIdentifier:@"com.apple.assistantd" context:0 userInfo:0];
  [(ADClientConnection *)self _continuePendingSpeechRequestFromTimestamp:0.0];
  self->_unint64_t pendingRequestId = a4;
  self->_pendingRequestTimestamp = -1.0;
  [(ADClientConnection *)self _setRequestCompletion:v12];
  [(ADClientConnection *)self _updateSpeechRequestOptions:v10];
  id v16 = +[ADCommandCenter sharedCommandCenter];
  id v17 = [v11 UUIDString];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100316424;
  v18[3] = &unk_10050C200;
  v18[4] = self;
  [v16 startRecordingForPendingSpeechRequestForDelegate:self withOptions:v10 sessionUUID:v17 completion:v18];
}

- (void)startRequestWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    long long v18 = "-[ADClientConnection startRequestWithInfo:completion:]";
    __int16 v19 = 2048;
    CFStringRef v20 = self;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10031678C;
  v14[3] = &unk_10050DF38;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  id v16 = v7;
  id v10 = v7;
  [(ADClientConnection *)self _setRequestCompletion:v14];
  requestInfo = self->_requestInfo;
  self->_requestInfo = (AFRequestInfo *)v9;
  id v12 = v9;

  [(ADClientConnection *)self _updateShouldSpeak];
  uint64_t v13 = +[ADCommandCenter sharedCommandCenter];
  [v13 startRequest:v12 withDelegate:self];
}

- (void)_setRequestCompletion:(id)a3
{
  id v4 = a3;
  requestCompletion = (void (**)(id, void *))self->_requestCompletion;
  if (requestCompletion)
  {
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      requestUUID = self->_requestUUID;
      int v18 = 136315650;
      __int16 v19 = "-[ADClientConnection _setRequestCompletion:]";
      __int16 v20 = 2048;
      __int16 v21 = self;
      __int16 v22 = 2112;
      __int16 v23 = requestUUID;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s %p Invoking overlapping request completion with UUID %@...", (uint8_t *)&v18, 0x20u);
      requestCompletion = (void (**)(id, void *))self->_requestCompletion;
    }
    id v7 = +[AFError errorWithCode:20];
    requestCompletion[2](requestCompletion, v7);

    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      id v17 = self->_requestUUID;
      int v18 = 136315650;
      __int16 v19 = "-[ADClientConnection _setRequestCompletion:]";
      __int16 v20 = 2048;
      __int16 v21 = self;
      __int16 v22 = 2112;
      __int16 v23 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s %p Invoked overlapping request completion with UUID %@.", (uint8_t *)&v18, 0x20u);
    }
  }
  id v9 = objc_retainBlock(v4);
  id v10 = self->_requestCompletion;
  self->_requestCompletion = v9;

  id v11 = (NSUUID *)objc_alloc_init((Class)NSUUID);
  id v12 = self->_requestUUID;
  self->_requestUUID = v11;

  requestGroup = self->_requestGroup;
  self->_requestGroup = 0;

  uint64_t v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v15 = self->_requestUUID;
    int v18 = 136315650;
    __int16 v19 = "-[ADClientConnection _setRequestCompletion:]";
    __int16 v20 = 2048;
    __int16 v21 = self;
    __int16 v22 = 2112;
    __int16 v23 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s %p Set new request UUID as %@.", (uint8_t *)&v18, 0x20u);
  }
}

- (void)endSession
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[ADClientConnection endSession]";
    __int16 v12 = 2048;
    uint64_t v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  id v4 = @"Siri Event";
  CFStringRef v8 = @"Siri Event";
  CFStringRef v9 = @"ClientConnection endSession";
  int v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  sub_1001FC4B0(v5);

  id v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Client Connection (pid = %d) Requested End Session", -[NSXPCConnection processIdentifier](self->_xpcConnection, "processIdentifier"));
  [(ADClientConnection *)self _removeAllSpeechCapturingContextsForReason:v6];
  [(ADClientConnection *)self _removeAllAudioSessionAssertionsForReason:v6];
  [(ADClientConnection *)self _setBluetoothDevice:0];
  id v7 = +[ADCommandCenter sharedCommandCenter];
  [v7 endSessionForDelegate:self];
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  int v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    id v10 = "-[ADClientConnection setConfiguration:]";
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p configuration = %@", (uint8_t *)&v9, 0x20u);
  }
  id v6 = (AFClientConfiguration *)[v4 copy];
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  CFStringRef v8 = +[ADCommandCenter sharedCommandCenter];
  [v8 setConfiguration:v4 forClient:self];
}

- (void)didDismissUI
{
  int64_t numberOfPresentedUIs = self->_numberOfPresentedUIs;
  id v4 = AFSiriLogContextDaemon;
  self->_int64_t numberOfPresentedUIs = numberOfPresentedUIs - 1;
  if (numberOfPresentedUIs < 1)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315906;
      __int16 v13 = "-[ADClientConnection didDismissUI]";
      __int16 v14 = 2048;
      id v15 = self;
      __int16 v16 = 2048;
      int64_t v17 = numberOfPresentedUIs;
      __int16 v18 = 2048;
      int64_t v19 = numberOfPresentedUIs - 1;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s %p numberOfPresentedUIs (%ld -> %ld)", (uint8_t *)&v12, 0x2Au);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315906;
      __int16 v13 = "-[ADClientConnection didDismissUI]";
      __int16 v14 = 2048;
      id v15 = self;
      __int16 v16 = 2048;
      int64_t v17 = numberOfPresentedUIs;
      __int16 v18 = 2048;
      int64_t v19 = numberOfPresentedUIs - 1;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s %p numberOfPresentedUIs (%ld -> %ld)", (uint8_t *)&v12, 0x2Au);
    }
    if (numberOfPresentedUIs == 1)
    {
      presentedUIReply = (void (**)(void))self->_presentedUIReply;
      if (presentedUIReply)
      {
        presentedUIReply[2]();
        id v7 = self->_presentedUIReply;
        self->_presentedUIReply = 0;
      }
      presentedUITransaction = self->_presentedUITransaction;
      self->_presentedUITransaction = 0;

      int v9 = +[ADCommandCenter sharedCommandCenter];
      id v10 = NSStringFromSelector(a2);
      [v9 dismissedAllVisibleAssistantUIForReason:v10];

      __int16 v11 = +[ADArbitrationFeedbackManager sharedManager];
      [v11 assistantDismissed];
    }
  }
}

- (void)willPresentUIWithReply:(id)a3
{
  int v5 = (void (**)(void))a3;
  if ((AFIsHorseman() & 1) == 0)
  {
    id v6 = +[ADCommandCenter sharedCommandCenter];
    id v7 = NSStringFromSelector(a2);
    [v6 showingVisibleAssistantUIForReason:v7 completion:0];
  }
  int64_t numberOfPresentedUIs = self->_numberOfPresentedUIs;
  self->_int64_t numberOfPresentedUIs = numberOfPresentedUIs + 1;
  int v9 = AFSiriLogContextDaemon;
  if (numberOfPresentedUIs < 0)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v21 = "-[ADClientConnection willPresentUIWithReply:]";
      __int16 v22 = 2048;
      __int16 v23 = self;
      __int16 v24 = 2048;
      int64_t v25 = numberOfPresentedUIs;
      __int16 v26 = 2048;
      int64_t v27 = numberOfPresentedUIs + 1;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s %p numberOfPresentedUIs (%ld -> %ld)", buf, 0x2Au);
    }
    v5[2](v5);
  }
  else
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v21 = "-[ADClientConnection willPresentUIWithReply:]";
      __int16 v22 = 2048;
      __int16 v23 = self;
      __int16 v24 = 2048;
      int64_t v25 = numberOfPresentedUIs;
      __int16 v26 = 2048;
      int64_t v27 = numberOfPresentedUIs + 1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %p numberOfPresentedUIs (%ld -> %ld)", buf, 0x2Au);
    }
    if (!numberOfPresentedUIs)
    {
      id v10 = (OS_os_transaction *)os_transaction_create();
      presentedUITransaction = self->_presentedUITransaction;
      self->_presentedUITransaction = v10;
    }
    id v12 = objc_retainBlock(self->_presentedUIReply);
    if (v12)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100317120;
      v17[3] = &unk_10050C868;
      __int16 v18 = v5;
      id v19 = v12;
      __int16 v13 = objc_retainBlock(v17);
      id presentedUIReply = self->_presentedUIReply;
      self->_id presentedUIReply = v13;

      id v15 = v18;
    }
    else
    {
      __int16 v16 = objc_retainBlock(v5);
      id v15 = self->_presentedUIReply;
      self->_id presentedUIReply = v16;
    }
  }
}

- (void)setModesConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 setModesConfiguration:v3];
}

- (void)setCarDNDActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 setCarDNDActive:v3];
}

- (void)setLockState:(BOOL)a3 showingLockScreen:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = +[ADCommandCenter sharedCommandCenter];
  [v6 setLockState:v5 showingLockScreen:v4];
}

- (void)resumeInterruptedAudioPlaybackIfNeeded
{
  id v2 = +[ADCommandCenter sharedCommandCenter];
  [v2 resumeInterruptedAudioPlaybackIfNeeded];
}

- (void)forceAudioSessionInactiveWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Client Connection (pid = %d) Requested Force Audio Session Inactive", -[NSXPCConnection processIdentifier](self->_xpcConnection, "processIdentifier"));
  [(ADClientConnection *)self _removeAllAudioSessionAssertionsForReason:v7];

  id v8 = +[ADCommandCenter sharedCommandCenter];
  [v8 forceAudioSessionInactiveWithOptions:a3 completion:v6];
}

- (void)forceAudioSessionActiveWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[ADCommandCenter sharedCommandCenter];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100317458;
  v10[3] = &unk_10050C1D8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 forceAudioSessionActiveWithContext:v7 completion:v10];
}

- (void)boostedPreheatWithStyle:(int64_t)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = +[ADCommandCenter sharedCommandCenter];
  [v6 preheatWithStyle:a3 forOptions:0 completion:v5];
}

- (void)preheatWithStyle:(int64_t)a3 forOptions:(id)a4
{
  id v5 = a4;
  id v6 = +[ADCommandCenter sharedCommandCenter];
  [v6 preheatWithStyle:a3 forOptions:v5 completion:0];
}

- (void)bluetoothDeviceDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[ADClientConnection bluetoothDeviceDidInvalidate:]";
    __int16 v8 = 2048;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p bluetoothDevice = %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)bluetoothDevice:(id)a3 headphoneListeningModeDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  id v8 = a3;
  id v9 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136316162;
    id v11 = "-[ADClientConnection bluetoothDevice:headphoneListeningModeDidChangeFrom:to:]";
    __int16 v12 = 2048;
    __int16 v13 = self;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2048;
    int64_t v17 = a4;
    __int16 v18 = 2048;
    int64_t v19 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %p bluetoothDevice = %@, from = %ld, to = %ld", (uint8_t *)&v10, 0x34u);
  }
}

- (void)bluetoothDevice:(id)a3 headphoneInEarDetectionStateDidChangeFrom:(id)a4 to:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    __int16 v24 = "-[ADClientConnection bluetoothDevice:headphoneInEarDetectionStateDidChangeFrom:to:]";
    __int16 v25 = 2048;
    __int16 v26 = self;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    id v32 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %p bluetoothDevice = %@, from = %@, to = %@", buf, 0x34u);
  }
  uint64_t v12 = mach_absolute_time();
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100317A00;
  block[3] = &unk_10050D7A0;
  id v18 = v8;
  int64_t v19 = self;
  id v20 = v9;
  id v21 = v10;
  uint64_t v22 = v12;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(queue, block);
}

- (void)bluetoothDevice:(id)a3 deviceInfoDidChangeFrom:(id)a4 to:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136316162;
    __int16 v13 = "-[ADClientConnection bluetoothDevice:deviceInfoDidChangeFrom:to:]";
    __int16 v14 = 2048;
    id v15 = self;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %p bluetoothDevice = %@, from = %@, to = %@", (uint8_t *)&v12, 0x34u);
  }
}

- (void)audioPlaybackService:(id)a3 didStopRequest:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003182F8;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)audioPlaybackService:(id)a3 didStartRequest:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003183E4;
  v8[3] = &unk_10050E160;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)audioPlaybackService:(id)a3 willStartRequest:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003184D0;
  v8[3] = &unk_10050E160;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerResetNotification:(id)a4
{
  id v5 = a4;
  int v6 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[ADClientConnection audioSessionController:didReceiveAudioSessionOwnerResetNotification:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100318644;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerLostNotification:(id)a4
{
  id v5 = a4;
  int v6 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[ADClientConnection audioSessionController:didReceiveAudioSessionOwnerLostNotification:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003187F0;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4
{
  id v5 = a4;
  int v6 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[ADClientConnection audioSessionController:didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100318958;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:(id)a4
{
  id v5 = a4;
  int v6 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[ADClientConnection audioSessionController:didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100318B04;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4
{
  id v4 = a4;
  id v5 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[ADClientConnection audioSessionController:didReceiveAudioSessionRouteChangeNotificationWithUserInfo:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s userInfo = %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionInterruptionNotificationWithUserInfo:(id)a4
{
  id v5 = a4;
  int v6 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v18 = "-[ADClientConnection audioSessionController:didReceiveAudioSessionInterruptionNotificationWithUserInfo:]";
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  id v7 = [v5 objectForKey:AVAudioSessionInterruptionTypeKey];
  id v8 = [v7 unsignedIntegerValue];

  id v9 = [v5 objectForKey:AVAudioSessionInterruptionOptionKey];
  id v10 = [v9 unsignedIntegerValue];

  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100318D9C;
  v13[3] = &unk_10050D3C8;
  void v13[4] = self;
  id v14 = v5;
  id v15 = v8;
  id v16 = v10;
  id v12 = v5;
  dispatch_async(queue, v13);
}

- (void)adShouldSpeakStateDidChange:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100318EB0;
  v4[3] = &unk_10050CD50;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)_logShouldSpeakState:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AFAnalytics sharedAnalytics];
  id v6 = v4;
  if (v3) {
    uint64_t v5 = 1427;
  }
  else {
    uint64_t v5 = 1428;
  }
  [v4 logEventWithType:v5 context:0];
}

- (BOOL)adWaitingForAudioFile
{
  return 0;
}

- (void)adSpeechRecordingPerformTwoShotPromptWithType:(int64_t)a3 context:(id)a4 completion:(id)a5
{
  id v7 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100319008;
  block[3] = &unk_10050C148;
  void block[4] = self;
  id v11 = v7;
  int64_t v12 = a3;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)adSpeechRecordingDidDetectStartPointWithContext:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031946C;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)adSpeechRecognitionDidFail:(id)a3 sessionUUID:(id)a4
{
  id v5 = a3;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100319848;
  v8[3] = &unk_10050E160;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)adSpeechRecognitionWillBeginRecognitionUpdateForTask:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003199BC;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adSpeechRecognizedPartialResult:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100319AB4;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adSpeechRecognized:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5
{
  id v6 = a3;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100319C30;
  v9[3] = &unk_10050E160;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)adSpeechRecordingWillStopWithSignpostID:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100319D88;
  v4[3] = &unk_10050D8C0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)adSpeechRecordingDidFail:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = @"Siri Event";
  CFStringRef v13 = @"Siri Event";
  CFStringRef v14 = @"ClientConnection speechRecordingDidFail";
  id v7 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  sub_1001FC4B0(v7);

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031A180;
  block[3] = &unk_10050E160;
  id v11 = v5;
  int64_t v12 = self;
  id v9 = v5;
  dispatch_async(queue, block);
}

- (void)adSpeechRecordingDidCancelWithContext:(id)a3
{
  id v4 = @"Siri Event";
  CFStringRef v8 = @"Siri Event";
  CFStringRef v9 = @"ClientConnection speechRecordingDidCancel";
  id v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  sub_1001FC4B0(v5);

  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10031A62C;
  v7[3] = &unk_10050E138;
  void v7[4] = self;
  dispatch_async(queue, v7);
}

- (void)adSpeechRecordingDidEndWithContext:(id)a3
{
  id v4 = @"Siri Event";
  CFStringRef v8 = @"Siri Event";
  CFStringRef v9 = @"speechRecordingDidEnd";
  id v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  sub_1001FC4B0(v5);

  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10031AA68;
  v7[3] = &unk_10050E138;
  void v7[4] = self;
  dispatch_async(queue, v7);
}

- (void)adSpeechRecordingDidChangeAVRecordRoute:(id)a3 bluetoothDevice:(id)a4 isDucking:(BOOL)a5 isTwoShot:(BOOL)a6 speechEndHostTime:(unint64_t)a7 context:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  queue = self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10031AEC0;
  v21[3] = &unk_10050C0F8;
  v21[4] = self;
  id v22 = v15;
  id v23 = v16;
  id v24 = v14;
  BOOL v26 = a5;
  BOOL v27 = a6;
  unint64_t v25 = a7;
  id v18 = v14;
  id v19 = v16;
  id v20 = v15;
  dispatch_async(queue, v21);
}

- (void)adSpeechRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4 bluetoothDevice:(id)a5 sessionRequestUUID:(id)a6 dictationOptions:(id)a7 context:(id)a8
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a8;
  kdebug_trace();
  kdebug_trace();
  id v15 = @"Siri Event";
  CFStringRef v26 = @"Siri Event";
  CFStringRef v27 = @"ClientConnection speechRecordingDidBegin";
  id v16 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  sub_1001FC4B0(v16);

  queue = self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10031B3E4;
  v21[3] = &unk_10050C0D0;
  v21[4] = self;
  id v22 = v13;
  id v23 = v14;
  id v24 = v12;
  unsigned int v25 = a4;
  id v18 = v12;
  id v19 = v14;
  id v20 = v13;
  dispatch_async(queue, v21);
}

- (void)adSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031B824;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_updateShouldSpeak
{
  int combinedShouldSpeakState = self->_combinedShouldSpeakState;
  [(ADClientConnection *)self _computeShouldSpeak];
  int v4 = self->_combinedShouldSpeakState;
  if (v4 != combinedShouldSpeakState)
  {
    id v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      CFStringRef v6 = @"YES";
      *(_DWORD *)CFStringRef v8 = 136315650;
      *(void *)&void v8[4] = "-[ADClientConnection _updateShouldSpeak]";
      *(_WORD *)&v8[12] = 2112;
      if (!v4) {
        CFStringRef v6 = @"NO";
      }
      *(void *)&v8[14] = v6;
      __int16 v9 = 2112;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Sending should speak update: %@ to current client %@", v8, 0x20u);
    }
    id v7 = [(ADClientConnection *)self _serviceDelegate];
    [v7 shouldSpeakChanged:self->_combinedShouldSpeakState];
  }
}

- (BOOL)_shouldSpeak
{
  return self->_combinedShouldSpeakState;
}

- (void)_computeShouldSpeak
{
  if (self->_hasCachedADShouldSpeak)
  {
    if (!self->_cachedADShouldSpeak) {
      goto LABEL_5;
    }
LABEL_8:
    unsigned __int8 v4 = 1;
    goto LABEL_9;
  }
  self->_hasCachedADShouldSpeak = 1;
  int v3 = sub_1001FA0B4();
  self->_BOOL cachedADShouldSpeak = v3;
  if (v3) {
    goto LABEL_8;
  }
LABEL_5:
  if (self->_requestOptionsRequireTTS
    || self->_serverIsForcingTTS
    || ([(AFClientConfiguration *)self->_clientConfiguration isDeviceInStarkMode] & 1) != 0)
  {
    goto LABEL_8;
  }
  unsigned __int8 v4 = [(AFClientConfiguration *)self->_clientConfiguration isDeviceInCarDNDMode];
LABEL_9:
  self->_BOOL combinedShouldSpeakState = v4;
  if (([(AFRequestInfo *)self->_requestInfo options] & 2) != 0) {
    self->_BOOL combinedShouldSpeakState = 0;
  }
  id v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    BOOL cachedADShouldSpeak = self->_cachedADShouldSpeak;
    BOOL requestOptionsRequireTTS = self->_requestOptionsRequireTTS;
    BOOL serverIsForcingTTS = self->_serverIsForcingTTS;
    clientConfiguration = self->_clientConfiguration;
    id v10 = v5;
    LODWORD(clientConfiguration) = [(AFClientConfiguration *)clientConfiguration isDeviceInStarkMode];
    unsigned int v11 = [(AFClientConfiguration *)self->_clientConfiguration isDeviceInCarDNDMode];
    id v12 = [(AFRequestInfo *)self->_requestInfo options];
    BOOL combinedShouldSpeakState = self->_combinedShouldSpeakState;
    int v14 = 136316930;
    id v15 = "-[ADClientConnection _computeShouldSpeak]";
    __int16 v16 = 1024;
    BOOL v17 = cachedADShouldSpeak;
    __int16 v18 = 1024;
    BOOL v19 = requestOptionsRequireTTS;
    __int16 v20 = 1024;
    BOOL v21 = serverIsForcingTTS;
    __int16 v22 = 1024;
    int v23 = (int)clientConfiguration;
    __int16 v24 = 1024;
    unsigned int v25 = v11;
    __int16 v26 = 2048;
    id v27 = v12;
    __int16 v28 = 1024;
    BOOL v29 = combinedShouldSpeakState;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s ADShouldSpeak: %d Request Wants TTS: %d Server Wants TTS: %d Stark Mode: %d Car DND: %d Request Info Options: %lu Combined: %d", (uint8_t *)&v14, 0x3Au);
  }
}

- (void)_unregisterForRingerStateNotification
{
  int ringerStateToken = self->_ringerStateToken;
  if (ringerStateToken != -1)
  {
    notify_cancel(ringerStateToken);
    self->_int ringerStateToken = -1;
  }
}

- (void)_registerForRingerStateNotification
{
  if (self->_ringerStateToken == -1)
  {
    int out_token = -1;
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10031BFD0;
    v7[3] = &unk_10050C080;
    void v7[4] = self;
    uint32_t v4 = notify_register_dispatch("com.apple.springboard.ringerstate", &out_token, queue, v7);
    if (v4)
    {
      uint32_t v5 = v4;
      CFStringRef v6 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v10 = "-[ADClientConnection _registerForRingerStateNotification]";
        __int16 v11 = 1026;
        uint32_t v12 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s failed registering for ringer state token %{public}u", buf, 0x12u);
      }
    }
    else
    {
      self->_int ringerStateToken = out_token;
    }
  }
}

- (void)_setServerForcedTTS:(BOOL)a3
{
  self->_BOOL serverIsForcingTTS = a3;
  [(ADClientConnection *)self _updateShouldSpeak];
  if (self->_serverIsForcingTTS)
  {
    [(ADClientConnection *)self _registerForRingerStateNotification];
  }
  else
  {
    [(ADClientConnection *)self _unregisterForRingerStateNotification];
  }
}

- (void)_setRequestOptionsRequireTTS:(BOOL)a3
{
  self->_BOOL requestOptionsRequireTTS = a3;
  [(ADClientConnection *)self _updateShouldSpeak];
}

- (void)_setADShouldSpeak:(BOOL)a3
{
  self->_BOOL cachedADShouldSpeak = a3;
  self->_hasCachedADShouldSpeak = 1;
  [(ADClientConnection *)self _updateShouldSpeak];
}

- ($115C4C562B26FF47E01F9F4EA65B5887)adClientConnectionAuditToken
{
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    [(NSXPCConnection *)xpcConnection auditToken];
    xpcConnection = self->_xpcConnection;
  }
  return ($115C4C562B26FF47E01F9F4EA65B5887 *)[(NSXPCConnection *)xpcConnection processIdentifier];
}

- (void)adNetworkDidBecomeActive
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031C114;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)adFailedToLaunchAppWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10031C1F0;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adWillProcessAppLaunchWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10031C2DC;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adAudioSessionDidBecomeActive:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10031C3A8;
  v4[3] = &unk_10050CD50;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)adAudioSessionWillBecomeActive:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10031C474;
  v4[3] = &unk_10050CD50;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)adRequestWillProcessStartPlayback:(int64_t)a3 intent:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10031C59C;
  v13[3] = &unk_10050C278;
  id v15 = v9;
  int64_t v16 = a3;
  void v13[4] = self;
  id v14 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(queue, v13);
}

- (void)adRequestDidHandleFailedStartPlayback:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10031C75C;
  v4[3] = &unk_10050D8C0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)adServerRequestsTTSStateUnmuted:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10031C828;
  v4[3] = &unk_10050CD50;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)adAceConnectionWillRetryOnError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10031C8D0;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adInvalidateCurrentUserActivity
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031C998;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)adSetUserActivityInfo:(id)a3 webpageURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031CAA0;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)adAcousticIDRequestDidFinishSuccessfully:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10031CB6C;
  v4[3] = &unk_10050CD50;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)adMusicWasDetected
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031CC34;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)adAcousticIDRequestWillStart
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031CCEC;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)adQuickStopWasHandledWithActions:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10031CDA4;
  v4[3] = &unk_10050D8C0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)adRequestRequestedDismissAssistantWithReason:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10031CE6C;
  v4[3] = &unk_10050D8C0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)adRequestRequestedDismissAssistant
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031CF34;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)adExtensionRequestFinishedForApplication:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031D03C;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)adExtensionRequestWillStartForApplication:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10031D128;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adWantsToCacheImage:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10031D214;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)adTextToSpeechIsMuted
{
  BOOL combinedShouldSpeakState = self->_combinedShouldSpeakState;
  int v3 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v4 = v3;
    BOOL v5 = +[NSNumber numberWithBool:!combinedShouldSpeakState];
    int v7 = 136315394;
    id v8 = "-[ADClientConnection adTextToSpeechIsMuted]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  return !combinedShouldSpeakState;
}

- (void)adGetBulletinContext:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10031D4C8;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adRequestRequestedOpenURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031D718;
  block[3] = &unk_10050E1D8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)adRequestRequestedOpenApplicationWithBundleID:(id)a3 URL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10031D9A8;
  v15[3] = &unk_10050E228;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (void)adStartUIRequestWithText:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031DC00;
  block[3] = &unk_10050E1D8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)_adjustSiriVolumeIfNeeded
{
  id v2 = +[AFSiriHeadphonesMonitor sharedMonitor];
  int v3 = [v2 currentAudioRoute];

  if ([v3 supportsVolumeAdjustment])
  {
    id v4 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      BOOL v5 = v4;
      id v6 = [v3 btAddress];
      int v8 = 136315394;
      id v9 = "-[ADClientConnection _adjustSiriVolumeIfNeeded]";
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Adjusting Siri's volume for route: %@", (uint8_t *)&v8, 0x16u);
    }
    id v7 = +[ADSpeechManager sharedManager];
    [v7 adjustSiriOutputVolumeForRouteIfNeeded:v3];
  }
}

- (void)adRequestDidReceiveTimeoutExtensionRequestWithDuration:(double)a3
{
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[ADClientConnection adRequestDidReceiveTimeoutExtensionRequestWithDuration:]";
    __int16 v10 = 2048;
    double v11 = a3;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s durationInSeconds: %f", buf, 0x16u);
  }
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10031E05C;
  v7[3] = &unk_10050D8C0;
  void v7[4] = self;
  *(double *)&void v7[5] = a3;
  dispatch_async(queue, v7);
}

- (id)currentBluetoothDevice
{
  return self->_bluetoothDevice;
}

- (void)adRequestEncounteredIntermediateError:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    double v11 = "-[ADClientConnection adRequestEncounteredIntermediateError:]";
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Sending intermediate error %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10031E1F0;
  v8[3] = &unk_10050E160;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)adRequestDidCompleteWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v13 = "-[ADClientConnection adRequestDidCompleteWithSuccess:error:]";
    __int16 v14 = 2048;
    id v15 = self;
    __int16 v16 = 1024;
    BOOL v17 = v4;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %p success = %d, error = %@", buf, 0x26u);
  }
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10031E394;
  v10[3] = &unk_10050E160;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(queue, v10);
}

- (void)_handleRequestCompletedWithUUID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSUUID *)self->_requestUUID isEqual:v6])
  {
    requestCompletion = (void (**)(id, id))self->_requestCompletion;
    if (requestCompletion)
    {
      id v9 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        requestUUID = self->_requestUUID;
        int v18 = 136315650;
        id v19 = "-[ADClientConnection _handleRequestCompletedWithUUID:error:]";
        __int16 v20 = 2048;
        BOOL v21 = self;
        __int16 v22 = 2112;
        int v23 = requestUUID;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %p Invoking request completion with UUID %@...", (uint8_t *)&v18, 0x20u);
        requestCompletion = (void (**)(id, id))self->_requestCompletion;
      }
      requestCompletion[2](requestCompletion, v7);
      id v11 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        __int16 v12 = self->_requestUUID;
        int v18 = 136315650;
        id v19 = "-[ADClientConnection _handleRequestCompletedWithUUID:error:]";
        __int16 v20 = 2048;
        BOOL v21 = self;
        __int16 v22 = 2112;
        int v23 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %p Invoked request completion with UUID %@.", (uint8_t *)&v18, 0x20u);
      }
      id v13 = self->_requestCompletion;
      self->_requestCompletion = 0;
    }
    __int16 v14 = self->_requestUUID;
    self->_requestUUID = 0;

    requestGroup = self->_requestGroup;
    self->_requestGroup = 0;
  }
  else
  {
    __int16 v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      BOOL v17 = self->_requestUUID;
      int v18 = 136315906;
      id v19 = "-[ADClientConnection _handleRequestCompletedWithUUID:error:]";
      __int16 v20 = 2048;
      BOOL v21 = self;
      __int16 v22 = 2112;
      int v23 = v17;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s %p Ignored invoking request completion because UUID mismatched. (_requestUUID = %@, requestUUID = %@)", (uint8_t *)&v18, 0x2Au);
    }
  }
}

- (void)adRequestDidReceiveCommand:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = self->_queue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10031E9EC;
  v19[3] = &unk_10050BFD0;
  v19[4] = self;
  id v9 = v6;
  id v20 = v9;
  BOOL v21 = v8;
  id v22 = v7;
  id v10 = v7;
  id v11 = v8;
  __int16 v12 = objc_retainBlock(v19);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031EB60;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v17 = v9;
  id v18 = v12;
  __int16 v14 = v12;
  id v15 = v9;
  dispatch_async(queue, block);
}

- (void)adRequestDidUpdateResponseMode:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10031EE40;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adRequestWillReceiveCommand:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10031F048;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_removeAllAudioSessionAssertionsForReason:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v35 = "-[ADClientConnection _removeAllAudioSessionAssertionsForReason:]";
    __int16 v36 = 2048;
    v37 = self;
    __int16 v38 = 2112;
    id v39 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p reason = %@", buf, 0x20u);
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10031F3C4;
  v29[3] = &unk_10050C310;
  id v20 = v4;
  id v30 = v20;
  __int16 v31 = self;
  id v6 = +[AFAssertionContext newWithBuilder:v29];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = self->_speechCapturingContexts;
  id v8 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * i) relinquishAudioSessionAssertionsWithContext:v6];
      }
      id v9 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v9);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  __int16 v12 = self;
  id v13 = self->_audioSessionAssertions;
  id v14 = [(NSMutableOrderedSet *)v13 countByEnumeratingWithState:&v21 objects:v32 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
        id v19 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v35 = "-[ADClientConnection _removeAllAudioSessionAssertionsForReason:]";
          __int16 v36 = 2048;
          v37 = v12;
          __int16 v38 = 2112;
          id v39 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s %p audioSessionAssertion = %@", buf, 0x20u);
        }
        [v18 relinquishWithContext:v6 options:0];
      }
      id v15 = [(NSMutableOrderedSet *)v13 countByEnumeratingWithState:&v21 objects:v32 count:16];
    }
    while (v15);
  }

  [(NSMutableOrderedSet *)v12->_audioSessionAssertions removeAllObjects];
}

- (void)_addAudioSessionAssertion:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    uint64_t v10 = "-[ADClientConnection _addAudioSessionAssertion:]";
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p audioSessionAssertion = %@", (uint8_t *)&v9, 0x20u);
  }
  if (v4)
  {
    audioSessionAssertions = self->_audioSessionAssertions;
    if (!audioSessionAssertions)
    {
      id v7 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
      id v8 = self->_audioSessionAssertions;
      self->_audioSessionAssertions = v7;

      audioSessionAssertions = self->_audioSessionAssertions;
    }
    [(NSMutableOrderedSet *)audioSessionAssertions addObject:v4];
  }
}

- (void)_removeAllSpeechCapturingContextsForReason:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    long long v22 = "-[ADClientConnection _removeAllSpeechCapturingContextsForReason:]";
    __int16 v23 = 2048;
    long long v24 = self;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p reason = %@", buf, 0x20u);
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10031F7E8;
  v17[3] = &unk_10050C310;
  id v6 = v4;
  id v18 = v6;
  id v19 = self;
  id v7 = +[AFAssertionContext newWithBuilder:v17];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_speechCapturingContexts;
  id v9 = [(NSMutableOrderedSet *)v8 countByEnumeratingWithState:&v13 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      __int16 v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v12), "relinquishAudioSessionAssertionsWithContext:", v7, (void)v13);
        __int16 v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableOrderedSet *)v8 countByEnumeratingWithState:&v13 objects:v20 count:16];
    }
    while (v10);
  }

  [(NSMutableOrderedSet *)self->_speechCapturingContexts removeAllObjects];
}

- (void)_addSpeechCapturingContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    id v10 = "-[ADClientConnection _addSpeechCapturingContext:]";
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p speechCapturingContext = %@", (uint8_t *)&v9, 0x20u);
  }
  if (v4)
  {
    speechCapturingContexts = self->_speechCapturingContexts;
    if (!speechCapturingContexts)
    {
      id v7 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
      id v8 = self->_speechCapturingContexts;
      self->_speechCapturingContexts = v7;

      speechCapturingContexts = self->_speechCapturingContexts;
    }
    [(NSMutableOrderedSet *)speechCapturingContexts addObject:v4];
  }
}

- (void)_setBluetoothDevice:(id)a3
{
  BOOL v5 = (AFBluetoothDevice *)a3;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    int v9 = "-[ADClientConnection _setBluetoothDevice:]";
    __int16 v10 = 2048;
    __int16 v11 = self;
    __int16 v12 = 2112;
    __int16 v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %p bluetoothDevice = %@", (uint8_t *)&v8, 0x20u);
  }
  bluetoothDevice = self->_bluetoothDevice;
  if (bluetoothDevice != v5)
  {
    [(AFBluetoothDevice *)bluetoothDevice removeObserver:self];
    objc_storeStrong((id *)&self->_bluetoothDevice, a3);
    [(AFBluetoothDevice *)self->_bluetoothDevice addObserver:self];
  }
}

- (void)_speechRecordingDidFinish
{
  if ([(AFSpeechRequestOptions *)self->_requestOptions releaseAudioSessionOnRecordingCompletion])
  {
    [(ADClientConnection *)self _removeAllAudioSessionAssertionsForReason:@"Request Options Specified Release Audio Session On Recording Completion"];
    int v3 = +[ADCommandCenter sharedCommandCenter];
    [v3 forceAudioSessionInactiveWithOptions:1 completion:0];
  }
  requestOptions = self->_requestOptions;
  self->_requestOptions = 0;
}

- (void)_updateSpeechRequestOptions:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    __int16 v10 = "-[ADClientConnection _updateSpeechRequestOptions:]";
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p options = %@", (uint8_t *)&v9, 0x20u);
  }
  id v6 = (AFSpeechRequestOptions *)[v4 copy];
  requestOptions = self->_requestOptions;
  self->_requestOptions = v6;

  id v8 = [v4 activationEvent];
  if (v8 && v8 != (id)5) {
    [(ADClientConnection *)self _setRequestOptionsRequireTTS:AFSpeechEventIsVoiceTrigger()];
  }
}

- (id)_serviceDelegateWithErrorHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  xpcConnection = self->_xpcConnection;
  if (v4 && !xpcConnection)
  {
    id v6 = +[AFError errorWithCode:12];
    v4[2](v4, v6);

    xpcConnection = self->_xpcConnection;
  }
  id v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v4];

  return v7;
}

- (id)_serviceDelegate
{
  return [(NSXPCConnection *)self->_xpcConnection remoteObjectProxy];
}

- (void)connectionDisconnected
{
  int v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "-[ADClientConnection connectionDisconnected]";
    __int16 v18 = 2048;
    id v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  id v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Client Connection (pid = %d) Disconnected", -[NSXPCConnection processIdentifier](self->_xpcConnection, "processIdentifier"));
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031FF58;
  block[3] = &unk_10050E160;
  void block[4] = self;
  id v15 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
  id v7 = self;
  id v8 = +[ADTTSMutingObserver sharedInstance];
  [v8 removeHandsFreeStateObserver:v7];

  int v9 = +[ADSpeechManager sharedManager];
  __int16 v10 = [v9 audioSessionController];
  [v10 unregisterObserver:v7];

  __int16 v11 = +[ADSpeechManager sharedManager];
  __int16 v12 = [v11 audioPlaybackService];
  [v12 removeListener:v7];

  __int16 v13 = +[ADCommandCenter sharedCommandCenter];
  [v13 setConfiguration:0 forClient:v7];
}

- (void)dealloc
{
  int v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v7 = "-[ADClientConnection dealloc]";
    __int16 v8 = 2048;
    int v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  id v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Client Connection (pid = %d) Deallocated", -[NSXPCConnection processIdentifier](self->_xpcConnection, "processIdentifier"));
  [(ADClientConnection *)self _unregisterForRingerStateNotification];
  [(ADClientConnection *)self _removeAllSpeechCapturingContextsForReason:v4];
  [(ADClientConnection *)self _removeAllAudioSessionAssertionsForReason:v4];
  [(ADClientConnection *)self _continuePendingSpeechRequestFromTimestamp:0.0];

  v5.receiver = self;
  v5.super_class = (Class)ADClientConnection;
  [(ADClientConnection *)&v5 dealloc];
}

- (ADClientConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ADClientConnection;
  id v6 = [(ADClientConnection *)&v22 init];
  if (v6)
  {
    id v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      long long v24 = "-[ADClientConnection initWithXPCConnection:]";
      __int16 v25 = 2048;
      id v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    v6->_isConnected = 1;
    uint64_t v8 = [(NSXPCConnection *)v6->_xpcConnection _queue];
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    __int16 v10 = v6;
    __int16 v11 = +[ADTTSMutingObserver sharedInstance];
    [v11 addHandsFreeStateObserver:v10];

    v10->_int ringerStateToken = -1;
    __int16 v12 = +[ADSpeechManager sharedManager];
    __int16 v13 = [v12 audioSessionController];
    [v13 registerObserver:v10];

    id v14 = +[ADSpeechManager sharedManager];
    id v15 = [v14 audioPlaybackService];
    [v15 addListener:v10];

    [(ADClientConnection *)v10 _logShouldSpeakState:[(ADClientConnection *)v10 _shouldSpeak]];
    if (AFIsInternalInstall())
    {
      id v16 = objc_alloc((Class)AFWatchdogTimer);
      id v17 = v6->_queue;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1003203D0;
      v21[3] = &unk_10050E350;
      v21[4] = 0x4082C00000000000;
      __int16 v18 = (AFWatchdogTimer *)[v16 initWithTimeoutInterval:v17 onQueue:v21 timeoutHandler:600.0];
      longLivedConnectionABCTimer = v10->_longLivedConnectionABCTimer;
      v10->_longLivedConnectionABCTimer = v18;

      [(AFWatchdogTimer *)v10->_longLivedConnectionABCTimer start];
    }
  }

  return v6;
}

@end