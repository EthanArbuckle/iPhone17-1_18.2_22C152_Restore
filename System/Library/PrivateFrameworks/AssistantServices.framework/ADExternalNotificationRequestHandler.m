@interface ADExternalNotificationRequestHandler
+ (id)sharedNotificationRequestHandler;
- (BOOL)_accessibleAnnounceIsEnabled;
- (BOOL)_announceOnDeviceSpeakerAllowedForRequest:(id)a3;
- (BOOL)_canAnnounceInCarPlay;
- (BOOL)_deactivateWorkoutReminderAnnouncementWithId:(id)a3;
- (BOOL)_isDeviceSilent;
- (BOOL)speechManager:(id)a3 detectedSpeechForListeningType:(int64_t)a4 atHostTime:(float)a5 shouldHandleActivation:(BOOL)a6;
- (id)_currentRequest;
- (id)_init;
- (id)_queue;
- (id)_requestQueue;
- (id)_sharedCommandCenter;
- (int64_t)_currentState;
- (int64_t)_getAnnouncementRequestFailureReasonFromError:(id)a3;
- (int64_t)announcePlatformForCurrentRequest;
- (void)_adCallStateChangedCallIncoming:(BOOL)a3;
- (void)_adjustAnnouncementVolumeIfNeccessaryForRequest:(id)a3;
- (void)_changeCurrentStateToState:(int64_t)a3;
- (void)_clearCurrentNotificationTimer;
- (void)_clearRequestState;
- (void)_clearTriggerlessUserReplyTimer;
- (void)_completeNotificationsWithSuccess:(BOOL)a3 forReason:(int64_t)a4 shouldEmitInstrumentationEvent:(BOOL)a5;
- (void)_deactivateCarPlayNotificationAnnouncementRequestForReason:(int64_t)a3 notification:(id)a4 sourceAppId:(id)a5 completion:(id)a6;
- (void)_deactivateCurrentAnnouncementRequestForReason:(int64_t)a3;
- (void)_deactivateForReason:(int64_t)a3 source:(int64_t)a4 event:(int64_t)a5 completion:(id)a6;
- (void)_deactivateNotificationAnnouncementRequestForReason:(int64_t)a3 notification:(id)a4 sourceAppId:(id)a5 platform:(int64_t)a6 completion:(id)a7;
- (void)_deliverSummary:(id)a3 forNotification:(id)a4 completion:(id)a5;
- (void)_emitInstrumentationEventsForRequest:(id)a3 currentlyPlayingMediaType:(id)a4;
- (void)_handleAnnounceIncomingCallRequest:(id)a3;
- (void)_handleAnnounceNotificationRequest:(id)a3;
- (void)_handleAnnouncementRequest:(id)a3;
- (void)_handleNotificationWithRequiresOpportuneTime:(BOOL)a3 completion:(id)a4;
- (void)_markThreadCancellationForCurrentRequest:(id)a3;
- (void)_processAnyQueuedAnnouncementsAfterUserSpeech;
- (void)_setCurrentRequest:(id)a3;
- (void)_shouldAnnounceGivenCurrentClientConditionsForRequest:(id)a3 completion:(id)a4;
- (void)_startAnnouncementRequest:(id)a3;
- (void)_startAnnouncementRequestIfOpportune:(id)a3;
- (void)_startAnnouncementRequestWithRequestInfo:(id)a3;
- (void)_startAttendingForSpeechIfNeededForRequest:(id)a3 completion:(id)a4;
- (void)_startObservingRouteChanges;
- (void)_startTimerToResetStateFrom:(int64_t)a3;
- (void)_startTriggerlessFollowupRequestForSpeechObservingType:(int64_t)a3 hostTime:(float)a4;
- (void)_stopCurrentRequestWithReason:(int64_t)a3 shouldCancelRequest:(BOOL)a4;
- (void)_stopObservingRouteChanges;
- (void)_triggerlessListeningTimerEnded;
- (void)_voicePromptStyleDidChange:(id)a3;
- (void)_withdrawalAnnouncementRequestForNotification:(id)a3 completion:(id)a4;
- (void)adCallStateChangedCallIncoming:(BOOL)a3;
- (void)announcementRequestReadyToBeAnnounced:(id)a3;
- (void)audioPlaybackService:(id)a3 didStartRequest:(id)a4;
- (void)audioSessionDidEnd;
- (void)currentAudioRouteDidChange:(id)a3;
- (void)deactivateCurrentAnnouncementRequestForReason:(int64_t)a3;
- (void)deactivateNotificationAnnouncementRequestForReason:(int64_t)a3 notification:(id)a4 sourceAppId:(id)a5 platform:(int64_t)a6 completion:(id)a7;
- (void)deactivateWorkoutReminderAnnouncementWithId:(id)a3 completion:(id)a4;
- (void)deferAudioSessionDeactivationForAnnouncementRequest;
- (void)deliverSummary:(id)a3 forNotification:(id)a4 completion:(id)a5;
- (void)emitInstrumentationEventsForRequest:(id)a3;
- (void)fetchUnreadNotificationsFromThreadAfterNotificationWithID:(id)a3 completion:(id)a4;
- (void)handleAnnouncementRequest:(id)a3;
- (void)inEarDetectionStateDidChangeForBTAddress:(id)a3 fromState:(id)a4 toState:(id)a5;
- (void)markNotificationAsReadWithIdentifer:(id)a3;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)notifySpeechDetectedIsUndirected;
- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)requestLifecycleObserver:(id)a3 requestWasCancelledWithInfo:(id)a4 forReason:(int64_t)a5 origin:(int64_t)a6 client:(id)a7 successorInfo:(id)a8;
- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)speechManager:(id)a3 didStopUnexpectlyWithError:(id)a4;
- (void)voicePromptStyleDidChange:(id)a3;
- (void)withdrawalAnnouncementRequestForNotification:(id)a3 completion:(id)a4;
@end

@implementation ADExternalNotificationRequestHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureInterruptedRequestUUID, 0);
  objc_storeStrong((id *)&self->_interruptedMediaType, 0);
  objc_storeStrong((id *)&self->_bbSettingsGateway, 0);
  objc_storeStrong((id *)&self->_ringerStateObserver, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_previousRequest, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_instrumentationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_announceSpeechManager, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_clientStateObserver, 0);
  objc_storeStrong((id *)&self->_currentRequestDelayManager, 0);
  objc_storeStrong((id *)&self->_triggerlessUserReplyTimer, 0);
  objc_storeStrong((id *)&self->_stateTimer, 0);
  objc_storeStrong((id *)&self->_currentNotificationTimer, 0);
}

- (void)_voicePromptStyleDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(ADExternalNotificationRequestHandler *)self _currentRequest];

  if (v5)
  {
    v6 = [(ADExternalNotificationRequestHandler *)self _currentRequest];
    id v7 = [v6 platform];

    if (v7 == (id)2 && (id)[(ADExternalNotificationRequestHandler *)self _currentState] == (id)2)
    {
      v8 = [v4 userInfo];
      v9 = [v8 objectForKey:AVSystemController_VoicePromptStyleDidChangeNotificationParameter];

      if (v9
        && ([v9 isEqualToString:AVSystemController_VoicePromptStyle_Normal] & 1) == 0)
      {
        v10 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v12 = 136315394;
          v13 = "-[ADExternalNotificationRequestHandler _voicePromptStyleDidChange:]";
          __int16 v14 = 2112;
          v15 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s CarPlay request in processing state encountered a \"%@\" voice prompt style, marking request as interrupted.", (uint8_t *)&v12, 0x16u);
        }
        v11 = [(ADExternalNotificationRequestHandler *)self _currentRequest];
        [v11 setRequestWasInterrupted:1];
      }
    }
  }
}

- (void)voicePromptStyleDidChange:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10033878C;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_adCallStateChangedCallIncoming:(BOOL)a3
{
  if (!a3)
  {
    id v4 = [(ADExternalNotificationRequestHandler *)self _currentRequest];
    id v5 = [v4 requestType];

    if (v5 == (id)2)
    {
      id v6 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        int v18 = 136315394;
        v19 = "-[ADExternalNotificationRequestHandler _adCallStateChangedCallIncoming:]";
        __int16 v20 = 1024;
        int v21 = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s Call incoming: %d", (uint8_t *)&v18, 0x12u);
      }
      if (self->_currentState != 6)
      {
        id v7 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          int v18 = 136315394;
          v19 = "-[ADExternalNotificationRequestHandler _adCallStateChangedCallIncoming:]";
          __int16 v20 = 1024;
          int v21 = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s Incoming call ended without user responding to announcement: %d", (uint8_t *)&v18, 0x12u);
        }
      }
      id v8 = [(ADExternalNotificationRequestHandler *)self _sharedCommandCenter];
      int64_t currentState = self->_currentState;
      switch(currentState)
      {
        case 2:
          v15 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            int v18 = 136315138;
            v19 = "-[ADExternalNotificationRequestHandler _adCallStateChangedCallIncoming:]";
            _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s Call ended while setting up announcement request", (uint8_t *)&v18, 0xCu);
          }
          v16 = [(ADExternalNotificationRequestHandler *)self _currentRequest];
          [v16 setRequestWasInterrupted:1];

          break;
        case 3:
        case 4:
        case 6:
          v10 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            int v18 = 136315138;
            v19 = "-[ADExternalNotificationRequestHandler _adCallStateChangedCallIncoming:]";
            _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Announcement request or reply ongoing shutting down request", (uint8_t *)&v18, 0xCu);
            int64_t currentState = self->_currentState;
          }
          uint64_t v11 = [v8 _currentClient];
          if (v11)
          {
            int v12 = (void *)v11;
            v13 = [(ADExternalNotificationRequestHandler *)self _currentRequest];
            __int16 v14 = [v13 requestInfo];

            if (v14) {
              [(ADExternalNotificationRequestHandler *)self _stopCurrentRequestWithReason:13 shouldCancelRequest:currentState == 3];
            }
          }
          goto LABEL_19;
        case 5:
          v17 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            int v18 = 136315138;
            v19 = "-[ADExternalNotificationRequestHandler _adCallStateChangedCallIncoming:]";
            _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s Call ended during triggerless listening, transition back to Idle state", (uint8_t *)&v18, 0xCu);
          }
LABEL_19:
          [(ADExternalNotificationRequestHandler *)self _changeCurrentStateToState:1];
          break;
        default:
          break;
      }
    }
  }
}

- (void)adCallStateChangedCallIncoming:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100338B48;
  v4[3] = &unk_10050CD50;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  char v5 = a5;
  id v7 = (AFNotifyObserver *)a3;
  if (self->_clientStateObserver == v7 && self->_currentState == 6)
  {
    if ((v5 & 4) != 0)
    {
      self->_triggerlessRequestEnteredListeningState = 1;
    }
    else if (self->_triggerlessRequestEnteredListeningState)
    {
      self->_triggerlessRequestEnteredListeningState = 0;
      id v8 = v7;
      [(ADRequestDelayManager *)self->_currentRequestDelayManager stopDelayingAndSendCommands:0 completion:0];
      id v7 = v8;
    }
  }
}

- (void)audioPlaybackService:(id)a3 didStartRequest:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100338C84;
  v8[3] = &unk_10050E160;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)speechManager:(id)a3 didStopUnexpectlyWithError:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100338E78;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)speechManager:(id)a3 detectedSpeechForListeningType:(int64_t)a4 atHostTime:(float)a5 shouldHandleActivation:(BOOL)a6
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100339050;
  v9[3] = &unk_10050CD28;
  v9[5] = &v12;
  v9[6] = a4;
  BOOL v11 = a6;
  float v10 = a5;
  v9[4] = self;
  dispatch_sync(queue, v9);
  char v7 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  id v8 = a6;
  id v9 = [a4 copy];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100339520;
  block[3] = &unk_10050DCB8;
  id v14 = v9;
  char v15 = self;
  id v16 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(queue, block);
}

- (void)requestLifecycleObserver:(id)a3 requestWasCancelledWithInfo:(id)a4 forReason:(int64_t)a5 origin:(int64_t)a6 client:(id)a7 successorInfo:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  v17 = v16;
  if (a5 == 7 && v16 && [v16 activationEvent] == (id)10)
  {
    int v18 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v23 = v18;
      v24 = [v14 uuid];
      *(_DWORD *)buf = 136315394;
      v31 = "-[ADExternalNotificationRequestHandler requestLifecycleObserver:requestWasCancelledWithInfo:forReason:origin"
            ":client:successorInfo:]";
      __int16 v32 = 2112;
      v33 = v24;
      _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%s Request (UUID: %@) cancelled as a result of a gesture-based follow-up", buf, 0x16u);
    }
    v19 = [v14 uuid];
    gestureInterruptedRequestUUID = self->_gestureInterruptedRequestUUID;
    self->_gestureInterruptedRequestUUID = v19;
  }
  else
  {
    id v21 = [v14 copy];
    queue = self->_queue;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100339E78;
    v25[3] = &unk_10050DD08;
    id v26 = v21;
    v27 = self;
    id v28 = v15;
    int64_t v29 = a5;
    gestureInterruptedRequestUUID = (NSUUID *)v21;
    dispatch_async(queue, v25);
  }
}

- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  id v10 = [v8 copy];
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10033A248;
  v15[3] = &unk_10050DC68;
  v15[4] = self;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (void)_triggerlessListeningTimerEnded
{
  self->_triggerlessUserReplyTimerTimedOut = 1;
  v3 = [(ADExternalNotificationRequestHandler *)self _currentRequest];
  +[ADExternalNotificationInstrumentationEmitter emitUserResponseSilenceForAnnouncementRequest:v3];

  [(ADExternalNotificationRequestHandler *)self _changeCurrentStateToState:1];
}

- (void)inEarDetectionStateDidChangeForBTAddress:(id)a3 fromState:(id)a4 toState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[ADExternalNotificationRequestHandler inEarDetectionStateDidChangeForBTAddress:fromState:toState:]";
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s 🎧 headphoneInEarDetectionStateDidChangeFrom from: %@ to: %@", buf, 0x20u);
  }
  if ([v9 primaryInEarStatus] == (id)3 && objc_msgSend(v10, "primaryInEarStatus") != (id)3)
  {
    id v13 = AFSiriLogContextDaemon;
    int v12 = 1;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[ADExternalNotificationRequestHandler inEarDetectionStateDidChangeForBTAddress:fromState:toState:]";
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s 🎧 [%@] primary bud went out of ear, shutting down the request", buf, 0x16u);
    }
  }
  else
  {
    int v12 = 0;
  }
  if ([v9 secondaryInEarStatus] == (id)3 && objc_msgSend(v10, "secondaryInEarStatus") != (id)3)
  {
    id v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[ADExternalNotificationRequestHandler inEarDetectionStateDidChangeForBTAddress:fromState:toState:]";
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s 🎧 [%@] secondary bud went out of ear, shutting down the request", buf, 0x16u);
    }
  }
  else if (!v12)
  {
    goto LABEL_15;
  }
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10033AC8C;
  v16[3] = &unk_10050E160;
  v16[4] = self;
  id v17 = v8;
  dispatch_async(queue, v16);

LABEL_15:
}

- (void)currentAudioRouteDidChange:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10033ADFC;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_stopObservingRouteChanges
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033AFE0;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_startObservingRouteChanges
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033B0AC;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)deactivateCurrentAnnouncementRequestForReason:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10033B178;
  v4[3] = &unk_10050D8C0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_deactivateCurrentAnnouncementRequestForReason:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    char v7 = AFSiriDeactivationReasonGetName();
    int v8 = 136315394;
    id v9 = "-[ADExternalNotificationRequestHandler _deactivateCurrentAnnouncementRequestForReason:]";
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Deactivating current announcement request for reason: %@", (uint8_t *)&v8, 0x16u);
  }
  [(ADExternalNotificationRequestHandler *)self _stopCurrentRequestWithReason:a3 shouldCancelRequest:1];
  [(ADExternalNotificationRequestHandler *)self _changeCurrentStateToState:1];
}

- (void)markNotificationAsReadWithIdentifer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10033B324;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)fetchUnreadNotificationsFromThreadAfterNotificationWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033B464;
  block[3] = &unk_10050E1D8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_startTriggerlessFollowupRequestForSpeechObservingType:(int64_t)a3 hostTime:(float)a4
{
  [(ADRequestDelayManager *)self->_currentRequestDelayManager stopDelayingAndSendCommands:1 completion:0];
  [(ADExternalNotificationRequestHandler *)self _changeCurrentStateToState:6];
  id v7 = +[ADCommandCenter sharedCommandCenter];
  id v8 = +[AFSetAudioSessionActiveContext newWithBuilder:&stru_10050CC60];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10033B6C4;
  v9[3] = &unk_10050CCB0;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = (unint64_t)a4;
  [v7 forceAudioSessionActiveWithContext:v8 completion:v9];
}

- (void)deferAudioSessionDeactivationForAnnouncementRequest
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ADExternalNotificationRequestHandler deferAudioSessionDeactivationForAnnouncementRequest]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033BCC0;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)notifySpeechDetectedIsUndirected
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ADExternalNotificationRequestHandler notifySpeechDetectedIsUndirected]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033BDFC;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (int64_t)announcePlatformForCurrentRequest
{
  v3 = [(ADExternalNotificationRequestHandler *)self _currentRequest];

  if (v3) {
    v3 = [(ADAnnouncementRequest *)self->_currentRequest platform];
  }
  id v4 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    id v6 = AFSiriAnnouncementPlatformGetName();
    id v7 = [(ADExternalNotificationRequestHandler *)self _currentRequest];
    int v9 = 136315650;
    id v10 = "-[ADExternalNotificationRequestHandler announcePlatformForCurrentRequest]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Platform: %@ for current request: %@", (uint8_t *)&v9, 0x20u);
  }
  return (int64_t)v3;
}

- (void)_processAnyQueuedAnnouncementsAfterUserSpeech
{
  v3 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v4 = v3;
    id v5 = AFExternalNotificationRequestHandlerStateGetName();
    BOOL waitForUserInputAfterReading = self->_waitForUserInputAfterReading;
    int v13 = 136315650;
    id v14 = "-[ADExternalNotificationRequestHandler _processAnyQueuedAnnouncementsAfterUserSpeech]";
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 1024;
    BOOL v18 = waitForUserInputAfterReading;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s current state: %@, waitingForUserInput: %d", (uint8_t *)&v13, 0x1Cu);
  }
  if (self->_currentState == 6 || self->_waitForUserInputAfterReading)
  {
    self->_BOOL waitForUserInputAfterReading = 0;
    id v7 = [(ADExternalNotificationRequestHandler *)self _requestQueue];
    id v8 = [v7 currentRequest];

    int v9 = [v8 completion];

    if (v9)
    {
      if (v8)
      {
LABEL_7:
        id v10 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v13 = 136315138;
          id v14 = "-[ADExternalNotificationRequestHandler _processAnyQueuedAnnouncementsAfterUserSpeech]";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s New request in the queue after reply request, starting new request, and reset attending", (uint8_t *)&v13, 0xCu);
        }
        ++self->_synchronousBurstIndex;
        [(ADAnnounceSpeechManager *)self->_announceSpeechManager stopAttending];
        [(ADExternalNotificationRequestHandler *)self _changeCurrentStateToState:2];
        [(ADExternalNotificationRequestHandler *)self _startAnnouncementRequest:v8];
        goto LABEL_12;
      }
    }
    else
    {
      __int16 v11 = [(ADExternalNotificationRequestHandler *)self _requestQueue];
      uint64_t v12 = [v11 nextAnnouncementRequest];

      id v8 = (void *)v12;
      if (v12) {
        goto LABEL_7;
      }
    }
    [(ADExternalNotificationRequestHandler *)self _changeCurrentStateToState:1];
LABEL_12:
  }
}

- (void)audioSessionDidEnd
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ADExternalNotificationRequestHandler audioSessionDidEnd]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033C3A8;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_withdrawalAnnouncementRequestForNotification:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  id v7 = a3;
  id v8 = [(ADExternalNotificationRequestHandler *)self _requestQueue];
  int v9 = [v7 request];

  id v10 = [v9 identifier];
  __int16 v11 = [v8 notificationRequestForNotificationIdentifierInAnnouncementQueue:v10];

  if (!v11)
  {
    id v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315138;
      __int16 v22 = "-[ADExternalNotificationRequestHandler _withdrawalAnnouncementRequestForNotification:completion:]";
      __int16 v17 = "%s Attempt to withdrawal request which is not in queue. Ignoring withdrawal.";
      goto LABEL_7;
    }
LABEL_8:
    id v18 = 0;
    goto LABEL_9;
  }
  uint64_t v12 = [v11 announcementIdentifier];
  int v13 = [(ADExternalNotificationRequestHandler *)self _currentRequest];
  id v14 = [v13 announcementIdentifier];
  unsigned int v15 = [v12 isEqual:v14];

  if (v15)
  {
    id v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315138;
      __int16 v22 = "-[ADExternalNotificationRequestHandler _withdrawalAnnouncementRequestForNotification:completion:]";
      __int16 v17 = "%s Attempt to withdrawal current request. Ignoring withdrawal.";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v21, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v19 = [(ADExternalNotificationRequestHandler *)self _requestQueue];
  id v18 = [v19 removeAnnouncementRequest:v11];

  __int16 v20 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v21 = 136315650;
    __int16 v22 = "-[ADExternalNotificationRequestHandler _withdrawalAnnouncementRequestForNotification:completion:]";
    __int16 v23 = 2112;
    v24 = v11;
    __int16 v25 = 1024;
    int v26 = (int)v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s Withdrawal for request: %@ successful: %{BOOL}d", (uint8_t *)&v21, 0x1Cu);
  }
LABEL_9:
  v6[2](v6, v18);
}

- (void)withdrawalAnnouncementRequestForNotification:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033C6EC;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_deactivateForReason:(int64_t)a3 source:(int64_t)a4 event:(int64_t)a5 completion:(id)a6
{
  id v9 = a6;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10033C7D8;
  v12[3] = &unk_10050CC20;
  v12[4] = mach_absolute_time();
  v12[5] = a4;
  v12[6] = a5;
  id v10 = +[AFSiriActivationContext newWithBuilder:v12];
  __int16 v11 = +[AFSiriActivationConnection sharedConnection];
  [v11 deactivateForReason:a3 options:0 context:v10 completion:v9];
}

- (void)_deactivateCarPlayNotificationAnnouncementRequestForReason:(int64_t)a3 notification:(id)a4 sourceAppId:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = [(ADExternalNotificationRequestHandler *)self _sharedCommandCenter];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10033C9D0;
    v15[3] = &unk_10050CC00;
    id v16 = v11;
    id v17 = v10;
    id v18 = self;
    id v19 = v12;
    int64_t v20 = a3;
    [v13 areAnnouncementRequestsPermittedByPresentationWhileActiveWithCompletion:v15];
  }
  else
  {
    id v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v22 = "-[ADExternalNotificationRequestHandler _deactivateCarPlayNotificationAnnouncementRequestForReason:notificati"
            "on:sourceAppId:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Ignoring deactivation, nil completion", buf, 0xCu);
    }
  }
}

- (void)_deactivateNotificationAnnouncementRequestForReason:(int64_t)a3 notification:(id)a4 sourceAppId:(id)a5 platform:(int64_t)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void))a7;
  switch(a6)
  {
    case 0:
    case 1:
    case 3:
      unsigned int v15 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v19 = 136315138;
        int64_t v20 = "-[ADExternalNotificationRequestHandler _deactivateNotificationAnnouncementRequestForReason:notification:so"
              "urceAppId:platform:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Can only deactivate notification announcements in CarPlay.", (uint8_t *)&v19, 0xCu);
      }
      v14[2](v14, 0);
      goto LABEL_6;
    case 2:
      [(ADExternalNotificationRequestHandler *)self _deactivateCarPlayNotificationAnnouncementRequestForReason:a3 notification:v12 sourceAppId:v13 completion:v14];
      goto LABEL_6;
    case 4:
      id v16 = [(ADExternalNotificationRequestHandler *)self _currentRequest];
      id v17 = [(ADExternalNotificationRequestHandler *)self _currentRequest];
      id v18 = [v17 requestType];

      if (v18 == (id)1 && ([v16 announcementType] == (id)9 || objc_msgSend(v16, "platform") == (id)4)) {
        [(ADExternalNotificationRequestHandler *)self _stopCurrentRequestWithReason:a3 shouldCancelRequest:1];
      }
      goto LABEL_7;
    default:
LABEL_6:
      id v16 = 0;
LABEL_7:

      return;
  }
}

- (void)deactivateNotificationAnnouncementRequestForReason:(int64_t)a3 notification:(id)a4 sourceAppId:(id)a5 platform:(int64_t)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  queue = self->_queue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10033CF84;
  v19[3] = &unk_10050CBB0;
  v19[4] = self;
  id v20 = v12;
  int64_t v23 = a3;
  int64_t v24 = a6;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(queue, v19);
}

- (BOOL)_deactivateWorkoutReminderAnnouncementWithId:(id)a3
{
  id v4 = a3;
  id v5 = [(ADExternalNotificationRequestHandler *)self _currentRequest];
  if ([v5 requestType] != (id)1)
  {
    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136315138;
      id v18 = "-[ADExternalNotificationRequestHandler _deactivateWorkoutReminderAnnouncementWithId:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Current announcement not a ADAnnouncementRequestTypeNotification - ignoring", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      id v18 = "-[ADExternalNotificationRequestHandler _deactivateWorkoutReminderAnnouncementWithId:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s requestType is ADAnnouncementRequestTypeNotification, but request is not ADAnnounceNotificationRequest", (uint8_t *)&v17, 0xCu);
    }
LABEL_13:
    unsigned __int8 v8 = 0;
    goto LABEL_21;
  }
  id v6 = v5;
  if ([v6 announcementType] == (id)8)
  {
    id v7 = [v6 announcementIdentifier];
    unsigned __int8 v8 = [v7 isEqual:v4];
    if (v8)
    {
      [(ADExternalNotificationRequestHandler *)self _stopCurrentRequestWithReason:12 shouldCancelRequest:1];
      [(ADExternalNotificationRequestHandler *)self _completeNotificationsWithSuccess:0 forReason:6 shouldEmitInstrumentationEvent:1];
      if (self->_currentState >= 5)
      {
        id v9 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v15 = v9;
          id v16 = AFExternalNotificationRequestHandlerStateGetName();
          int v17 = 136315394;
          id v18 = "-[ADExternalNotificationRequestHandler _deactivateWorkoutReminderAnnouncementWithId:]";
          __int16 v19 = 2112;
          id v20 = v16;
          _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s Transitioning from state %@ to idle for deactivation request", (uint8_t *)&v17, 0x16u);
        }
        [(ADExternalNotificationRequestHandler *)self _changeCurrentStateToState:1];
      }
    }
    else
    {
      id v13 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 136315138;
        id v18 = "-[ADExternalNotificationRequestHandler _deactivateWorkoutReminderAnnouncementWithId:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s Current announcement does not match the requested deactivation request's announce id - ignoring", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  else
  {
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136315138;
      id v18 = "-[ADExternalNotificationRequestHandler _deactivateWorkoutReminderAnnouncementWithId:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Current announcement is not a workout reminder - ignoring", (uint8_t *)&v17, 0xCu);
    }
    unsigned __int8 v8 = 0;
  }

LABEL_21:
  return v8;
}

- (void)deactivateWorkoutReminderAnnouncementWithId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033D398;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_stopCurrentRequestWithReason:(int64_t)a3 shouldCancelRequest:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    id v14 = v7;
    unsigned int v15 = AFSiriDeactivationReasonGetName();
    int v16 = 136315394;
    int v17 = "-[ADExternalNotificationRequestHandler _stopCurrentRequestWithReason:shouldCancelRequest:]";
    __int16 v18 = 2112;
    int64_t v19 = (int64_t)v15;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Deactivating Siri with reason: %@", (uint8_t *)&v16, 0x16u);
  }
  int v8 = 1;
  uint64_t v9 = 4;
  uint64_t v10 = 2;
  switch(a3)
  {
    case 2:
      uint64_t v9 = 4;
      uint64_t v10 = 11;
      goto LABEL_10;
    case 12:
      goto LABEL_10;
    case 13:
    case 14:
    case 18:
      int v8 = 0;
      uint64_t v10 = 0;
      uint64_t v9 = 4;
      goto LABEL_10;
    case 16:
    case 17:
      int v8 = 0;
      uint64_t v10 = 0;
      uint64_t v9 = 5;
      goto LABEL_10;
    case 20:
      uint64_t v9 = 4;
      uint64_t v10 = 22;
LABEL_10:
      [(ADExternalNotificationRequestHandler *)self _deactivateForReason:a3 source:v9 event:v10 completion:&stru_10050CB88];
      if (v4)
      {
        id v12 = [(ADExternalNotificationRequestHandler *)self _sharedCommandCenter];
        if (v8)
        {
          id v13 = [(ADExternalNotificationRequestHandler *)self _currentRequest];
          [(ADExternalNotificationRequestHandler *)self _markThreadCancellationForCurrentRequest:v13];
        }
        [v12 cancelCurrentRequestForReason:11];
      }
      break;
    default:
      id v11 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136315394;
        int v17 = "-[ADExternalNotificationRequestHandler _stopCurrentRequestWithReason:shouldCancelRequest:]";
        __int16 v18 = 2048;
        int64_t v19 = a3;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Unexpected announcement cancellation reason: %lu. Deactivation ignored.", (uint8_t *)&v16, 0x16u);
      }
      break;
  }
}

- (void)_clearCurrentNotificationTimer
{
  [(AFWatchdogTimer *)self->_currentNotificationTimer cancel];
  currentNotificationTimer = self->_currentNotificationTimer;
  self->_currentNotificationTimer = 0;
}

- (void)_startTimerToResetStateFrom:(int64_t)a3
{
  [(AFWatchdogTimer *)self->_stateTimer cancel];
  id v5 = objc_alloc((Class)AFWatchdogTimer);
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10033D904;
  v9[3] = &unk_10050D8C0;
  v9[4] = self;
  v9[5] = a3;
  id v7 = (AFWatchdogTimer *)[v5 initWithTimeoutInterval:queue onQueue:v9 timeoutHandler:120.0];
  stateTimer = self->_stateTimer;
  self->_stateTimer = v7;

  [(AFWatchdogTimer *)self->_stateTimer start];
}

- (void)_startAttendingForSpeechIfNeededForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ADAnnounceSpeechManager *)self->_announceSpeechManager isAttending]
    && ([(ADExternalNotificationRequestHandler *)self _currentRequest],
        int v8 = objc_claimAutoreleasedReturnValue(),
        [v8 requestInfo],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    uint64_t v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int64_t v24 = "-[ADExternalNotificationRequestHandler _startAttendingForSpeechIfNeededForRequest:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Already attending, proceeding with reading message", buf, 0xCu);
    }
    currentRequestDelayManager = self->_currentRequestDelayManager;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10033DC80;
    v21[3] = &unk_10050E188;
    id v12 = &v22;
    v21[4] = self;
    id v22 = v7;
    id v13 = v7;
    [(ADRequestDelayManager *)currentRequestDelayManager dequeueDelayedCommandsAndSend:0 completion:v21];
  }
  else
  {
    id v14 = [v6 requestType];
    if (v14 == (id)1) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = 2 * (v14 == (id)2);
    }
    if ([v6 platform] != (id)1) {
      uint64_t v15 = 4;
    }
    int v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int64_t v24 = "-[ADExternalNotificationRequestHandler _startAttendingForSpeechIfNeededForRequest:completion:]";
      __int16 v25 = 2048;
      uint64_t v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Starting attending for speech with type: %lu", buf, 0x16u);
    }
    announceSpeechManager = self->_announceSpeechManager;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10033DD10;
    v19[3] = &unk_10050DEE8;
    id v12 = &v20;
    v19[4] = self;
    id v20 = v7;
    id v18 = v7;
    [(ADAnnounceSpeechManager *)announceSpeechManager startAttendingForSpeechWithType:v15 completion:v19];
  }
}

- (int64_t)_getAnnouncementRequestFailureReasonFromError:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    if ([v3 code] == (id)7200)
    {
      int64_t v5 = 14;
    }
    else if ([v4 code] == (id)7201)
    {
      int64_t v5 = 15;
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)_startAnnouncementRequest:(id)a3
{
  id v4 = a3;
  int64_t v5 = +[SOMediaNowPlayingObserver defaultObserver];
  id v6 = [v5 playbackState];

  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    previousRequest = self->_previousRequest;
    unint64_t synchronousBurstIndex = self->_synchronousBurstIndex;
    *(_DWORD *)buf = 136316162;
    id v20 = "-[ADExternalNotificationRequestHandler _startAnnouncementRequest:]";
    __int16 v21 = 2112;
    id v22 = v4;
    __int16 v23 = 2112;
    int64_t v24 = previousRequest;
    __int16 v25 = 2048;
    unint64_t v26 = synchronousBurstIndex;
    __int16 v27 = 1024;
    BOOL v28 = v6 == (id)1;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s Starting announcement request: %@, previous request: %@, Sync Burst Index: %lu, isMediaPlaying: %d", buf, 0x30u);
  }
  int v8 = +[AFRequestInfo requestInfoFromAnnouncementRequest:v4 previousRequest:self->_previousRequest synchronousBurstIndex:self->_synchronousBurstIndex isMediaPlaying:v6 == (id)1];
  [(ADExternalNotificationRequestHandler *)self _setCurrentRequest:v4];
  uint64_t v9 = [(ADExternalNotificationRequestHandler *)self _currentRequest];
  [v9 setRequestInfo:v8];

  [(ADExternalNotificationRequestHandler *)self emitInstrumentationEventsForRequest:v4];
  currentRequestDelayManager = self->_currentRequestDelayManager;
  if (!currentRequestDelayManager || ![(ADRequestDelayManager *)currentRequestDelayManager isDelaying])
  {
    id v11 = [(ADExternalNotificationRequestHandler *)self _sharedCommandCenter];
    id v12 = [v11 requestDelayManager];
    id v13 = self->_currentRequestDelayManager;
    self->_currentRequestDelayManager = v12;

    [(ADRequestDelayManager *)self->_currentRequestDelayManager startDelaying];
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10033E084;
  v17[3] = &unk_10050CB48;
  v17[4] = self;
  id v18 = v8;
  id v14 = v8;
  [(ADExternalNotificationRequestHandler *)self _startAttendingForSpeechIfNeededForRequest:v4 completion:v17];
}

- (void)_emitInstrumentationEventsForRequest:(id)a3 currentlyPlayingMediaType:(id)a4
{
  id v5 = a3;
  +[ADExternalNotificationInstrumentationEmitter emitAnnouncementReceivedForAnnouncementRequest:v5 nowPlayingMediaType:a4];
  +[ADExternalNotificationInstrumentationEmitter emitRequestLinkForAnnouncementRequest:v5];
}

- (void)emitInstrumentationEventsForRequest:(id)a3
{
  id v4 = a3;
  instrumentationQueue = self->_instrumentationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10033E2D8;
  v7[3] = &unk_10050E160;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(instrumentationQueue, v7);
}

- (void)_startAnnouncementRequestWithRequestInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(ADExternalNotificationRequestHandler *)self _sharedCommandCenter];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10033E590;
  v7[3] = &unk_10050CAF8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 handleExternalActivationRequest:v6 completion:v7];
}

- (void)_handleNotificationWithRequiresOpportuneTime:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    [(ADExternalNotificationRequestHandler *)self _changeCurrentStateToState:2];
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    char v34 = 0;
    id v7 = objc_alloc((Class)AFSafetyBlock);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10033ECF0;
    v30[3] = &unk_10050CA30;
    __int16 v32 = v33;
    v30[4] = self;
    id v31 = v6;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10033ED3C;
    v28[3] = &unk_10050E138;
    id v8 = [v7 initWithBlock:v30];
    id v29 = v8;
    uint64_t v9 = objc_retainBlock(v28);
    uint64_t v10 = AFSiriLogContextDaemon;
    BOOL v11 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (a3)
    {
      if (v11)
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[ADExternalNotificationRequestHandler _handleNotificationWithRequiresOpportuneTime:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Going to check if there is an opportunity to announce", buf, 0xCu);
      }
      id v12 = objc_alloc((Class)AFWatchdogTimer);
      queue = self->_queue;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10033ED64;
      v24[3] = &unk_10050D0D0;
      id v14 = v9;
      __int16 v25 = v14;
      uint64_t v15 = (AFWatchdogTimer *)[v12 initWithTimeoutInterval:queue onQueue:v24 timeoutHandler:10.0];
      currentNotificationTimer = self->_currentNotificationTimer;
      self->_currentNotificationTimer = v15;

      [(AFWatchdogTimer *)self->_currentNotificationTimer start];
      int v17 = +[AFSiriClientStateManager sharedManager];
      [v17 beginSessionForClient:self];

      announceSpeechManager = self->_announceSpeechManager;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10033EE24;
      v21[3] = &unk_10050CAA8;
      v21[4] = self;
      __int16 v23 = v33;
      id v22 = v14;
      [(ADAnnounceSpeechManager *)announceSpeechManager startAttendingForPauseInSpeechWithType:1 completion:v21];

      int64_t v19 = (id *)&v25;
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[ADExternalNotificationRequestHandler _handleNotificationWithRequiresOpportuneTime:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Ignoring using Opportune Speaking Module since the request doesn't require it", buf, 0xCu);
      }
      id v20 = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10033ED44;
      block[3] = &unk_10050CA58;
      v27[1] = v33;
      int64_t v19 = (id *)v27;
      v27[0] = v9;
      dispatch_async(v20, block);
    }

    _Block_object_dispose(v33, 8);
  }
}

- (void)_adjustAnnouncementVolumeIfNeccessaryForRequest:(id)a3
{
  if ([a3 platform] == (id)1)
  {
    id v3 = +[AFSiriHeadphonesMonitor sharedMonitor];
    id v4 = [v3 currentAudioRoute];

    if ([v4 supportsVolumeAdjustment])
    {
      id v5 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v5;
        id v7 = [v4 btAddress];
        int v9 = 136315394;
        uint64_t v10 = "-[ADExternalNotificationRequestHandler _adjustAnnouncementVolumeIfNeccessaryForRequest:]";
        __int16 v11 = 2112;
        id v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Adjusting Siri's volume for route: %@", (uint8_t *)&v9, 0x16u);
      }
      id v8 = +[ADSpeechManager sharedManager];
      [v8 adjustSiriOutputVolumeForRouteIfNeeded:v4];
    }
  }
}

- (void)_shouldAnnounceGivenCurrentClientConditionsForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(ADExternalNotificationRequestHandler *)self _sharedCommandCenter];
    uint64_t v9 = [v8 _currentClient];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      __int16 v11 = [v6 requestInfo];

      if (!v11)
      {
        id v12 = [(ADExternalNotificationRequestHandler *)self _sharedCommandCenter];
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10033F2A4;
        v13[3] = &unk_10050E250;
        id v14 = v7;
        [v12 areAnnouncementRequestsPermittedByPresentationWhileActiveWithCompletion:v13];

        goto LABEL_7;
      }
    }
    else
    {
    }
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
LABEL_7:
}

- (void)_startAnnouncementRequestIfOpportune:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10033F34C;
  v4[3] = &unk_10050C9E0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ADExternalNotificationRequestHandler *)v5 _shouldAnnounceGivenCurrentClientConditionsForRequest:v3 completion:v4];
}

- (void)_handleAnnounceIncomingCallRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(ADExternalNotificationRequestHandler *)self _currentRequest];
  id v6 = [v5 requestType];

  if (v6 == (id)2)
  {
    id v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315138;
      int64_t v19 = "-[ADExternalNotificationRequestHandler _handleAnnounceIncomingCallRequest:]";
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Currently announcing a call, ignoring overlapping announce call activation", (uint8_t *)&v18, 0xCu);
    }
    [v4 completeRequestWithSuccess:0 forReason:5 shouldEmitInstrumentationEvent:1];
  }
  else
  {
    [v4 completeRequestWithSuccess:1 forReason:1 shouldEmitInstrumentationEvent:1];
    id v8 = [v4 call];
    uint64_t v9 = [v8 callProviderBundleID];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v12 = [v4 call];
      id v11 = [v12 callProviderIdentifier];
    }
    id v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315394;
      int64_t v19 = "-[ADExternalNotificationRequestHandler _handleAnnounceIncomingCallRequest:]";
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Announce incoming call request received from: %@", (uint8_t *)&v18, 0x16u);
    }
    id v14 = [(ADExternalNotificationRequestHandler *)self _sharedCommandCenter];
    [v14 startObservingCallState];
    uint64_t v15 = [v14 _currentClient];

    if (v15) {
      [(ADExternalNotificationRequestHandler *)self _stopCurrentRequestWithReason:14 shouldCancelRequest:1];
    }
    [(ADExternalNotificationRequestHandler *)self _clearRequestState];
    [(ADExternalNotificationRequestHandler *)self _changeCurrentStateToState:2];
    [(ADExternalNotificationRequestHandler *)self _startTimerToResetStateFrom:2];
    int v16 = objc_alloc_init(ADCallObserver);
    callObserver = self->_callObserver;
    self->_callObserver = v16;

    [(ADCallObserver *)self->_callObserver startObservingCallStateWithDelegate:self];
    [(ADExternalNotificationRequestHandler *)self _startAnnouncementRequest:v4];
  }
}

- (BOOL)_accessibleAnnounceIsEnabled
{
  if (_AFPreferencesAnnounceNotificationsOnBuiltInSpeakerEnabled())
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    int v2 = _AFPreferencesAnnounceNotificationsOnHearingAidsEnabled();
    if (v2)
    {
      LOBYTE(v2) = __AFPreferencesAnnounceNotificationsOnHearingAidsSupported();
    }
  }
  return v2;
}

- (BOOL)_canAnnounceInCarPlay
{
  unint64_t v2 = _AFPreferencesAnnounceNotificationsInCarPlayType();
  if (v2 - 2 >= 3)
  {
    if (v2 > 1)
    {
LABEL_9:
      LOBYTE(v4) = 0;
      return v4;
    }
    id v3 = AFSiriLogContextDaemon;
    BOOL v4 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v4)
    {
      int v6 = 136315138;
      id v7 = "-[ADExternalNotificationRequestHandler _canAnnounceInCarPlay]";
      goto LABEL_8;
    }
  }
  else
  {
    if (!_AFPreferencesAnnounceNotificationsInCarPlayTemporarilyDisabled())
    {
      LOBYTE(v4) = 1;
      return v4;
    }
    id v3 = AFSiriLogContextDaemon;
    BOOL v4 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v4)
    {
      int v6 = 136315138;
      id v7 = "-[ADExternalNotificationRequestHandler _canAnnounceInCarPlay]";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Announce in CarPlay is disabled.", (uint8_t *)&v6, 0xCu);
      goto LABEL_9;
    }
  }
  return v4;
}

- (void)_handleAnnounceNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = v5;
    id v7 = [v4 notification];
    [v4 announcementType];
    id v8 = AFSiriUserNotificationAnnouncementTypeGetName();
    uint64_t v9 = [v4 appID];
    [v4 platform];
    uint64_t v10 = AFSiriAnnouncementPlatformGetName();
    id v11 = AFExternalNotificationRequestHandlerStateGetName();
    *(_DWORD *)buf = 136316418;
    v67 = "-[ADExternalNotificationRequestHandler _handleAnnounceNotificationRequest:]";
    __int16 v68 = 2112;
    id v69 = v7;
    __int16 v70 = 2112;
    v71 = v8;
    __int16 v72 = 2112;
    v73 = v9;
    __int16 v74 = 2112;
    v75 = v10;
    __int16 v76 = 2112;
    v77 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@ announcementType: %@, from app: %@, on platform:, %@, Current state: %@", buf, 0x3Eu);
  }
  if (![v4 announcementType])
  {
    int64_t v19 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      __int16 v20 = v19;
      id v21 = [v4 appID];
      [v4 platform];
      id v22 = AFSiriAnnouncementPlatformGetName();
      *(_DWORD *)buf = 136315650;
      v67 = "-[ADExternalNotificationRequestHandler _handleAnnounceNotificationRequest:]";
      __int16 v68 = 2112;
      id v69 = v21;
      __int16 v70 = 2112;
      v71 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s Notification is not announceable by app: %@ on platform: %@", buf, 0x20u);
    }
    int v17 = v4;
    uint64_t v18 = 7;
    goto LABEL_27;
  }
  if ([v4 platform] == (id)4)
  {
    id v12 = +[AFDeviceRingerSwitchObserver sharedObserver];
    id v13 = [v12 state];

    if (v13 == (id)2)
    {
      id v14 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v67 = "-[ADExternalNotificationRequestHandler _handleAnnounceNotificationRequest:]";
        uint64_t v15 = "%s Not announcing over phone speaker, ringer switch is on silent";
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v15, buf, 0xCu);
        goto LABEL_23;
      }
      goto LABEL_23;
    }
  }
  if ([v4 announcementType] == (id)6
    && (+[AFFeatureFlags isAnnounceGroupFaceTimeInviteEnabled] & 1) == 0)
  {
    goto LABEL_60;
  }
  if ([v4 platform] == (id)1)
  {
    if ([(ADExternalNotificationRequestHandler *)self _accessibleAnnounceIsEnabled])
    {
      bbSettingsGateway = self->_bbSettingsGateway;
      if (bbSettingsGateway)
      {
        if ([(BBSettingsGateway *)bbSettingsGateway effectiveGlobalAnnounceHeadphonesSetting] != (id)2)
        {
          v59 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v67 = "-[ADExternalNotificationRequestHandler _handleAnnounceNotificationRequest:]";
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%s Not announcing on headphones, global announce setting is off.", buf, 0xCu);
          }
LABEL_60:
          int v17 = v4;
          uint64_t v18 = 0;
          goto LABEL_61;
        }
      }
    }
  }
  if ([v4 platform] == (id)3 && (_AFPreferencesAnnounceNotificationsOnHearingAidsEnabled() & 1) == 0)
  {
    v45 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v67 = "-[ADExternalNotificationRequestHandler _handleAnnounceNotificationRequest:]";
      v46 = "%s Not announcing on hearing aids, since the setting is disabled";
      v47 = v45;
      uint32_t v48 = 12;
LABEL_46:
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, v46, buf, v48);
    }
LABEL_47:
    int v17 = v4;
    uint64_t v18 = 13;
LABEL_61:
    uint64_t v23 = 0;
    goto LABEL_62;
  }
  if ([v4 platform] == (id)4
    && ![(ADExternalNotificationRequestHandler *)self _announceOnDeviceSpeakerAllowedForRequest:v4])
  {
    v49 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v67 = "-[ADExternalNotificationRequestHandler _handleAnnounceNotificationRequest:]";
      __int16 v68 = 2112;
      id v69 = v4;
      v46 = "%s Not announcing on speaker, since the setting is disabled for %@";
      v47 = v49;
      uint32_t v48 = 22;
      goto LABEL_46;
    }
    goto LABEL_47;
  }
  if ([v4 platform] != (id)4
    || ![(ADExternalNotificationRequestHandler *)self _isDeviceSilent])
  {
    int64_t v24 = [v4 appID];
    [v4 platform];
    __int16 v25 = _AFPreferencesAnnounceNotificationsTemporarilyDisabledEndDateForAppOnPlatform();

    if (v25
      && (+[NSDate date],
          unint64_t v26 = objc_claimAutoreleasedReturnValue(),
          [v25 laterDate:v26],
          __int16 v27 = objc_claimAutoreleasedReturnValue(),
          unsigned int v28 = [v27 isEqualToDate:v25],
          v27,
          v26,
          v28))
    {
      [v4 platform];
      id v29 = _AFPreferencesAnnounceNotificationsTemporarilyDisabledEndDateForPlatform();
      if (v29
        && (+[NSDate date],
            v30 = objc_claimAutoreleasedReturnValue(),
            [v29 laterDate:v30],
            id v31 = objc_claimAutoreleasedReturnValue(),
            unsigned int v32 = [v31 isEqualToDate:v29],
            v31,
            v30,
            v32))
      {
        v33 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          char v34 = v33;
          [v4 platform];
          v35 = AFSiriAnnouncementPlatformGetName();
          *(_DWORD *)buf = 136315650;
          v67 = "-[ADExternalNotificationRequestHandler _handleAnnounceNotificationRequest:]";
          __int16 v68 = 2112;
          id v69 = v29;
          __int16 v70 = 2112;
          v71 = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s Announce Notifications is globally temporarily disabled until %@ on platform %@", buf, 0x20u);
        }
        uint64_t v36 = 4;
      }
      else
      {
        v55 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          v56 = v55;
          v57 = [v4 appID];
          [v4 platform];
          v58 = AFSiriAnnouncementPlatformGetName();
          *(_DWORD *)buf = 136315906;
          v67 = "-[ADExternalNotificationRequestHandler _handleAnnounceNotificationRequest:]";
          __int16 v68 = 2112;
          id v69 = v25;
          __int16 v70 = 2112;
          v71 = v57;
          __int16 v72 = 2112;
          v73 = v58;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%s Announce Notifications is temporarily disabled until %@ for app %@ on platform %@", buf, 0x2Au);
        }
        uint64_t v36 = 3;
      }
      [v4 completeRequestWithSuccess:0 forReason:v36 shouldEmitInstrumentationEvent:1];
    }
    else
    {
      if ([v4 platform] == (id)2
        && ![(ADExternalNotificationRequestHandler *)self _canAnnounceInCarPlay])
      {
        v60 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v67 = "-[ADExternalNotificationRequestHandler _handleAnnounceNotificationRequest:]";
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "%s Not permitted to Announce in CarPlay, rejecting notification", buf, 0xCu);
        }
        v42 = v4;
        uint64_t v43 = 0;
        uint64_t v44 = 0;
      }
      else
      {
        uint64_t v37 = [(ADExternalNotificationRequestHandler *)self _currentRequest];
        if (!v37
          || (v38 = (void *)v37,
              [(ADExternalNotificationRequestHandler *)self _currentRequest],
              v39 = objc_claimAutoreleasedReturnValue(),
              id v40 = [v39 requestType],
              v39,
              v38,
              v40 != (id)2))
        {
          v50 = [(ADExternalNotificationRequestHandler *)self _currentRequest];
          v51 = [(ADExternalNotificationRequestHandler *)self _sharedCommandCenter];
          switch(self->_currentState)
          {
            case 1:
              v64[0] = _NSConcreteStackBlock;
              v64[1] = 3221225472;
              v64[2] = sub_1003404FC;
              v64[3] = &unk_10050C9E0;
              v64[4] = self;
              id v65 = v4;
              [(ADExternalNotificationRequestHandler *)self _shouldAnnounceGivenCurrentClientConditionsForRequest:v65 completion:v64];

              break;
            case 2:
            case 3:
            case 4:
            case 6:
              v52 = AFSiriLogContextDaemon;
              if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
                goto LABEL_52;
              }
              *(_DWORD *)buf = 136315138;
              v67 = "-[ADExternalNotificationRequestHandler _handleAnnounceNotificationRequest:]";
              v53 = "%s Enqueueing announcement request";
              goto LABEL_51;
            case 5:
              BOOL waitForUserInputAfterReading = self->_waitForUserInputAfterReading;
              v52 = AFSiriLogContextDaemon;
              BOOL v62 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
              if (waitForUserInputAfterReading)
              {
                if (v62)
                {
                  *(_DWORD *)buf = 136315138;
                  v67 = "-[ADExternalNotificationRequestHandler _handleAnnounceNotificationRequest:]";
                  v53 = "%s Currently waiting for explicit user input";
LABEL_51:
                  _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, v53, buf, 0xCu);
                }
LABEL_52:
                v54 = [(ADExternalNotificationRequestHandler *)self _requestQueue];
                [v54 enqueueAnnouncementRequest:v4];
              }
              else
              {
                if (v62)
                {
                  *(_DWORD *)buf = 136315138;
                  v67 = "-[ADExternalNotificationRequestHandler _handleAnnounceNotificationRequest:]";
                  _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%s Currently listening but new notification came in, starting new reading request", buf, 0xCu);
                }
                [(ADExternalNotificationRequestHandler *)self _clearTriggerlessUserReplyTimer];
                [(ADExternalNotificationRequestHandler *)self _changeCurrentStateToState:2];
                [(ADExternalNotificationRequestHandler *)self _setCurrentRequest:v4];
                v63 = [(ADExternalNotificationRequestHandler *)self _requestQueue];
                [v63 enqueueAnnouncementRequest:v4];

                [(ADExternalNotificationRequestHandler *)self _startAnnouncementRequest:v4];
              }
              break;
            default:
              break;
          }

          goto LABEL_68;
        }
        v41 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v67 = "-[ADExternalNotificationRequestHandler _handleAnnounceNotificationRequest:]";
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s In an announce call request, rejecting notification", buf, 0xCu);
        }
        v42 = v4;
        uint64_t v43 = 5;
        uint64_t v44 = 1;
      }
      [v42 completeRequestWithSuccess:0 forReason:v43 shouldEmitInstrumentationEvent:v44];
    }
LABEL_68:

    goto LABEL_63;
  }
  id v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v67 = "-[ADExternalNotificationRequestHandler _handleAnnounceNotificationRequest:]";
    uint64_t v15 = "%s Not announcing over device speaker, device is on silent";
    goto LABEL_22;
  }
LABEL_23:
  int v17 = v4;
  uint64_t v18 = 8;
LABEL_27:
  uint64_t v23 = 1;
LABEL_62:
  [v17 completeRequestWithSuccess:0 forReason:v18 shouldEmitInstrumentationEvent:v23];
LABEL_63:
}

- (BOOL)_announceOnDeviceSpeakerAllowedForRequest:(id)a3
{
  id v3 = a3;
  char v4 = _AFPreferencesAnnounceNotificationsOnBuiltInSpeakerEnabled();
  id v5 = [v3 announcementType];

  if (v5 == (id)9) {
    return 1;
  }
  else {
    return v4;
  }
}

- (void)_deliverSummary:(id)a3 forNotification:(id)a4 completion:(id)a5
{
  requestQueue = self->_requestQueue;
  id v8 = a5;
  id v9 = a3;
  id v11 = [a4 request];
  uint64_t v10 = [v11 identifier];
  [(ADExternalNotificationRequestQueue *)requestQueue deliverSummary:v9 forNotificationWithIdentifier:v10 completion:v8];
}

- (void)deliverSummary:(id)a3 forNotification:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003407F0;
  v15[3] = &unk_10050E228;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)announcementRequestReadyToBeAnnounced:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100340898;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_handleAnnouncementRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5)
  {
    if (v5 == (id)2)
    {
      [(ADExternalNotificationRequestHandler *)self _handleAnnounceIncomingCallRequest:v4];
    }
    else if (v5 == (id)1)
    {
      [(ADExternalNotificationRequestHandler *)self _handleAnnounceNotificationRequest:v4];
    }
  }
  else
  {
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "-[ADExternalNotificationRequestHandler _handleAnnouncementRequest:]";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Unknown announcement request type for request : %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)handleAnnouncementRequest:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100340BD0;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_markThreadCancellationForCurrentRequest:(id)a3
{
  id v3 = a3;
  if ([v3 requestType] == (id)1)
  {
    id v4 = v3;
    id v5 = [v4 appID];
    id v6 = [v4 notification];
    int v7 = [v6 request];
    id v8 = [v7 content];
    __int16 v9 = [v8 threadIdentifier];

    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315650;
      id v13 = "-[ADExternalNotificationRequestHandler _markThreadCancellationForCurrentRequest:]";
      __int16 v14 = 2112;
      uint64_t v15 = v5;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Marking thread cancellation for app: %@ threadID: %@", (uint8_t *)&v12, 0x20u);
    }
    id v11 = +[AFPreferences sharedPreferences];
    [v11 markLastAnnouncementInThreadAsCancelledForApp:v5 threadID:v9];
  }
}

- (void)_changeCurrentStateToState:(int64_t)a3
{
  [(AFWatchdogTimer *)self->_stateTimer cancel];
  stateTimer = self->_stateTimer;
  self->_stateTimer = 0;

  id v6 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = v6;
    id v8 = AFExternalNotificationRequestHandlerStateGetName();
    __int16 v9 = AFExternalNotificationRequestHandlerStateGetName();
    int v14 = 136315650;
    uint64_t v15 = "-[ADExternalNotificationRequestHandler _changeCurrentStateToState:]";
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    int64_t v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Changing state from %@ to %@", (uint8_t *)&v14, 0x20u);
  }
  self->_int64_t currentState = a3;
  id v10 = [(ADExternalNotificationRequestHandler *)self _sharedCommandCenter];
  [v10 announceNotificationHandlingStateUpdatedToState:a3];
  switch(a3)
  {
    case 1:
      [(ADExternalNotificationRequestHandler *)self _clearRequestState];
      break;
    case 2:
      self->_BOOL waitForUserInputAfterReading = 0;
      break;
    case 5:
      if (self->_waitForUserInputAfterReading)
      {
        id v11 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v14 = 136315138;
          uint64_t v15 = "-[ADExternalNotificationRequestHandler _changeCurrentStateToState:]";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Deferring Audio session deactivation since we are waiting for user input", (uint8_t *)&v14, 0xCu);
        }
      }
      else
      {
        int v12 = [(ADExternalNotificationRequestHandler *)self _currentRequest];
        id v13 = [v12 requestType];

        if (v13 != (id)2) {
          [v10 forceAudioSessionInactiveWithOptions:0 completion:0];
        }
      }
      break;
    case 6:
      self->_unint64_t synchronousBurstIndex = 0;
      break;
    default:
      break;
  }
}

- (void)_clearTriggerlessUserReplyTimer
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[ADExternalNotificationRequestHandler _clearTriggerlessUserReplyTimer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  [(AFWatchdogTimer *)self->_triggerlessUserReplyTimer cancel];
  triggerlessUserReplyTimer = self->_triggerlessUserReplyTimer;
  self->_triggerlessUserReplyTimer = 0;

  self->_triggerlessUserReplyTimerTimedOut = 0;
}

- (void)_clearRequestState
{
  currentRequestDelayManager = self->_currentRequestDelayManager;
  if (currentRequestDelayManager)
  {
    [(ADRequestDelayManager *)currentRequestDelayManager stopDelayingAndSendCommands:0 completion:0];
    [(ADRequestDelayManager *)self->_currentRequestDelayManager beginTimerForContextCommands];
    id v4 = self->_currentRequestDelayManager;
    self->_currentRequestDelayManager = 0;
  }
  callObserver = self->_callObserver;
  if (callObserver)
  {
    self->_callObserver = 0;
  }
  id v6 = +[AFSiriClientStateManager sharedManager];
  [v6 endSessionForClient:self];

  [(ADAnnounceSpeechManager *)self->_announceSpeechManager stopAttending];
  [(ADExternalNotificationRequestHandler *)self _clearTriggerlessUserReplyTimer];
  [(ADExternalNotificationRequestHandler *)self _clearCurrentNotificationTimer];
  int v7 = [(ADExternalNotificationRequestHandler *)self _requestQueue];
  [v7 clearRequestQueue];

  [(ADExternalNotificationRequestHandler *)self _setCurrentRequest:0];
  self->_unint64_t synchronousBurstIndex = 0;
  self->_BOOL waitForUserInputAfterReading = 0;
  instrumentationQueue = self->_instrumentationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003411A8;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(instrumentationQueue, block);
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1003411B8;
  v10[3] = &unk_10050E138;
  v10[4] = self;
  dispatch_async(queue, v10);
}

- (void)_completeNotificationsWithSuccess:(BOOL)a3 forReason:(int64_t)a4 shouldEmitInstrumentationEvent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  __int16 v9 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v11 = v9;
    if ((unint64_t)a4 > 0x10) {
      int v12 = @"(unknown)";
    }
    else {
      int v12 = *(&off_100504598 + a4);
    }
    id v13 = v12;
    int v14 = 136315650;
    uint64_t v15 = "-[ADExternalNotificationRequestHandler _completeNotificationsWithSuccess:forReason:shouldEmitInstrumentationEvent:]";
    __int16 v16 = 1024;
    BOOL v17 = v7;
    __int16 v18 = 2112;
    int64_t v19 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s success: %d, reason: %@", (uint8_t *)&v14, 0x1Cu);
  }
  id v10 = [(ADExternalNotificationRequestHandler *)self _requestQueue];
  [v10 completeCurrentRequestWithSuccess:v7 forReason:a4 shouldEmitInstrumentationEvent:v5];
}

- (BOOL)_isDeviceSilent
{
  id v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    ringerStateObserver = self->_ringerStateObserver;
    BOOL v5 = v3;
    int v7 = 136315394;
    id v8 = "-[ADExternalNotificationRequestHandler _isDeviceSilent]";
    __int16 v9 = 2048;
    id v10 = [(AFNotifyObserver *)ringerStateObserver state];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Device RingerSwitchState : %ld", (uint8_t *)&v7, 0x16u);
  }
  return [(AFNotifyObserver *)self->_ringerStateObserver state] == 0;
}

- (id)_queue
{
  return self->_queue;
}

- (void)_setCurrentRequest:(id)a3
{
}

- (id)_currentRequest
{
  return self->_currentRequest;
}

- (int64_t)_currentState
{
  return self->_currentState;
}

- (id)_requestQueue
{
  return self->_requestQueue;
}

- (id)_sharedCommandCenter
{
  return +[ADCommandCenter sharedCommandCenter];
}

- (id)_init
{
  v37.receiver = self;
  v37.super_class = (Class)ADExternalNotificationRequestHandler;
  id v2 = [(ADExternalNotificationRequestHandler *)&v37 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ADExternalRequestDelayedActionHandler", v3);

    BOOL v5 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v4;

    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("ADExternalNotificationRequestHandler Instrumentation Queue", v6);

    id v8 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v7;

    *((void *)v2 + 5) = 1;
    __int16 v9 = objc_alloc_init(ADExternalNotificationRequestQueue);
    id v10 = (void *)*((void *)v2 + 16);
    *((void *)v2 + 16) = v9;

    [*((id *)v2 + 16) setDelgate:v2];
    *((void *)v2 + 15) = 0;
    id v11 = +[ADRequestLifecycleObserver sharedObserver];
    [v11 addListener:v2];

    int v12 = +[ADSpeechManager sharedManager];
    id v13 = [v12 audioPlaybackService];
    [v13 addListener:v2];

    id v14 = objc_alloc((Class)AFNotifyObserver);
    id v15 = [objc_alloc((Class)NSString) initWithUTF8String:"com.apple.siri.client-state-changed"];
    id v16 = [v14 initWithName:v15 options:1 queue:*((void *)v2 + 10) delegate:v2];
    BOOL v17 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v16;

    __int16 v18 = objc_alloc_init(ADAnnounceSpeechManager);
    int64_t v19 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v18;

    [*((id *)v2 + 9) setDelegate:v2];
    __int16 v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.siri.systemstateaccess", v21);
    uint64_t v23 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v22;

    id v24 = [objc_alloc((Class)AFNotifyObserver) initWithName:@"com.apple.springboard.ringerstate" options:1 queue:*((void *)v2 + 12) delegate:0];
    __int16 v25 = (void *)*((void *)v2 + 17);
    *((void *)v2 + 17) = v24;

    unint64_t v26 = +[AVSystemController sharedAVSystemController];
    uint64_t v42 = AVSystemController_VoicePromptStyleDidChangeNotification;
    __int16 v27 = +[NSArray arrayWithObjects:&v42 count:1];
    id v36 = 0;
    [v26 setAttribute:v27 forKey:AVSystemController_SubscribeToNotificationsAttribute error:&v36];
    id v28 = v36;

    if (v28)
    {
      id v29 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ADExternalNotificationRequestHandler _init]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v28;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s Unable to register for VoicePromptStyleDidChange Notification on AVSystemController: %{public}@", buf, 0x16u);
      }
    }
    v30 = +[NSNotificationCenter defaultCenter];
    [v30 addObserver:v2 selector:"voicePromptStyleDidChange:" name:AVSystemController_VoicePromptStyleDidChangeNotification object:0];

    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2050000000;
    id v31 = (void *)qword_1005863E8;
    uint64_t v41 = qword_1005863E8;
    if (!qword_1005863E8)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_1003418A0;
      uint64_t v44 = &unk_10050E318;
      v45 = &v38;
      sub_1003418A0((uint64_t)buf);
      id v31 = (void *)v39[3];
    }
    unsigned int v32 = v31;
    _Block_object_dispose(&v38, 8);
    id v33 = [[v32 alloc] initWithQueue:*((void *)v2 + 10)];
    char v34 = (void *)*((void *)v2 + 18);
    *((void *)v2 + 18) = v33;

    dispatch_async(*((dispatch_queue_t *)v2 + 10), &stru_10050C9B8);
  }
  return v2;
}

+ (id)sharedNotificationRequestHandler
{
  if (qword_1005863D8 != -1) {
    dispatch_once(&qword_1005863D8, &stru_10050C998);
  }
  id v2 = (void *)qword_1005863E0;
  return v2;
}

@end