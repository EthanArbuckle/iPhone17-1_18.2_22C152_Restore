@interface ADAudioSessionCoordinator
- (ADAudioSessionCoordinator)initWithInstanceContext:(id)a3 delegate:(id)a4;
- (BOOL)_relinquishRemoteAssertionForSenderID:(id)a3 reason:(id)a4 effectiveDate:(id)a5 error:(id *)a6;
- (BOOL)hasActiveAudioSessionAssertions;
- (id)_acquireRemoteAssertionForSenderID:(id)a3 reason:(id)a4 effectiveDate:(id)a5 expirationDuration:(double)a6 error:(id *)a7;
- (id)_deviceWithID:(id)a3;
- (id)_disqualifiedDevices;
- (id)_qualifiedDeviceIDs;
- (id)_qualifiedDevices;
- (id)_qualifiedInRangeDeviceIDs;
- (id)_qualifiedInRangeDevices;
- (id)_qualifiedOutOfRangeDeviceIDs;
- (id)_qualifiedOutOfRangeDevices;
- (id)_queue;
- (id)acquireAudioSessionAssertionWithContext:(id)a3 relinquishmentHandler:(id)a4;
- (void)_addDeviceIDToKeepAliveList:(id)a3 reason:(id)a4;
- (void)_beginAudioSessionOnInRangeRemoteDevicesForReason:(id)a3 effectiveDate:(id)a4 expirationDuration:(double)a5;
- (void)_endAudioSessionOnAllRemoteDevicesForReason:(id)a3 effectiveDate:(id)a4;
- (void)_endAudioSessionOnOutOfRangeRemoteDevicesForReason:(id)a3 effectiveDate:(id)a4;
- (void)_enumerateKeepAliveListUsingBlock:(id)a3;
- (void)_handleAcquiredLocalAssertion:(id)a3 isFirst:(BOOL)a4;
- (void)_handleAcquiredRemoteAssertion:(id)a3 isFirst:(BOOL)a4;
- (void)_handleAddedLocalAssertion:(id)a3 isFirst:(BOOL)a4;
- (void)_handleBeginAudioSessionRequest:(id)a3 fromDeviceWithID:(id)a4 responseHandler:(id)a5;
- (void)_handleDidSetAudioSessionActive:(BOOL)a3;
- (void)_handleEndAudioSessionRequest:(id)a3 fromDeviceWithID:(id)a4 responseHandler:(id)a5;
- (void)_handleFoundRemoteDevice:(id)a3;
- (void)_handleKeepAudioSessionAliveRequest:(id)a3 fromDeviceWithID:(id)a4 responseHandler:(id)a5;
- (void)_handleLostRemoteDevice:(id)a3;
- (void)_handleMessage:(id)a3 fromDeviceWithID:(id)a4 replyHandler:(id)a5;
- (void)_handleRelinquishedLocalAssertion:(id)a3 isLast:(BOOL)a4;
- (void)_handleRelinquishedRemoteAssertion:(id)a3 isLast:(BOOL)a4;
- (void)_handleRemovedLocalAssertion:(id)a3 isLast:(BOOL)a4;
- (void)_handleUpdatedCurrentOrUpNextDateIntervalForReason:(id)a3;
- (void)_handleUpdatedLocalAssertionsForReason:(id)a3 pendingAssertions:(id)a4 activeAssertions:(id)a5;
- (void)_handleUpdatedLocalDevice:(id)a3;
- (void)_handleUpdatedLocalSystemInfoForReason:(id)a3;
- (void)_handleUpdatedRemoteDevice:(id)a3;
- (void)_handleWillSetAudioSessionActive:(BOOL)a3;
- (void)_heartBeatFired;
- (void)_invalidate;
- (void)_keepAudioSessionAliveOnRemoteDevicesForReason:(id)a3 expirationDuration:(double)a4;
- (void)_registerRequestID:(id)a3 requestHandler:(id)a4;
- (void)_removeDeviceIDFromKeepAliveList:(id)a3 reason:(id)a4;
- (void)_resetKeepAliveListForReason:(id)a3;
- (void)_resetRapportLinkAndReconnectNow:(BOOL)a3;
- (void)_sendBeginAudioSessionRequest:(id)a3 toDeviceWithID:(id)a4 responseHandler:(id)a5;
- (void)_sendEndAudioSessionRequest:(id)a3 toDeviceWithID:(id)a4 responseHandler:(id)a5;
- (void)_sendKeepAudioSessionAliveRequest:(id)a3 toDeviceWithID:(id)a4 responseHandler:(id)a5;
- (void)_sendMessage:(id)a3 toDeviceWithID:(id)a4 replyHandler:(id)a5;
- (void)_sendRequestID:(id)a3 request:(id)a4 recipientID:(id)a5 responseHandler:(id)a6;
- (void)_setUpRapportLink;
- (void)_setUpRequestHandlers;
- (void)_startHeartBeatWithEffectiveDate:(id)a3;
- (void)_stopHeartBeat;
- (void)_tearDownRequestHandlers;
- (void)_updateCurrentOrUpNextDateInterval:(id)a3 reason:(id)a4;
- (void)_updateHomeKitMediaSystemIdentifier:(id)a3 reason:(id)a4;
- (void)_updateHomeKitRoomName:(id)a3 reason:(id)a4;
- (void)_updateMediaRemoteGroupIdentifier:(id)a3 reason:(id)a4;
- (void)_updateMediaRemoteRouteIdentifier:(id)a3 reason:(id)a4;
- (void)assertionCoordinator:(id)a3 didActivateAssertion:(id)a4 isFirstAssertion:(BOOL)a5;
- (void)assertionCoordinator:(id)a3 didAddAssertion:(id)a4 isFirstAssertion:(BOOL)a5;
- (void)assertionCoordinator:(id)a3 didDeactivateAssertion:(id)a4 isLastAssertion:(BOOL)a5;
- (void)assertionCoordinator:(id)a3 didRemoveAssertion:(id)a4 isLastAssertion:(BOOL)a5;
- (void)dealloc;
- (void)fetchAndUpdateMediaRemoteGroupIdentifierForReason:(id)a3;
- (void)fetchAndUpdateMediaRemoteRouteIdentifierForReason:(id)a3;
- (void)getSnapshotWithCompletion:(id)a3;
- (void)handleDidSetAudioSessionActive:(BOOL)a3;
- (void)handleWillSetAudioSessionActive:(BOOL)a3;
- (void)invalidate;
- (void)mediaRemoteDeviceInfoGroupIdentifierDidChange:(id)a3;
- (void)mediaRemoteDeviceInfoRouteIdentifierDidChange:(id)a3;
- (void)rapportLink:(id)a3 didFindDevice:(id)a4;
- (void)rapportLink:(id)a3 didLoseDevice:(id)a4;
- (void)rapportLink:(id)a3 didUpdateDevice:(id)a4 changes:(unsigned int)a5;
- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4;
- (void)rapportLinkDidInterrupt:(id)a3;
- (void)rapportLinkDidInvalidate:(id)a3;
- (void)relinquishLocalAssertions;
@end

@implementation ADAudioSessionCoordinator

- (void)_sendEndAudioSessionRequest:(id)a3 toDeviceWithID:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[ADAudioSessionCoordinator(Messaging) _sendEndAudioSessionRequest:toDeviceWithID:responseHandler:]";
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s deviceID = %@, request = %@", buf, 0x20u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100279E5C;
    v16[3] = &unk_100508F78;
    id v17 = v8;
    id v12 = +[ADAudioSessionCoordinationMessage newWithBuilder:v16];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100279EC8;
    v14[3] = &unk_100508F00;
    id v15 = v10;
    [(ADAudioSessionCoordinator *)self _sendMessage:v12 toDeviceWithID:v9 replyHandler:v14];

    v13 = v17;
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    v13 = +[AFError errorWithCode:1015 description:@"Unexpected request for message."];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_sendKeepAudioSessionAliveRequest:(id)a3 toDeviceWithID:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[ADAudioSessionCoordinator(Messaging) _sendKeepAudioSessionAliveRequest:toDeviceWithID:responseHandler:]";
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s deviceID = %@, request = %@", buf, 0x20u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10027A25C;
    v16[3] = &unk_100508F78;
    id v17 = v8;
    id v12 = +[ADAudioSessionCoordinationMessage newWithBuilder:v16];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10027A2C8;
    v14[3] = &unk_100508F00;
    id v15 = v10;
    [(ADAudioSessionCoordinator *)self _sendMessage:v12 toDeviceWithID:v9 replyHandler:v14];

    v13 = v17;
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    v13 = +[AFError errorWithCode:1015 description:@"Unexpected request for message."];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_sendBeginAudioSessionRequest:(id)a3 toDeviceWithID:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[ADAudioSessionCoordinator(Messaging) _sendBeginAudioSessionRequest:toDeviceWithID:responseHandler:]";
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s deviceID = %@, request = %@", buf, 0x20u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10027A65C;
    v16[3] = &unk_100508F78;
    id v17 = v8;
    id v12 = +[ADAudioSessionCoordinationMessage newWithBuilder:v16];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10027A6C8;
    v14[3] = &unk_100508F00;
    id v15 = v10;
    [(ADAudioSessionCoordinator *)self _sendMessage:v12 toDeviceWithID:v9 replyHandler:v14];

    v13 = v17;
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    v13 = +[AFError errorWithCode:1015 description:@"Unexpected request for message."];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_sendMessage:(id)a3 toDeviceWithID:(id)a4 replyHandler:(id)a5
{
  id v8 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v9 = a4;
  id v10 = a5;
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ADAudioSessionCoordinator(Messaging) _sendMessage:toDeviceWithID:replyHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v33 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s %@ <--- %@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v33 = sub_10027ABBC;
  v34 = sub_10027ABCC;
  id v35 = 0;
  id v12 = objc_alloc((Class)AFTwoArgumentSafetyBlock);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10027ABD4;
  v28[3] = &unk_100509018;
  v31 = buf;
  id v13 = v9;
  id v29 = v13;
  id v14 = v10;
  id v30 = v14;
  id v15 = +[AFError errorWithCode:40];
  id v16 = [v12 initWithBlock:v28 defaultValue1:0 defaultValue2:v15];

  id v17 = objc_alloc((Class)AFWatchdogTimer);
  v18 = [(ADAudioSessionCoordinator *)self _queue];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10027AD80;
  v26[3] = &unk_10050E138;
  id v19 = v16;
  id v27 = v19;
  id v20 = [v17 initWithTimeoutInterval:v18 onQueue:v26 timeoutHandler:4.0];
  id v21 = *(void **)(*(void *)&buf[8] + 40);
  *(void *)(*(void *)&buf[8] + 40) = v20;

  __int16 v22 = [v8 buildDictionaryRepresentation];
  if (v22)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10027ADE4;
    v24[3] = &unk_100509040;
    id v25 = v19;
    [(ADAudioSessionCoordinator *)self _sendRequestID:@"ASC" request:v22 recipientID:v13 responseHandler:v24];
    id v23 = v25;
  }
  else
  {
    id v23 = +[AFError errorWithCode:30 description:@"Unable to create request dictionary from message."];
    [v19 invokeWithValue:0 andValue:v23];
  }

  _Block_object_dispose(buf, 8);
}

- (void)_handleEndAudioSessionRequest:(id)a3 fromDeviceWithID:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v20 = "-[ADAudioSessionCoordinator(Messaging) _handleEndAudioSessionRequest:fromDeviceWithID:responseHandler:]";
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s deviceID = %@, request = %@", buf, 0x20u);
  }
  if (v9)
  {
    id v12 = [v8 effectiveDate];
    id v18 = 0;
    unsigned int v13 = [(ADAudioSessionCoordinator *)self _relinquishRemoteAssertionForSenderID:v9 reason:@"End Audio Session" effectiveDate:v12 error:&v18];
    id v14 = v18;

    if (!v14)
    {
      id v16 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v20 = "-[ADAudioSessionCoordinator(Messaging) _handleEndAudioSessionRequest:fromDeviceWithID:responseHandler:]";
        __int16 v21 = 1024;
        LODWORD(v22) = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s success = %d", buf, 0x12u);
      }
      if (!v10) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    id v15 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
  }
  else
  {
    id v14 = +[AFError errorWithCode:1907 description:@"Sender ID is nil."];
    id v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      *(_DWORD *)buf = 136315394;
      id v20 = "-[ADAudioSessionCoordinator(Messaging) _handleEndAudioSessionRequest:fromDeviceWithID:responseHandler:]";
      __int16 v21 = 2112;
      id v22 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
      if (!v10) {
        goto LABEL_16;
      }
LABEL_9:
      if (v14)
      {
        v10[2](v10, 0, v14);
        goto LABEL_16;
      }
LABEL_14:
      id v17 = objc_alloc_init(ADAudioSessionCoordinationMessageEndAudioSessionResponse);
      ((void (**)(id, ADAudioSessionCoordinationMessageEndAudioSessionResponse *, id))v10)[2](v10, v17, 0);

LABEL_15:
      id v14 = 0;
      goto LABEL_16;
    }
  }
  if (v10) {
    goto LABEL_9;
  }
LABEL_16:
}

- (void)_handleKeepAudioSessionAliveRequest:(id)a3 fromDeviceWithID:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v20 = "-[ADAudioSessionCoordinator(Messaging) _handleKeepAudioSessionAliveRequest:fromDeviceWithID:responseHandler:]";
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s deviceID = %@, request = %@", buf, 0x20u);
  }
  if (v9)
  {
    [v8 expirationDuration];
    id v18 = 0;
    id v12 = -[ADAudioSessionCoordinator _acquireRemoteAssertionForSenderID:reason:effectiveDate:expirationDuration:error:](self, "_acquireRemoteAssertionForSenderID:reason:effectiveDate:expirationDuration:error:", v9, @"Keep Audio Session Alive", 0, &v18);
    id v13 = v18;
    if (v12)
    {
      id v14 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v20 = "-[ADAudioSessionCoordinator(Messaging) _handleKeepAudioSessionAliveRequest:fromDeviceWithID:responseHandler:]";
        __int16 v21 = 2112;
        id v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s assertionUUID = %@", buf, 0x16u);
      }
    }
    else
    {
      id v16 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v20 = "-[ADAudioSessionCoordinator(Messaging) _handleKeepAudioSessionAliveRequest:fromDeviceWithID:responseHandler:]";
        __int16 v21 = 2112;
        id v22 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v13 = +[AFError errorWithCode:1906 description:@"Sender ID is nil."];
    id v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "-[ADAudioSessionCoordinator(Messaging) _handleKeepAudioSessionAliveRequest:fromDeviceWithID:responseHandler:]";
      __int16 v21 = 2112;
      id v22 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
    }
  }
  if (v10)
  {
    if (v13)
    {
      v10[2](v10, 0, v13);
    }
    else
    {
      id v17 = objc_alloc_init(ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse);
      ((void (**)(id, ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse *, id))v10)[2](v10, v17, 0);
    }
  }
}

- (void)_handleBeginAudioSessionRequest:(id)a3 fromDeviceWithID:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v21 = "-[ADAudioSessionCoordinator(Messaging) _handleBeginAudioSessionRequest:fromDeviceWithID:responseHandler:]";
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s deviceID = %@, request = %@", buf, 0x20u);
  }
  if (v9)
  {
    id v12 = [v8 effectiveDate];
    [v8 expirationDuration];
    id v19 = 0;
    id v13 = -[ADAudioSessionCoordinator _acquireRemoteAssertionForSenderID:reason:effectiveDate:expirationDuration:error:](self, "_acquireRemoteAssertionForSenderID:reason:effectiveDate:expirationDuration:error:", v9, @"Begin Audio Session", v12, &v19);
    id v14 = v19;

    if (v13)
    {
      id v15 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v21 = "-[ADAudioSessionCoordinator(Messaging) _handleBeginAudioSessionRequest:fromDeviceWithID:responseHandler:]";
        __int16 v22 = 2112;
        id v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s assertionUUID = %@", buf, 0x16u);
      }
    }
    else
    {
      id v17 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v21 = "-[ADAudioSessionCoordinator(Messaging) _handleBeginAudioSessionRequest:fromDeviceWithID:responseHandler:]";
        __int16 v22 = 2112;
        id v23 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v14 = +[AFError errorWithCode:1906 description:@"Sender ID is nil."];
    id v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v21 = "-[ADAudioSessionCoordinator(Messaging) _handleBeginAudioSessionRequest:fromDeviceWithID:responseHandler:]";
      __int16 v22 = 2112;
      id v23 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
    }
  }
  if (v10)
  {
    if (v14)
    {
      v10[2](v10, 0, v14);
    }
    else
    {
      id v18 = objc_alloc_init(ADAudioSessionCoordinationMessageBeginAudioSessionResponse);
      ((void (**)(id, ADAudioSessionCoordinationMessageBeginAudioSessionResponse *, id))v10)[2](v10, v18, 0);
    }
  }
}

- (void)_handleMessage:(id)a3 fromDeviceWithID:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v30 = "-[ADAudioSessionCoordinator(Messaging) _handleMessage:fromDeviceWithID:replyHandler:]";
    __int16 v31 = 2112;
    id v32 = v9;
    __int16 v33 = 2112;
    id v34 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s %@ ---> %@", buf, 0x20u);
  }
  id v12 = objc_alloc((Class)AFTwoArgumentSafetyBlock);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10027BBB8;
  v26[3] = &unk_100508F50;
  id v13 = v9;
  id v27 = v13;
  id v14 = v10;
  id v28 = v14;
  id v15 = +[AFError errorWithCode:40];
  id v16 = [v12 initWithBlock:v26 defaultValue1:0 defaultValue2:v15];

  id v17 = [v8 type];
  if (v17 == (id)5)
  {
    id v18 = [v8 payloadEndAudioSessionRequest];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10027BFA0;
      v20[3] = &unk_100508FF0;
      id v21 = v16;
      [(ADAudioSessionCoordinator *)self _handleEndAudioSessionRequest:v18 fromDeviceWithID:v13 responseHandler:v20];
      id v19 = v21;
      goto LABEL_14;
    }
  }
  else if (v17 == (id)3)
  {
    id v18 = [v8 payloadKeepAudioSessionAliveRequest];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10027BE70;
      v22[3] = &unk_100508FC8;
      id v23 = v16;
      [(ADAudioSessionCoordinator *)self _handleKeepAudioSessionAliveRequest:v18 fromDeviceWithID:v13 responseHandler:v22];
      id v19 = v23;
      goto LABEL_14;
    }
  }
  else
  {
    if (v17 != (id)1)
    {
      id v18 = +[AFError errorWithCode:1014 description:@"Unexpected message type."];
      [v16 invokeWithValue:0 andValue:v18];
      goto LABEL_16;
    }
    id v18 = [v8 payloadBeginAudioSessionRequest];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10027BD40;
      v24[3] = &unk_100508FA0;
      id v25 = v16;
      [(ADAudioSessionCoordinator *)self _handleBeginAudioSessionRequest:v18 fromDeviceWithID:v13 responseHandler:v24];
      id v19 = v25;
LABEL_14:

      goto LABEL_16;
    }
  }
  if (v14)
  {
    id v19 = +[AFError errorWithCode:1015 description:@"Unexpected request in message."];
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v19);
    goto LABEL_14;
  }
LABEL_16:
}

- (void)_tearDownRequestHandlers
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    v5 = "-[ADAudioSessionCoordinator(Messaging) _tearDownRequestHandlers]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(ADAudioSessionCoordinator *)self _unregisterRequestID:@"ASC"];
}

- (void)_setUpRequestHandlers
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(location[0]) = 136315138;
    *(id *)((char *)location + 4) = "-[ADAudioSessionCoordinator(Messaging) _setUpRequestHandlers]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)location, 0xCu);
  }
  objc_initWeak(location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10027C42C;
  v4[3] = &unk_100508F28;
  objc_copyWeak(&v5, location);
  [(ADAudioSessionCoordinator *)self _registerRequestID:@"ASC" requestHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapportLink, 0);
  objc_storeStrong((id *)&self->_rapportLinkReadyGroup, 0);
  objc_storeStrong((id *)&self->_rapportLinkQueue, 0);
  objc_storeStrong((id *)&self->_remoteAssertionCoordinator, 0);
  objc_storeStrong((id *)&self->_localAssertionCoordinator, 0);
  objc_storeStrong((id *)&self->_localSystemInfo, 0);
  objc_storeStrong((id *)&self->_keepAliveDeviceIDs, 0);
  objc_storeStrong((id *)&self->_currentOrUpNextDateInterval, 0);
  objc_storeStrong((id *)&self->_heartBeat, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)_qualifiedOutOfRangeDeviceIDs
{
  id v3 = objc_alloc((Class)NSSet);
  int v4 = [(ADAudioSessionCoordinator *)self _qualifiedOutOfRangeDevices];
  id v5 = sub_1002CF408(v4);
  id v6 = [v3 initWithArray:v5];

  return v6;
}

- (id)_qualifiedInRangeDeviceIDs
{
  id v3 = objc_alloc((Class)NSSet);
  int v4 = [(ADAudioSessionCoordinator *)self _qualifiedInRangeDevices];
  id v5 = sub_1002CF408(v4);
  id v6 = [v3 initWithArray:v5];

  return v6;
}

- (id)_qualifiedDeviceIDs
{
  id v3 = objc_alloc((Class)NSSet);
  int v4 = [(ADAudioSessionCoordinator *)self _qualifiedDevices];
  id v5 = sub_1002CF408(v4);
  id v6 = [v3 initWithArray:v5];

  return v6;
}

- (id)_disqualifiedDevices
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  int v4 = [(ADRapportLink *)self->_rapportLink activeDevices];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002CF7C4;
  v9[3] = &unk_10050AE58;
  id v5 = v3;
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  if (![v5 count])
  {
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[ADAudioSessionCoordinator _disqualifiedDevices]";
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s No disqualified device can be found.", buf, 0xCu);
    }
  }
  id v7 = [v5 copy];

  return v7;
}

- (id)_qualifiedOutOfRangeDevices
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  int v4 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    localSystemInfo = self->_localSystemInfo;
    v11 = v4;
    id v12 = [(AFAudioSessionCoordinationSystemInfo *)localSystemInfo homeKitRoomName];
    *(_DWORD *)buf = 136315394;
    id v20 = "-[ADAudioSessionCoordinator _qualifiedOutOfRangeDevices]";
    __int16 v21 = 2112;
    __int16 v22 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s roomName = %@", buf, 0x16u);
  }
  id v5 = [(ADRapportLink *)self->_rapportLink activeDevices];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_1002CFD98;
  id v16 = &unk_10050AE80;
  id v17 = self;
  id v6 = v3;
  id v18 = v6;
  [v5 enumerateObjectsUsingBlock:&v13];

  if (!objc_msgSend(v6, "count", v13, v14, v15, v16, v17))
  {
    id v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v20 = "-[ADAudioSessionCoordinator _qualifiedOutOfRangeDevices]";
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s No qualified out-of-range device can be found.", buf, 0xCu);
    }
  }
  id v8 = [v6 copy];

  return v8;
}

- (id)_qualifiedInRangeDevices
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  int v4 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    localSystemInfo = self->_localSystemInfo;
    v11 = v4;
    id v12 = [(AFAudioSessionCoordinationSystemInfo *)localSystemInfo homeKitRoomName];
    *(_DWORD *)buf = 136315394;
    id v20 = "-[ADAudioSessionCoordinator _qualifiedInRangeDevices]";
    __int16 v21 = 2112;
    __int16 v22 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s roomName = %@", buf, 0x16u);
  }
  id v5 = [(ADRapportLink *)self->_rapportLink activeDevices];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_1002D02C0;
  id v16 = &unk_10050AE80;
  id v17 = self;
  id v6 = v3;
  id v18 = v6;
  [v5 enumerateObjectsUsingBlock:&v13];

  if (!objc_msgSend(v6, "count", v13, v14, v15, v16, v17))
  {
    id v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v20 = "-[ADAudioSessionCoordinator _qualifiedInRangeDevices]";
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s No qualified in-range device can be found.", buf, 0xCu);
    }
  }
  id v8 = [v6 copy];

  return v8;
}

- (id)_qualifiedDevices
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  int v4 = [(ADRapportLink *)self->_rapportLink activeDevices];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002D0618;
  v9[3] = &unk_10050AE58;
  id v5 = v3;
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  if (![v5 count])
  {
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[ADAudioSessionCoordinator _qualifiedDevices]";
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s No qualified device can be found.", buf, 0xCu);
    }
  }
  id v7 = [v5 copy];

  return v7;
}

- (id)_deviceWithID:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v27 = "-[ADAudioSessionCoordinator _deviceWithID:]";
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s deviceID = %@", buf, 0x16u);
    if (v4) {
      goto LABEL_3;
    }
LABEL_16:
    id v14 = 0;
    goto LABEL_17;
  }
  if (!v4) {
    goto LABEL_16;
  }
LABEL_3:
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [(ADRapportLink *)self->_rapportLink activeDevices];
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v38 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
      id v12 = [v11 identifier];
      unsigned int v13 = [v12 isEqualToString:v4];

      if (v13) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v22 objects:v38 count:16];
        if (v8) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v15 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
LABEL_13:

      id v14 = v11;
      goto LABEL_14;
    }
    id v17 = [v11 model];
    id v18 = [v11 name];
    id v19 = [v11 roomName];
    int v20 = [v11 proximity];
    if (v20 > 19)
    {
      if (v20 == 20)
      {
        __int16 v21 = "Near";
        goto LABEL_30;
      }
      if (v20 == 30)
      {
        __int16 v21 = "Far";
        goto LABEL_30;
      }
    }
    else
    {
      if (!v20)
      {
        __int16 v21 = "Unknown";
        goto LABEL_30;
      }
      if (v20 == 10)
      {
        __int16 v21 = "Immed";
LABEL_30:
        *(_DWORD *)buf = 136316418;
        id v27 = "-[ADAudioSessionCoordinator _deviceWithID:]";
        __int16 v28 = 2112;
        id v29 = v4;
        __int16 v30 = 2112;
        __int16 v31 = v17;
        __int16 v32 = 2112;
        __int16 v33 = v18;
        __int16 v34 = 2112;
        id v35 = v19;
        __int16 v36 = 2080;
        v37 = v21;
        _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s deviceID = %@, model = %@, name = %@, roomName = %@, proximity = %s", buf, 0x3Eu);

        goto LABEL_13;
      }
    }
    __int16 v21 = "?";
    goto LABEL_30;
  }
LABEL_11:
  id v14 = 0;
LABEL_14:

LABEL_17:
  return v14;
}

- (void)_handleLostRemoteDevice:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    id v19 = "-[ADAudioSessionCoordinator _handleLostRemoteDevice:]";
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s device = %@", (uint8_t *)&v18, 0x16u);
  }
  if ([(AFAudioSessionCoordinationSystemInfo *)self->_localSystemInfo isSupportedAndEnabled])
  {
    id v6 = [v4 identifier];
    id v7 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_19:

      if (v6)
      {
        [(ADAudioSessionCoordinator *)self _removeDeviceIDFromKeepAliveList:v6 reason:@"Remote Device Lost"];
        [(ADAudioSessionCoordinator *)self _relinquishRemoteAssertionForSenderID:v6 reason:@"Remote Device Lost" effectiveDate:0 error:0];
      }
      else
      {
        id v17 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          int v18 = 136315138;
          id v19 = "-[ADAudioSessionCoordinator _handleLostRemoteDevice:]";
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Device ID is nil.", (uint8_t *)&v18, 0xCu);
        }
      }

      goto LABEL_24;
    }
    uint64_t v8 = [v4 model];
    uint64_t v9 = [v4 name];
    uint64_t v10 = [v4 roomName];
    v11 = [v4 mediaSystemIdentifier];
    int v12 = [v4 proximity];
    unsigned int v13 = (void *)v8;
    if (v12 > 19)
    {
      if (v12 == 20)
      {
        id v14 = "Near";
        goto LABEL_18;
      }
      if (v12 == 30)
      {
        id v14 = "Far";
        goto LABEL_18;
      }
    }
    else
    {
      if (!v12)
      {
        id v14 = "Unknown";
        goto LABEL_18;
      }
      if (v12 == 10)
      {
        id v14 = "Immed";
LABEL_18:
        id v16 = sub_1002CF9D0(v4);
        int v18 = 136316930;
        id v19 = "-[ADAudioSessionCoordinator _handleLostRemoteDevice:]";
        __int16 v20 = 2112;
        id v21 = v6;
        __int16 v22 = 2112;
        long long v23 = v13;
        __int16 v24 = 2112;
        long long v25 = v9;
        __int16 v26 = 2112;
        id v27 = v10;
        __int16 v28 = 2112;
        id v29 = v11;
        __int16 v30 = 2080;
        __int16 v31 = v14;
        __int16 v32 = 2112;
        __int16 v33 = v16;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s deviceID = %@, model = %@, name = %@, roomName = %@, mediaSystemIdentifier = %@, proximity = %s, systemInfo = %@", (uint8_t *)&v18, 0x52u);

        goto LABEL_19;
      }
    }
    id v14 = "?";
    goto LABEL_18;
  }
  if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    id v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315138;
      id v19 = "-[ADAudioSessionCoordinator _handleLostRemoteDevice:]";
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.", (uint8_t *)&v18, 0xCu);
    }
  }
LABEL_24:
}

- (void)_handleUpdatedRemoteDevice:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v29 = "-[ADAudioSessionCoordinator _handleUpdatedRemoteDevice:]";
    __int16 v30 = 2112;
    id v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s device = %@", buf, 0x16u);
  }
  if ([(AFAudioSessionCoordinationSystemInfo *)self->_localSystemInfo isSupportedAndEnabled])
  {
    id v6 = [v4 identifier];
    id v7 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_19:

      if (v6)
      {
        unsigned int v16 = sub_1002CF998(v4);
        id v17 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          id v29 = "-[ADAudioSessionCoordinator _handleUpdatedRemoteDevice:]";
          __int16 v30 = 1024;
          LODWORD(v31) = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s deviceIsQualified = %d", buf, 0x12u);
        }
        if (v16)
        {
          int v18 = sub_1002CFF80(v4, self->_localSystemInfo);
          id v19 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            id v29 = "-[ADAudioSessionCoordinator _handleUpdatedRemoteDevice:]";
            __int16 v30 = 1024;
            LODWORD(v31) = v18;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s deviceIsInRange = %d", buf, 0x12u);
          }
          __int16 v20 = +[NSDate date];
          int EffectiveDateAndExpirationDurationFromDateInterval = AFAssertionGetEffectiveDateAndExpirationDurationFromDateInterval();
          id v22 = 0;

          long long v23 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            id v29 = "-[ADAudioSessionCoordinator _handleUpdatedRemoteDevice:]";
            __int16 v30 = 1024;
            LODWORD(v31) = EffectiveDateAndExpirationDurationFromDateInterval;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s dateIntervalIsValid = %d", buf, 0x12u);
          }
          if ((v18 & EffectiveDateAndExpirationDurationFromDateInterval) == 1)
          {
            __int16 v24 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315650;
              id v29 = "-[ADAudioSessionCoordinator _handleUpdatedRemoteDevice:]";
              __int16 v30 = 2112;
              id v31 = v22;
              __int16 v32 = 2048;
              __int16 v33 = 0;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s effectiveDate = %@, expirationDuration = %f", buf, 0x20u);
            }
            long long v25 = [[ADAudioSessionCoordinationMessageBeginAudioSessionRequest alloc] initWithEffectiveDate:v22 expirationDuration:0.0];
            [(ADAudioSessionCoordinator *)self _sendBeginAudioSessionRequest:v25 toDeviceWithID:v6 responseHandler:0];

            [(ADAudioSessionCoordinator *)self _addDeviceIDToKeepAliveList:v6 reason:@"Remote Device Updated"];
          }
          else
          {
            [(ADAudioSessionCoordinator *)self _removeDeviceIDFromKeepAliveList:v6 reason:@"Remote Device Updated"];
            id v27 = [[ADAudioSessionCoordinationMessageEndAudioSessionRequest alloc] initWithEffectiveDate:0];
            [(ADAudioSessionCoordinator *)self _sendEndAudioSessionRequest:v27 toDeviceWithID:v6 responseHandler:0];
          }
        }
      }
      else
      {
        __int16 v26 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          id v29 = "-[ADAudioSessionCoordinator _handleUpdatedRemoteDevice:]";
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s Device ID is nil.", buf, 0xCu);
        }
      }

      goto LABEL_36;
    }
    uint64_t v8 = [v4 model];
    uint64_t v9 = [v4 name];
    uint64_t v10 = [v4 roomName];
    v11 = [v4 mediaSystemIdentifier];
    int v12 = [v4 proximity];
    if (v12 > 19)
    {
      if (v12 == 20)
      {
        unsigned int v13 = "Near";
        goto LABEL_18;
      }
      if (v12 == 30)
      {
        unsigned int v13 = "Far";
        goto LABEL_18;
      }
    }
    else
    {
      if (!v12)
      {
        unsigned int v13 = "Unknown";
        goto LABEL_18;
      }
      if (v12 == 10)
      {
        unsigned int v13 = "Immed";
LABEL_18:
        id v15 = sub_1002CF9D0(v4);
        *(_DWORD *)buf = 136316930;
        id v29 = "-[ADAudioSessionCoordinator _handleUpdatedRemoteDevice:]";
        __int16 v30 = 2112;
        id v31 = v6;
        __int16 v32 = 2112;
        __int16 v33 = v8;
        __int16 v34 = 2112;
        id v35 = v9;
        __int16 v36 = 2112;
        v37 = v10;
        __int16 v38 = 2112;
        v39 = v11;
        __int16 v40 = 2080;
        v41 = v13;
        __int16 v42 = 2112;
        v43 = v15;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s deviceID = %@, model = %@, name = %@, roomName = %@, mediaSystemIdentifier = %@, proximity = %s, systemInfo = %@", buf, 0x52u);

        goto LABEL_19;
      }
    }
    unsigned int v13 = "?";
    goto LABEL_18;
  }
  if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    id v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v29 = "-[ADAudioSessionCoordinator _handleUpdatedRemoteDevice:]";
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.", buf, 0xCu);
    }
  }
LABEL_36:
}

- (void)_handleFoundRemoteDevice:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v29 = "-[ADAudioSessionCoordinator _handleFoundRemoteDevice:]";
    __int16 v30 = 2112;
    id v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s device = %@", buf, 0x16u);
  }
  if ([(AFAudioSessionCoordinationSystemInfo *)self->_localSystemInfo isSupportedAndEnabled])
  {
    id v6 = [v4 identifier];
    id v7 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_19:

      if (v6)
      {
        unsigned int v16 = sub_1002CF998(v4);
        id v17 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          id v29 = "-[ADAudioSessionCoordinator _handleFoundRemoteDevice:]";
          __int16 v30 = 1024;
          LODWORD(v31) = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s deviceIsQualified = %d", buf, 0x12u);
        }
        if (v16)
        {
          int v18 = sub_1002CFF80(v4, self->_localSystemInfo);
          id v19 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            id v29 = "-[ADAudioSessionCoordinator _handleFoundRemoteDevice:]";
            __int16 v30 = 1024;
            LODWORD(v31) = v18;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s deviceIsInRange = %d", buf, 0x12u);
          }
          __int16 v20 = +[NSDate date];
          int EffectiveDateAndExpirationDurationFromDateInterval = AFAssertionGetEffectiveDateAndExpirationDurationFromDateInterval();
          id v22 = 0;

          long long v23 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            id v29 = "-[ADAudioSessionCoordinator _handleFoundRemoteDevice:]";
            __int16 v30 = 1024;
            LODWORD(v31) = EffectiveDateAndExpirationDurationFromDateInterval;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s dateIntervalIsValid = %d", buf, 0x12u);
          }
          if ((v18 & EffectiveDateAndExpirationDurationFromDateInterval) == 1)
          {
            __int16 v24 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315650;
              id v29 = "-[ADAudioSessionCoordinator _handleFoundRemoteDevice:]";
              __int16 v30 = 2112;
              id v31 = v22;
              __int16 v32 = 2048;
              __int16 v33 = 0;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s effectiveDate = %@, expirationDuration = %f", buf, 0x20u);
            }
            long long v25 = [[ADAudioSessionCoordinationMessageBeginAudioSessionRequest alloc] initWithEffectiveDate:v22 expirationDuration:0.0];
            [(ADAudioSessionCoordinator *)self _sendBeginAudioSessionRequest:v25 toDeviceWithID:v6 responseHandler:0];

            [(ADAudioSessionCoordinator *)self _addDeviceIDToKeepAliveList:v6 reason:@"Remote Device Found"];
          }
          else
          {
            [(ADAudioSessionCoordinator *)self _removeDeviceIDFromKeepAliveList:v6 reason:@"Remote Device Found"];
            id v27 = [[ADAudioSessionCoordinationMessageEndAudioSessionRequest alloc] initWithEffectiveDate:0];
            [(ADAudioSessionCoordinator *)self _sendEndAudioSessionRequest:v27 toDeviceWithID:v6 responseHandler:0];
          }
        }
      }
      else
      {
        __int16 v26 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          id v29 = "-[ADAudioSessionCoordinator _handleFoundRemoteDevice:]";
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s Device ID is nil.", buf, 0xCu);
        }
      }

      goto LABEL_36;
    }
    uint64_t v8 = [v4 model];
    uint64_t v9 = [v4 name];
    uint64_t v10 = [v4 roomName];
    v11 = [v4 mediaSystemIdentifier];
    int v12 = [v4 proximity];
    if (v12 > 19)
    {
      if (v12 == 20)
      {
        unsigned int v13 = "Near";
        goto LABEL_18;
      }
      if (v12 == 30)
      {
        unsigned int v13 = "Far";
        goto LABEL_18;
      }
    }
    else
    {
      if (!v12)
      {
        unsigned int v13 = "Unknown";
        goto LABEL_18;
      }
      if (v12 == 10)
      {
        unsigned int v13 = "Immed";
LABEL_18:
        id v15 = sub_1002CF9D0(v4);
        *(_DWORD *)buf = 136316930;
        id v29 = "-[ADAudioSessionCoordinator _handleFoundRemoteDevice:]";
        __int16 v30 = 2112;
        id v31 = v6;
        __int16 v32 = 2112;
        __int16 v33 = v8;
        __int16 v34 = 2112;
        id v35 = v9;
        __int16 v36 = 2112;
        v37 = v10;
        __int16 v38 = 2112;
        v39 = v11;
        __int16 v40 = 2080;
        v41 = v13;
        __int16 v42 = 2112;
        v43 = v15;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s deviceID = %@, model = %@, name = %@, roomName = %@, mediaSystemIdentifier = %@, proximity = %s, systemInfo = %@", buf, 0x52u);

        goto LABEL_19;
      }
    }
    unsigned int v13 = "?";
    goto LABEL_18;
  }
  if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    id v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v29 = "-[ADAudioSessionCoordinator _handleFoundRemoteDevice:]";
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.", buf, 0xCu);
    }
  }
LABEL_36:
}

- (void)_handleUpdatedLocalDevice:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    unsigned int v13 = "-[ADAudioSessionCoordinator _handleUpdatedLocalDevice:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s device = %@", (uint8_t *)&v12, 0x16u);
  }
  id v6 = [v4 roomName];
  id v7 = [v4 mediaSystemIdentifier];
  uint64_t v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = v8;
    uint64_t v10 = [v4 identifier];
    v11 = [v4 model];
    int v12 = 136316162;
    unsigned int v13 = "-[ADAudioSessionCoordinator _handleUpdatedLocalDevice:]";
    __int16 v14 = 2112;
    id v15 = v10;
    __int16 v16 = 2112;
    id v17 = v11;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s deviceID = %@, model = %@, roomName = %@, mediaSystemIdentifier = %@", (uint8_t *)&v12, 0x34u);
  }
  [(ADAudioSessionCoordinator *)self _updateHomeKitRoomName:v6 reason:@"Local Device Updated"];
  [(ADAudioSessionCoordinator *)self _updateHomeKitMediaSystemIdentifier:v7 reason:@"Local Device Updated"];
}

- (void)_handleRelinquishedRemoteAssertion:(id)a3 isLast:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (__CFString *)a3;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315650;
    __int16 v20 = "-[ADAudioSessionCoordinator _handleRelinquishedRemoteAssertion:isLast:]";
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 1024;
    LODWORD(v24) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s assertion = %@, isLast = %d", (uint8_t *)&v19, 0x1Cu);
    id v7 = AFSiriLogContextDaemon;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unint64_t audioSessionState = self->_audioSessionState;
    if (audioSessionState > 3) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = off_10050AEC8[audioSessionState];
    }
    int v19 = 136315394;
    __int16 v20 = "-[ADAudioSessionCoordinator _handleRelinquishedRemoteAssertion:isLast:]";
    __int16 v21 = 2112;
    id v22 = v9;
    uint64_t v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s unint64_t audioSessionState = %@", (uint8_t *)&v19, 0x16u);
  }
  v11 = (__CFString *)[(AFAssertionCoordinator *)self->_localAssertionCoordinator numberOfActiveAssertions];
  int v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    __int16 v20 = "-[ADAudioSessionCoordinator _handleRelinquishedRemoteAssertion:isLast:]";
    __int16 v21 = 2048;
    id v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s numberOfActiveAssertions = %llu (local)", (uint8_t *)&v19, 0x16u);
  }
  unsigned int v13 = (__CFString *)[(AFAssertionCoordinator *)self->_remoteAssertionCoordinator numberOfActiveAssertions];
  __int16 v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    __int16 v20 = "-[ADAudioSessionCoordinator _handleRelinquishedRemoteAssertion:isLast:]";
    __int16 v21 = 2048;
    id v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s numberOfActiveAssertions = %llu (remote)", (uint8_t *)&v19, 0x16u);
  }
  if (v4 && !v11)
  {
    id v15 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      __int16 v16 = v15;
      WeakRetained = (__CFString *)objc_loadWeakRetained((id *)&self->_delegate);
      int v19 = 136315650;
      __int16 v20 = "-[ADAudioSessionCoordinator _handleRelinquishedRemoteAssertion:isLast:]";
      __int16 v21 = 2112;
      id v22 = WeakRetained;
      __int16 v23 = 2112;
      __int16 v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Asking delegate %@ to release audio session because the last remote assertion %@ is relinquished and no local assertion exists.", (uint8_t *)&v19, 0x20u);
    }
    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    [v18 audioSessionCoordinator:self releaseAudioSessionWithContext:0];
  }
}

- (void)_handleAcquiredRemoteAssertion:(id)a3 isFirst:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (__CFString *)a3;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v26 = "-[ADAudioSessionCoordinator _handleAcquiredRemoteAssertion:isFirst:]";
    __int16 v27 = 2112;
    __int16 v28 = v6;
    __int16 v29 = 1024;
    LODWORD(v30) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s assertion = %@, isFirst = %d", buf, 0x1Cu);
    id v7 = AFSiriLogContextDaemon;
  }
  unint64_t audioSessionState = self->_audioSessionState;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (audioSessionState > 3) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = off_10050AEC8[audioSessionState];
    }
    *(_DWORD *)buf = 136315394;
    __int16 v26 = "-[ADAudioSessionCoordinator _handleAcquiredRemoteAssertion:isFirst:]";
    __int16 v27 = 2112;
    __int16 v28 = v9;
    uint64_t v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s unint64_t audioSessionState = %@", buf, 0x16u);
  }
  v11 = (__CFString *)[(AFAssertionCoordinator *)self->_localAssertionCoordinator numberOfActiveAssertions];
  int v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v26 = "-[ADAudioSessionCoordinator _handleAcquiredRemoteAssertion:isFirst:]";
    __int16 v27 = 2048;
    __int16 v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s numberOfActiveAssertions = %llu (local)", buf, 0x16u);
  }
  unsigned int v13 = (__CFString *)[(AFAssertionCoordinator *)self->_remoteAssertionCoordinator numberOfActiveAssertions];
  __int16 v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v26 = "-[ADAudioSessionCoordinator _handleAcquiredRemoteAssertion:isFirst:]";
    __int16 v27 = 2048;
    __int16 v28 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s numberOfActiveAssertions = %llu (remote)", buf, 0x16u);
  }
  id v15 = [(__CFString *)v6 context];
  __int16 v16 = [v15 userInfo];
  id v17 = [v16 objectForKey:AFAudioSessionAssertionUserInfoKey[3]];
  unsigned int v18 = [v17 BOOLValue];

  int v19 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v26 = "-[ADAudioSessionCoordinator _handleAcquiredRemoteAssertion:isFirst:]";
    __int16 v27 = 1024;
    LODWORD(v28) = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s suppressesAudioSessionActivation = %d", buf, 0x12u);
  }
  if ((v18 & 1) == 0)
  {
    BOOL v20 = v4;
    if (v11) {
      BOOL v20 = 0;
    }
    if (v20 || audioSessionState != 3)
    {
      __int16 v21 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        id v22 = v21;
        WeakRetained = (__CFString *)objc_loadWeakRetained((id *)&self->_delegate);
        *(_DWORD *)buf = 136315650;
        __int16 v26 = "-[ADAudioSessionCoordinator _handleAcquiredRemoteAssertion:isFirst:]";
        __int16 v27 = 2112;
        __int16 v28 = WeakRetained;
        __int16 v29 = 2112;
        __int16 v30 = v6;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Asking delegate %@ to prepare audio session because remote assertion %@ is acquired and audio session is not active.", buf, 0x20u);
      }
      id v24 = objc_loadWeakRetained((id *)&self->_delegate);
      [v24 audioSessionCoordinator:self prepareAudioSessionWithContext:0];
    }
  }
}

- (void)_handleUpdatedLocalAssertionsForReason:(id)a3 pendingAssertions:(id)a4 activeAssertions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (char *)[v9 count];
  id v12 = [v10 count];
  unsigned int v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315906;
    __int16 v23 = "-[ADAudioSessionCoordinator _handleUpdatedLocalAssertionsForReason:pendingAssertions:activeAssertions:]";
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2048;
    __int16 v27 = v11;
    __int16 v28 = 2048;
    id v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s reason = %@, numberOfPendingAssertions = %tu, numberOfActiveAssertions = %tu", (uint8_t *)&v22, 0x2Au);
  }
  __int16 v14 = &v11[(void)v12];
  if (v14)
  {
    id v15 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v14];
    if ([v9 count])
    {
      __int16 v16 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        int v22 = 136315394;
        __int16 v23 = "-[ADAudioSessionCoordinator _handleUpdatedLocalAssertionsForReason:pendingAssertions:activeAssertions:]";
        __int16 v24 = 2112;
        id v25 = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s pendingAssertions = %@", (uint8_t *)&v22, 0x16u);
      }
      [v15 addObjectsFromArray:v9];
    }
    if ([v10 count])
    {
      id v17 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        int v22 = 136315394;
        __int16 v23 = "-[ADAudioSessionCoordinator _handleUpdatedLocalAssertionsForReason:pendingAssertions:activeAssertions:]";
        __int16 v24 = 2112;
        id v25 = v10;
        _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s activeAssertions = %@", (uint8_t *)&v22, 0x16u);
      }
      [v15 addObjectsFromArray:v10];
    }
  }
  else
  {
    id v15 = &__NSArray0__struct;
  }
  unsigned int v18 = AFAssertionGetContexts();
  int v19 = +[NSDate date];
  BOOL v20 = AFAssertionGetCurrentOrUpNextDateIntervalFromContexts();

  __int16 v21 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315394;
    __int16 v23 = "-[ADAudioSessionCoordinator _handleUpdatedLocalAssertionsForReason:pendingAssertions:activeAssertions:]";
    __int16 v24 = 2112;
    id v25 = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s currentOrUpNextDateInterval = %@", (uint8_t *)&v22, 0x16u);
  }
  [(ADAudioSessionCoordinator *)self _updateCurrentOrUpNextDateInterval:v20 reason:v8];
}

- (void)_handleRemovedLocalAssertion:(id)a3 isLast:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[ADAudioSessionCoordinator _handleRemovedLocalAssertion:isLast:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s assertion = %@, isLast = %d", buf, 0x1Cu);
  }
  localAssertionCoordinator = self->_localAssertionCoordinator;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002D2620;
  v9[3] = &unk_10050AE30;
  void v9[4] = self;
  [(AFAssertionCoordinator *)localAssertionCoordinator getPendingAndActiveAssertionsWithCompletion:v9];
}

- (void)_handleRelinquishedLocalAssertion:(id)a3 isLast:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (__CFString *)a3;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    int v22 = "-[ADAudioSessionCoordinator _handleRelinquishedLocalAssertion:isLast:]";
    __int16 v23 = 2112;
    __int16 v24 = v6;
    __int16 v25 = 1024;
    LODWORD(v26) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s assertion = %@, isLast = %d", buf, 0x1Cu);
    id v7 = AFSiriLogContextDaemon;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unint64_t audioSessionState = self->_audioSessionState;
    if (audioSessionState > 3) {
      id v9 = 0;
    }
    else {
      id v9 = off_10050AEC8[audioSessionState];
    }
    *(_DWORD *)buf = 136315394;
    int v22 = "-[ADAudioSessionCoordinator _handleRelinquishedLocalAssertion:isLast:]";
    __int16 v23 = 2112;
    __int16 v24 = v9;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s unint64_t audioSessionState = %@", buf, 0x16u);
  }
  v11 = (__CFString *)[(AFAssertionCoordinator *)self->_localAssertionCoordinator numberOfActiveAssertions];
  __int16 v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v22 = "-[ADAudioSessionCoordinator _handleRelinquishedLocalAssertion:isLast:]";
    __int16 v23 = 2048;
    __int16 v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s numberOfActiveAssertions = %llu (local)", buf, 0x16u);
  }
  id v13 = (__CFString *)[(AFAssertionCoordinator *)self->_remoteAssertionCoordinator numberOfActiveAssertions];
  __int16 v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v22 = "-[ADAudioSessionCoordinator _handleRelinquishedLocalAssertion:isLast:]";
    __int16 v23 = 2048;
    __int16 v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s numberOfActiveAssertions = %llu (remote)", buf, 0x16u);
  }
  localAssertionCoordinator = self->_localAssertionCoordinator;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1002D2970;
  v20[3] = &unk_10050AE30;
  void v20[4] = self;
  [(AFAssertionCoordinator *)localAssertionCoordinator getPendingAndActiveAssertionsWithCompletion:v20];
  if (v4 && !v13)
  {
    __int16 v16 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v17 = v16;
      WeakRetained = (__CFString *)objc_loadWeakRetained((id *)&self->_delegate);
      *(_DWORD *)buf = 136315650;
      int v22 = "-[ADAudioSessionCoordinator _handleRelinquishedLocalAssertion:isLast:]";
      __int16 v23 = 2112;
      __int16 v24 = WeakRetained;
      __int16 v25 = 2112;
      __int16 v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Asking delegate %@ to release audio session because the last local assertion %@ is relinquished and no remote assertion exists.", buf, 0x20u);
    }
    id v19 = objc_loadWeakRetained((id *)&self->_delegate);
    [v19 audioSessionCoordinator:self releaseAudioSessionWithContext:0];
  }
}

- (void)_handleAcquiredLocalAssertion:(id)a3 isFirst:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (__CFString *)a3;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v28 = "-[ADAudioSessionCoordinator _handleAcquiredLocalAssertion:isFirst:]";
    __int16 v29 = 2112;
    __int16 v30 = v6;
    __int16 v31 = 1024;
    LODWORD(v32) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s assertion = %@, isFirst = %d", buf, 0x1Cu);
    id v7 = AFSiriLogContextDaemon;
  }
  unint64_t audioSessionState = self->_audioSessionState;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (audioSessionState > 3) {
      id v9 = 0;
    }
    else {
      id v9 = off_10050AEC8[audioSessionState];
    }
    *(_DWORD *)buf = 136315394;
    __int16 v28 = "-[ADAudioSessionCoordinator _handleAcquiredLocalAssertion:isFirst:]";
    __int16 v29 = 2112;
    __int16 v30 = v9;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s unint64_t audioSessionState = %@", buf, 0x16u);
  }
  v11 = (__CFString *)[(AFAssertionCoordinator *)self->_localAssertionCoordinator numberOfActiveAssertions];
  __int16 v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v28 = "-[ADAudioSessionCoordinator _handleAcquiredLocalAssertion:isFirst:]";
    __int16 v29 = 2048;
    __int16 v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s numberOfActiveAssertions = %llu (local)", buf, 0x16u);
  }
  id v13 = (__CFString *)[(AFAssertionCoordinator *)self->_remoteAssertionCoordinator numberOfActiveAssertions];
  __int16 v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v28 = "-[ADAudioSessionCoordinator _handleAcquiredLocalAssertion:isFirst:]";
    __int16 v29 = 2048;
    __int16 v30 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s numberOfActiveAssertions = %llu (remote)", buf, 0x16u);
  }
  BOOL v15 = [(__CFString *)v6 context];
  __int16 v16 = [v15 userInfo];
  id v17 = [v16 objectForKey:AFAudioSessionAssertionUserInfoKey[3]];
  unsigned int v18 = [v17 BOOLValue];

  id v19 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v28 = "-[ADAudioSessionCoordinator _handleAcquiredLocalAssertion:isFirst:]";
    __int16 v29 = 1024;
    LODWORD(v30) = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s suppressesAudioSessionActivation = %d", buf, 0x12u);
  }
  localAssertionCoordinator = self->_localAssertionCoordinator;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1002D2D80;
  v26[3] = &unk_10050AE30;
  void v26[4] = self;
  [(AFAssertionCoordinator *)localAssertionCoordinator getPendingAndActiveAssertionsWithCompletion:v26];
  if ((v18 & 1) == 0)
  {
    BOOL v21 = v4;
    if (v13) {
      BOOL v21 = 0;
    }
    if (v21 || audioSessionState != 3)
    {
      int v22 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        __int16 v23 = v22;
        WeakRetained = (__CFString *)objc_loadWeakRetained((id *)&self->_delegate);
        *(_DWORD *)buf = 136315650;
        __int16 v28 = "-[ADAudioSessionCoordinator _handleAcquiredLocalAssertion:isFirst:]";
        __int16 v29 = 2112;
        __int16 v30 = WeakRetained;
        __int16 v31 = 2112;
        __int16 v32 = v6;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s Asking delegate %@ to prepare audio session because remote assertion %@ is acquired and audio session is not active.", buf, 0x20u);
      }
      id v25 = objc_loadWeakRetained((id *)&self->_delegate);
      [v25 audioSessionCoordinator:self prepareAudioSessionWithContext:0];
    }
  }
}

- (void)_handleAddedLocalAssertion:(id)a3 isFirst:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[ADAudioSessionCoordinator _handleAddedLocalAssertion:isFirst:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s assertion = %@, isFirst = %d", buf, 0x1Cu);
  }
  localAssertionCoordinator = self->_localAssertionCoordinator;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002D2EC8;
  v9[3] = &unk_10050AE30;
  void v9[4] = self;
  [(AFAssertionCoordinator *)localAssertionCoordinator getPendingAndActiveAssertionsWithCompletion:v9];
}

- (void)_heartBeatFired
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    heartBeat = self->_heartBeat;
    *(_DWORD *)buf = 136315394;
    __int16 v14 = "-[ADAudioSessionCoordinator _heartBeatFired]";
    __int16 v15 = 2112;
    __int16 v16 = heartBeat;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s Firing %@...", buf, 0x16u);
  }
  if ([(AFAudioSessionCoordinationSystemInfo *)self->_localSystemInfo isSupportedAndEnabled])
  {
    BOOL v4 = +[NSDate date];
    int EffectiveDateAndExpirationDurationFromDateInterval = AFAssertionGetEffectiveDateAndExpirationDurationFromDateInterval();
    id v6 = 0;

    if (EffectiveDateAndExpirationDurationFromDateInterval)
    {
      [v6 timeIntervalSinceNow];
      double v8 = v7;
      id v9 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        __int16 v14 = "-[ADAudioSessionCoordinator _heartBeatFired]";
        __int16 v15 = 2112;
        __int16 v16 = (AFHeartBeat *)v6;
        __int16 v17 = 2048;
        double v18 = v8;
        __int16 v19 = 2048;
        uint64_t v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s effectiveDate = %@ (%f), expirationDuration = %f", buf, 0x2Au);
        id v9 = AFSiriLogContextDaemon;
      }
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
      if (v8 <= 0.0)
      {
        if (v10)
        {
          *(_DWORD *)buf = 136315138;
          __int16 v14 = "-[ADAudioSessionCoordinator _heartBeatFired]";
          _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Effective date is current or in the past, sending keep-alive request...", buf, 0xCu);
        }
        [(ADAudioSessionCoordinator *)self _keepAudioSessionAliveOnRemoteDevicesForReason:@"Heart Beat", fmin(0.0, 8.0), 0 expirationDuration];
      }
      else if (v10)
      {
        *(_DWORD *)buf = 136315138;
        __int16 v14 = "-[ADAudioSessionCoordinator _heartBeatFired]";
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Effective date is in the future, no need to send keep-alive request.", buf, 0xCu);
      }
    }
  }
  else if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v14 = "-[ADAudioSessionCoordinator _heartBeatFired]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.", buf, 0xCu);
    }
  }
}

- (void)_stopHeartBeat
{
  heartBeat = self->_heartBeat;
  if (heartBeat)
  {
    BOOL v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315394;
      double v7 = "-[ADAudioSessionCoordinator _stopHeartBeat]";
      __int16 v8 = 2112;
      id v9 = heartBeat;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Stopping %@...", (uint8_t *)&v6, 0x16u);
      heartBeat = self->_heartBeat;
    }
    [(AFHeartBeat *)heartBeat invalidate];
    id v5 = self->_heartBeat;
    self->_heartBeat = 0;
  }
}

- (void)_startHeartBeatWithEffectiveDate:(id)a3
{
  id v4 = a3;
  if (!self->_heartBeat)
  {
    id v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v16 = "-[ADAudioSessionCoordinator _startHeartBeatWithEffectiveDate:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    objc_initWeak(&location, self);
    id v6 = objc_alloc((Class)AFHeartBeat);
    queue = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002D34AC;
    v12[3] = &unk_10050ADC8;
    objc_copyWeak(&v13, &location);
    __int16 v8 = (AFHeartBeat *)[v6 initWithIdentifier:@"com.apple.assistant.audio-session-coordination.heart-beat" queue:queue effectiveDate:v4 expirationDuration:v12 heartBeatInterval:&stru_10050AE08 heartBeatHandler:0.0 invalidationHandler:2.0];
    heartBeat = self->_heartBeat;
    self->_heartBeat = v8;

    BOOL v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v11 = self->_heartBeat;
      *(_DWORD *)buf = 136315394;
      __int16 v16 = "-[ADAudioSessionCoordinator _startHeartBeatWithEffectiveDate:]";
      __int16 v17 = 2112;
      double v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Starting %@...", buf, 0x16u);
    }
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)_endAudioSessionOnAllRemoteDevicesForReason:(id)a3 effectiveDate:(id)a4
{
  id v6 = a3;
  double v7 = (NSMutableSet *)a4;
  __int16 v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v29 = "-[ADAudioSessionCoordinator _endAudioSessionOnAllRemoteDevicesForReason:effectiveDate:]";
    __int16 v30 = 2112;
    __int16 v31 = v7;
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s effectiveDate = %@, reason = %@", buf, 0x20u);
  }
  if ([(AFAudioSessionCoordinationSystemInfo *)self->_localSystemInfo isSupportedAndEnabled])
  {
    id v9 = [(ADAudioSessionCoordinator *)self _qualifiedDeviceIDs];
    BOOL v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v29 = "-[ADAudioSessionCoordinator _endAudioSessionOnAllRemoteDevicesForReason:effectiveDate:]";
      __int16 v30 = 2112;
      __int16 v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s qualifiedDeviceIDs = %@", buf, 0x16u);
      BOOL v10 = AFSiriLogContextDaemon;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      keepAliveDeviceIDs = self->_keepAliveDeviceIDs;
      *(_DWORD *)buf = 136315394;
      __int16 v29 = "-[ADAudioSessionCoordinator _endAudioSessionOnAllRemoteDevicesForReason:effectiveDate:]";
      __int16 v30 = 2112;
      __int16 v31 = keepAliveDeviceIDs;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s keepAliveDeviceIDs = %@", buf, 0x16u);
    }
    __int16 v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    if ([(NSMutableSet *)v9 count]) {
      [(NSMutableSet *)v12 unionSet:v9];
    }
    if ([(NSMutableSet *)self->_keepAliveDeviceIDs count]) {
      [(NSMutableSet *)v12 unionSet:self->_keepAliveDeviceIDs];
    }
    int v22 = v9;
    id v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v29 = "-[ADAudioSessionCoordinator _endAudioSessionOnAllRemoteDevicesForReason:effectiveDate:]";
      __int16 v30 = 2112;
      __int16 v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s mergedDeviceIDs = %@", buf, 0x16u);
    }
    [(ADAudioSessionCoordinator *)self _resetKeepAliveListForReason:v6];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    __int16 v14 = v12;
    id v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        double v18 = 0;
        do
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v18);
          uint64_t v20 = [[ADAudioSessionCoordinationMessageEndAudioSessionRequest alloc] initWithEffectiveDate:v7];
          [(ADAudioSessionCoordinator *)self _sendEndAudioSessionRequest:v20 toDeviceWithID:v19 responseHandler:0];

          double v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v16);
    }
  }
  else if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    BOOL v21 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v29 = "-[ADAudioSessionCoordinator _endAudioSessionOnAllRemoteDevicesForReason:effectiveDate:]";
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.", buf, 0xCu);
    }
  }
}

- (void)_endAudioSessionOnOutOfRangeRemoteDevicesForReason:(id)a3 effectiveDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    long long v25 = "-[ADAudioSessionCoordinator _endAudioSessionOnOutOfRangeRemoteDevicesForReason:effectiveDate:]";
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s effectiveDate = %@, reason = %@", buf, 0x20u);
  }
  if ([(AFAudioSessionCoordinationSystemInfo *)self->_localSystemInfo isSupportedAndEnabled])
  {
    id v9 = [(ADAudioSessionCoordinator *)self _qualifiedOutOfRangeDeviceIDs];
    BOOL v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      long long v25 = "-[ADAudioSessionCoordinator _endAudioSessionOnOutOfRangeRemoteDevicesForReason:effectiveDate:]";
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s qualifiedOutOfRangeDeviceIDs = %@", buf, 0x16u);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          -[ADAudioSessionCoordinator _removeDeviceIDFromKeepAliveList:reason:](self, "_removeDeviceIDFromKeepAliveList:reason:", v16, v6, (void)v19);
          uint64_t v17 = [[ADAudioSessionCoordinationMessageEndAudioSessionRequest alloc] initWithEffectiveDate:v7];
          [(ADAudioSessionCoordinator *)self _sendEndAudioSessionRequest:v17 toDeviceWithID:v16 responseHandler:0];
        }
        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
  }
  else if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    double v18 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      long long v25 = "-[ADAudioSessionCoordinator _endAudioSessionOnOutOfRangeRemoteDevicesForReason:effectiveDate:]";
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.", buf, 0xCu);
    }
  }
}

- (void)_keepAudioSessionAliveOnRemoteDevicesForReason:(id)a3 expirationDuration:(double)a4
{
  id v6 = a3;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v13 = "-[ADAudioSessionCoordinator _keepAudioSessionAliveOnRemoteDevicesForReason:expirationDuration:]";
    __int16 v14 = 2048;
    double v15 = a4;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s expirationDuration = %f, reason = %@", buf, 0x20u);
  }
  if ([(AFAudioSessionCoordinationSystemInfo *)self->_localSystemInfo isSupportedAndEnabled])
  {
    __int16 v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      keepAliveDeviceIDs = self->_keepAliveDeviceIDs;
      *(_DWORD *)buf = 136315394;
      id v13 = "-[ADAudioSessionCoordinator _keepAudioSessionAliveOnRemoteDevicesForReason:expirationDuration:]";
      __int16 v14 = 2112;
      double v15 = *(double *)&keepAliveDeviceIDs;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s keepAliveDeviceIDs = %@", buf, 0x16u);
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002D3EA0;
    v11[3] = &unk_10050ADA0;
    v11[4] = self;
    *(double *)&v11[5] = a4;
    [(ADAudioSessionCoordinator *)self _enumerateKeepAliveListUsingBlock:v11];
  }
  else if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    BOOL v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[ADAudioSessionCoordinator _keepAudioSessionAliveOnRemoteDevicesForReason:expirationDuration:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.", buf, 0xCu);
    }
  }
}

- (void)_beginAudioSessionOnInRangeRemoteDevicesForReason:(id)a3 effectiveDate:(id)a4 expirationDuration:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v28 = "-[ADAudioSessionCoordinator _beginAudioSessionOnInRangeRemoteDevicesForReason:effectiveDate:expirationDuration:]";
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2048;
    double v32 = a5;
    __int16 v33 = 2112;
    id v34 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s effectiveDate = %@, expirationDuration = %f, reason = %@", buf, 0x2Au);
  }
  if ([(AFAudioSessionCoordinationSystemInfo *)self->_localSystemInfo isSupportedAndEnabled])
  {
    id v11 = [(ADAudioSessionCoordinator *)self _qualifiedInRangeDeviceIDs];
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v28 = "-[ADAudioSessionCoordinator _beginAudioSessionOnInRangeRemoteDevicesForReason:effectiveDate:expirationDuration:]";
      __int16 v29 = 2112;
      id v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s qualifiedInRangeDeviceIDs = %@", buf, 0x16u);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        id v17 = 0;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v17);
          long long v19 = [ADAudioSessionCoordinationMessageBeginAudioSessionRequest alloc];
          long long v20 = -[ADAudioSessionCoordinationMessageBeginAudioSessionRequest initWithEffectiveDate:expirationDuration:](v19, "initWithEffectiveDate:expirationDuration:", v9, a5, (void)v22);
          [(ADAudioSessionCoordinator *)self _sendBeginAudioSessionRequest:v20 toDeviceWithID:v18 responseHandler:0];

          [(ADAudioSessionCoordinator *)self _addDeviceIDToKeepAliveList:v18 reason:v8];
          id v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }
  }
  else if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    long long v21 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v28 = "-[ADAudioSessionCoordinator _beginAudioSessionOnInRangeRemoteDevicesForReason:effectiveDate:expirationDuration:]";
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.", buf, 0xCu);
    }
  }
}

- (void)_handleUpdatedCurrentOrUpNextDateIntervalForReason:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[ADAudioSessionCoordinator _handleUpdatedCurrentOrUpNextDateIntervalForReason:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s reason = %@", buf, 0x16u);
  }
  [(ADAudioSessionCoordinator *)self _stopHeartBeat];
  if ([(AFAudioSessionCoordinationSystemInfo *)self->_localSystemInfo isSupportedAndEnabled])
  {
    id v6 = +[NSDate date];
    int EffectiveDateAndExpirationDurationFromDateInterval = AFAssertionGetEffectiveDateAndExpirationDurationFromDateInterval();
    id v8 = 0;

    if (EffectiveDateAndExpirationDurationFromDateInterval)
    {
      id v9 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        BOOL v10 = v9;
        [v8 timeIntervalSinceNow];
        *(_DWORD *)buf = 136315906;
        id v14 = "-[ADAudioSessionCoordinator _handleUpdatedCurrentOrUpNextDateIntervalForReason:]";
        __int16 v15 = 2112;
        id v16 = v8;
        __int16 v17 = 2048;
        uint64_t v18 = v11;
        __int16 v19 = 2048;
        uint64_t v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s effectiveDate = %@ (%f), expirationDuration = %f", buf, 0x2Au);
      }
      -[ADAudioSessionCoordinator _beginAudioSessionOnInRangeRemoteDevicesForReason:effectiveDate:expirationDuration:](self, "_beginAudioSessionOnInRangeRemoteDevicesForReason:effectiveDate:expirationDuration:", v4, v8, 0.0, 0);
      [(ADAudioSessionCoordinator *)self _endAudioSessionOnOutOfRangeRemoteDevicesForReason:v4 effectiveDate:0];
      [(ADAudioSessionCoordinator *)self _startHeartBeatWithEffectiveDate:v8];
    }
    else
    {
      [(ADAudioSessionCoordinator *)self _endAudioSessionOnAllRemoteDevicesForReason:v4 effectiveDate:0];
    }
  }
  else if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[ADAudioSessionCoordinator _handleUpdatedCurrentOrUpNextDateIntervalForReason:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.", buf, 0xCu);
    }
  }
}

- (void)_handleUpdatedLocalSystemInfoForReason:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v17 = "-[ADAudioSessionCoordinator _handleUpdatedLocalSystemInfoForReason:]";
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s reason = %@", buf, 0x16u);
  }
  localSystemInfo = self->_localSystemInfo;
  if (localSystemInfo)
  {
    id v7 = [(AFAudioSessionCoordinationSystemInfo *)localSystemInfo buildDictionaryRepresentation];
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v17 = "-[ADAudioSessionCoordinator _handleUpdatedLocalSystemInfoForReason:]";
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Push local system info: %@", buf, 0x16u);
    }
    +[ADRapportLink updateSiriInfoWithObject:v7 forKey:@"audio-session-coordination.system-info"];
  }
  [(ADAudioSessionCoordinator *)self _stopHeartBeat];
  if ([(AFAudioSessionCoordinationSystemInfo *)self->_localSystemInfo isSupportedAndEnabled])
  {
    id v9 = +[NSDate date];
    int EffectiveDateAndExpirationDurationFromDateInterval = AFAssertionGetEffectiveDateAndExpirationDurationFromDateInterval();
    id v11 = 0;

    if (EffectiveDateAndExpirationDurationFromDateInterval)
    {
      id v12 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        id v13 = v12;
        [v11 timeIntervalSinceNow];
        *(_DWORD *)buf = 136315906;
        __int16 v17 = "-[ADAudioSessionCoordinator _handleUpdatedLocalSystemInfoForReason:]";
        __int16 v18 = 2112;
        id v19 = v11;
        __int16 v20 = 2048;
        uint64_t v21 = v14;
        __int16 v22 = 2048;
        uint64_t v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s effectiveDate = %@ (%f), expirationDuration = %f", buf, 0x2Au);
      }
      -[ADAudioSessionCoordinator _beginAudioSessionOnInRangeRemoteDevicesForReason:effectiveDate:expirationDuration:](self, "_beginAudioSessionOnInRangeRemoteDevicesForReason:effectiveDate:expirationDuration:", v4, v11, 0.0, 0);
      [(ADAudioSessionCoordinator *)self _endAudioSessionOnOutOfRangeRemoteDevicesForReason:v4 effectiveDate:0];
      [(ADAudioSessionCoordinator *)self _startHeartBeatWithEffectiveDate:v11];
    }
    else
    {
      [(ADAudioSessionCoordinator *)self _endAudioSessionOnAllRemoteDevicesForReason:v4 effectiveDate:0];
    }
  }
  else if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    __int16 v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v17 = "-[ADAudioSessionCoordinator _handleUpdatedLocalSystemInfoForReason:]";
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.", buf, 0xCu);
    }
  }
}

- (void)_updateCurrentOrUpNextDateInterval:(id)a3 reason:(id)a4
{
  id v6 = (NSDateInterval *)a3;
  id v7 = (NSDateInterval *)a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315650;
    __int16 v15 = "-[ADAudioSessionCoordinator _updateCurrentOrUpNextDateInterval:reason:]";
    __int16 v16 = 2112;
    __int16 v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s currentOrUpNextDateInterval = %@, reason = %@", (uint8_t *)&v14, 0x20u);
  }
  currentOrUpNextDateInterval = self->_currentOrUpNextDateInterval;
  if (currentOrUpNextDateInterval != v6
    && ![(NSDateInterval *)currentOrUpNextDateInterval isEqualToDateInterval:v6])
  {
    BOOL v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v11 = self->_currentOrUpNextDateInterval;
      int v14 = 136315650;
      __int16 v15 = "-[ADAudioSessionCoordinator _updateCurrentOrUpNextDateInterval:reason:]";
      __int16 v16 = 2112;
      __int16 v17 = v11;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s currentOrUpNextDateInterval: %@ -> %@", (uint8_t *)&v14, 0x20u);
    }
    id v12 = (NSDateInterval *)[(NSDateInterval *)v6 copy];
    id v13 = self->_currentOrUpNextDateInterval;
    self->_currentOrUpNextDateInterval = v12;

    [(ADAudioSessionCoordinator *)self _handleUpdatedCurrentOrUpNextDateIntervalForReason:v7];
  }
}

- (void)_updateMediaRemoteRouteIdentifier:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v18 = "-[ADAudioSessionCoordinator _updateMediaRemoteRouteIdentifier:reason:]";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s mediaRemoteRouteIdentifier = %@, reason = %@", buf, 0x20u);
  }
  id v9 = [(AFAudioSessionCoordinationSystemInfo *)self->_localSystemInfo mediaRemoteRouteIdentifier];
  BOOL v10 = v9;
  if (v9 != v6 && ([v9 isEqual:v6] & 1) == 0)
  {
    id v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v18 = "-[ADAudioSessionCoordinator _updateMediaRemoteRouteIdentifier:reason:]";
      __int16 v19 = 2112;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s mediaRemoteRouteIdentifier: %@ -> %@", buf, 0x20u);
    }
    localSystemInfo = self->_localSystemInfo;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1002D4ACC;
    v15[3] = &unk_10050AD78;
    id v16 = v6;
    id v13 = [(AFAudioSessionCoordinationSystemInfo *)localSystemInfo mutatedCopyWithMutator:v15];
    int v14 = self->_localSystemInfo;
    self->_localSystemInfo = v13;

    [(ADAudioSessionCoordinator *)self _handleUpdatedLocalSystemInfoForReason:v7];
  }
}

- (void)_updateMediaRemoteGroupIdentifier:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v18 = "-[ADAudioSessionCoordinator _updateMediaRemoteGroupIdentifier:reason:]";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s mediaRemoteGroupIdentifier = %@, reason = %@", buf, 0x20u);
  }
  id v9 = [(AFAudioSessionCoordinationSystemInfo *)self->_localSystemInfo mediaRemoteGroupIdentifier];
  BOOL v10 = v9;
  if (v9 != v6 && ([v9 isEqual:v6] & 1) == 0)
  {
    id v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v18 = "-[ADAudioSessionCoordinator _updateMediaRemoteGroupIdentifier:reason:]";
      __int16 v19 = 2112;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s mediaRemoteGroupIdentifier: %@ -> %@", buf, 0x20u);
    }
    localSystemInfo = self->_localSystemInfo;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1002D4CD4;
    v15[3] = &unk_10050AD78;
    id v16 = v6;
    id v13 = [(AFAudioSessionCoordinationSystemInfo *)localSystemInfo mutatedCopyWithMutator:v15];
    int v14 = self->_localSystemInfo;
    self->_localSystemInfo = v13;

    [(ADAudioSessionCoordinator *)self _handleUpdatedLocalSystemInfoForReason:v7];
  }
}

- (void)_updateHomeKitMediaSystemIdentifier:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v18 = "-[ADAudioSessionCoordinator _updateHomeKitMediaSystemIdentifier:reason:]";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s mediaSystemIdentifier = %@, reason = %@", buf, 0x20u);
  }
  id v9 = [(AFAudioSessionCoordinationSystemInfo *)self->_localSystemInfo homeKitMediaSystemIdentifier];
  BOOL v10 = v9;
  if (v9 != v6 && ([v9 isEqual:v6] & 1) == 0)
  {
    id v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v18 = "-[ADAudioSessionCoordinator _updateHomeKitMediaSystemIdentifier:reason:]";
      __int16 v19 = 2112;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s mediaSystemIdentifier: %@ -> %@", buf, 0x20u);
    }
    localSystemInfo = self->_localSystemInfo;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1002D4EDC;
    v15[3] = &unk_10050AD78;
    id v16 = v6;
    id v13 = [(AFAudioSessionCoordinationSystemInfo *)localSystemInfo mutatedCopyWithMutator:v15];
    int v14 = self->_localSystemInfo;
    self->_localSystemInfo = v13;

    [(ADAudioSessionCoordinator *)self _handleUpdatedLocalSystemInfoForReason:v7];
  }
}

- (void)_updateHomeKitRoomName:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v18 = "-[ADAudioSessionCoordinator _updateHomeKitRoomName:reason:]";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s roomName = %@, reason = %@", buf, 0x20u);
  }
  id v9 = [(AFAudioSessionCoordinationSystemInfo *)self->_localSystemInfo homeKitRoomName];
  BOOL v10 = v9;
  if (v9 != v6 && ([v9 isEqual:v6] & 1) == 0)
  {
    id v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v18 = "-[ADAudioSessionCoordinator _updateHomeKitRoomName:reason:]";
      __int16 v19 = 2112;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s roomName: %@ -> %@", buf, 0x20u);
    }
    localSystemInfo = self->_localSystemInfo;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1002D50E4;
    v15[3] = &unk_10050AD78;
    id v16 = v6;
    id v13 = [(AFAudioSessionCoordinationSystemInfo *)localSystemInfo mutatedCopyWithMutator:v15];
    int v14 = self->_localSystemInfo;
    self->_localSystemInfo = v13;

    [(ADAudioSessionCoordinator *)self _handleUpdatedLocalSystemInfoForReason:v7];
  }
}

- (void)_handleDidSetAudioSessionActive:(BOOL)a3
{
  if (a3) {
    unint64_t v3 = 3;
  }
  else {
    unint64_t v3 = 0;
  }
  self->_unint64_t audioSessionState = v3;
  id v4 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v5 = off_10050AEC8[v3];
    int v7 = 136315394;
    id v8 = "-[ADAudioSessionCoordinator _handleDidSetAudioSessionActive:]";
    __int16 v9 = 2112;
    BOOL v10 = v5;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s unint64_t audioSessionState = %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_handleWillSetAudioSessionActive:(BOOL)a3
{
  unint64_t audioSessionState = self->_audioSessionState;
  if (a3)
  {
    if (audioSessionState != 3)
    {
      self->_unint64_t audioSessionState = 2;
      id v4 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v7 = 136315394;
        id v8 = "-[ADAudioSessionCoordinator _handleWillSetAudioSessionActive:]";
        __int16 v9 = 2112;
        CFStringRef v10 = @"going active";
        id v5 = v4;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s unint64_t audioSessionState = %@", (uint8_t *)&v7, 0x16u);
      }
    }
  }
  else if (audioSessionState)
  {
    self->_unint64_t audioSessionState = 1;
    id v6 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      id v8 = "-[ADAudioSessionCoordinator _handleWillSetAudioSessionActive:]";
      __int16 v9 = 2112;
      CFStringRef v10 = @"going inactive";
      id v5 = v6;
      goto LABEL_8;
    }
  }
}

- (void)_enumerateKeepAliveListUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    keepAliveDeviceIDs = self->_keepAliveDeviceIDs;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002D53B8;
    v7[3] = &unk_10050AD50;
    id v8 = v4;
    [(NSMutableSet *)keepAliveDeviceIDs enumerateObjectsUsingBlock:v7];
  }
}

- (void)_resetKeepAliveListForReason:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    __int16 v9 = "-[ADAudioSessionCoordinator _resetKeepAliveListForReason:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s reason = %@", (uint8_t *)&v8, 0x16u);
  }
  keepAliveDeviceIDs = self->_keepAliveDeviceIDs;
  self->_keepAliveDeviceIDs = 0;

  int v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    __int16 v9 = "-[ADAudioSessionCoordinator _resetKeepAliveListForReason:]";
    __int16 v10 = 2112;
    id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s keepAliveDeviceIDs = %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_removeDeviceIDFromKeepAliveList:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    id v12 = "-[ADAudioSessionCoordinator _removeDeviceIDFromKeepAliveList:reason:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s deviceID = %@, reason = %@", (uint8_t *)&v11, 0x20u);
  }
  if ([(NSMutableSet *)self->_keepAliveDeviceIDs containsObject:v6])
  {
    [(NSMutableSet *)self->_keepAliveDeviceIDs removeObject:v6];
    __int16 v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      id v12 = "-[ADAudioSessionCoordinator _removeDeviceIDFromKeepAliveList:reason:]";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s keepAliveDeviceIDs -= %@", (uint8_t *)&v11, 0x16u);
    }
    if (![(NSMutableSet *)self->_keepAliveDeviceIDs count])
    {
      keepAliveDeviceIDs = self->_keepAliveDeviceIDs;
      self->_keepAliveDeviceIDs = 0;
    }
  }
}

- (void)_addDeviceIDToKeepAliveList:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    id v14 = "-[ADAudioSessionCoordinator _addDeviceIDToKeepAliveList:reason:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s deviceID = %@, reason = %@", (uint8_t *)&v13, 0x20u);
  }
  if (([(NSMutableSet *)self->_keepAliveDeviceIDs containsObject:v6] & 1) == 0)
  {
    keepAliveDeviceIDs = self->_keepAliveDeviceIDs;
    if (!keepAliveDeviceIDs)
    {
      __int16 v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      int v11 = self->_keepAliveDeviceIDs;
      self->_keepAliveDeviceIDs = v10;

      keepAliveDeviceIDs = self->_keepAliveDeviceIDs;
    }
    [(NSMutableSet *)keepAliveDeviceIDs addObject:v6];
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      id v14 = "-[ADAudioSessionCoordinator _addDeviceIDToKeepAliveList:reason:]";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s keepAliveDeviceIDs += %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)_invalidate
{
  unint64_t v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    __int16 v9 = "-[ADAudioSessionCoordinator _invalidate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  localSystemInfo = self->_localSystemInfo;
  self->_localSystemInfo = 0;

  [(ADAudioSessionCoordinator *)self _updateCurrentOrUpNextDateInterval:0 reason:@"Invalidation"];
  [(ADAudioSessionCoordinator *)self _endAudioSessionOnAllRemoteDevicesForReason:@"Invalidation" effectiveDate:0];
  [(ADAudioSessionCoordinator *)self _resetKeepAliveListForReason:@"Invalidation"];
  [(ADAudioSessionCoordinator *)self _stopHeartBeat];
  [(ADAudioSessionCoordinator *)self _tearDownRequestHandlers];
  [(ADRapportLink *)self->_rapportLink invalidate];
  rapportLink = self->_rapportLink;
  self->_rapportLink = 0;

  [(AFAssertionCoordinator *)self->_localAssertionCoordinator invalidate];
  localAssertionCoordinator = self->_localAssertionCoordinator;
  self->_localAssertionCoordinator = 0;

  [(AFAssertionCoordinator *)self->_remoteAssertionCoordinator invalidate];
  remoteAssertionCoordinator = self->_remoteAssertionCoordinator;
  self->_remoteAssertionCoordinator = 0;
}

- (void)mediaRemoteDeviceInfoGroupIdentifierDidChange:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[ADAudioSessionCoordinator mediaRemoteDeviceInfoGroupIdentifierDidChange:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s notification = %@", buf, 0x16u);
  }
  queue = self->_queue;
  int v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  __int16 v10 = sub_1002D5A74;
  int v11 = &unk_10050E160;
  id v12 = v4;
  int v13 = self;
  id v7 = v4;
  dispatch_async(queue, &v8);
  [(ADAudioSessionCoordinator *)self fetchAndUpdateMediaRemoteGroupIdentifierForReason:@"Notification", v8, v9, v10, v11];
}

- (void)mediaRemoteDeviceInfoRouteIdentifierDidChange:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[ADAudioSessionCoordinator mediaRemoteDeviceInfoRouteIdentifierDidChange:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s notification = %@", buf, 0x16u);
  }
  queue = self->_queue;
  int v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  __int16 v10 = sub_1002D5C70;
  int v11 = &unk_10050E160;
  id v12 = v4;
  int v13 = self;
  id v7 = v4;
  dispatch_async(queue, &v8);
  [(ADAudioSessionCoordinator *)self fetchAndUpdateMediaRemoteRouteIdentifierForReason:@"Notification", v8, v9, v10, v11];
}

- (void)rapportLinkDidInvalidate:(id)a3
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    int v8 = "-[ADAudioSessionCoordinator rapportLinkDidInvalidate:]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002D5E2C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)rapportLinkDidInterrupt:(id)a3
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    int v8 = "-[ADAudioSessionCoordinator rapportLinkDidInterrupt:]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002D5F3C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_resetRapportLinkAndReconnectNow:(BOOL)a3
{
  BOOL v3 = a3;
  [(ADRapportLink *)self->_rapportLink removeListener:self];
  [(ADAudioSessionCoordinator *)self _tearDownRequestHandlers];
  [(ADRapportLink *)self->_rapportLink invalidate];
  rapportLink = self->_rapportLink;
  self->_rapportLink = 0;

  if (v3)
  {
    [(ADAudioSessionCoordinator *)self _setUpRapportLink];
  }
  else
  {
    dispatch_time_t v6 = dispatch_time(0, 20000000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002D602C;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_after(v6, queue, block);
  }
}

- (void)rapportLink:(id)a3 didLoseDevice:(id)a4
{
  id v5 = a4;
  dispatch_time_t v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[ADAudioSessionCoordinator rapportLink:didLoseDevice:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s device = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002D6174;
  v9[3] = &unk_10050E160;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)rapportLink:(id)a3 didUpdateDevice:(id)a4 changes:(unsigned int)a5
{
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[ADAudioSessionCoordinator rapportLink:didUpdateDevice:changes:]";
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s device = %@, changes = %llu", buf, 0x20u);
  }
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002D62C8;
  v11[3] = &unk_10050E160;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(queue, v11);
}

- (void)rapportLink:(id)a3 didFindDevice:(id)a4
{
  id v5 = a4;
  dispatch_time_t v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[ADAudioSessionCoordinator rapportLink:didFindDevice:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s device = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002D6408;
  v9[3] = &unk_10050E160;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4
{
  id v5 = a4;
  dispatch_time_t v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[ADAudioSessionCoordinator rapportLink:didUpdateLocalDevice:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s localDevice = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002D6548;
  v9[3] = &unk_10050E160;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)assertionCoordinator:(id)a3 didRemoveAssertion:(id)a4 isLastAssertion:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (AFAssertionCoordinator *)a3;
  id v9 = a4;
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v33 = "-[ADAudioSessionCoordinator assertionCoordinator:didRemoveAssertion:isLastAssertion:]";
    __int16 v34 = 2112;
    id v35 = v8;
    __int16 v36 = 2112;
    id v37 = v9;
    __int16 v38 = 1024;
    BOOL v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s assertionCoordinator = %@, assertion = %@, isLastAssertion = %d", buf, 0x26u);
  }
  localAssertionCoordinator = self->_localAssertionCoordinator;
  if (localAssertionCoordinator == v8)
  {
    id v12 = +[AFAnalytics sharedAnalytics];
    if (v5) {
      __int16 v17 = &__kCFBooleanTrue;
    }
    else {
      __int16 v17 = &__kCFBooleanFalse;
    }
    CFStringRef v30 = @"isLast";
    __int16 v31 = v17;
    id v14 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    __int16 v15 = v12;
    uint64_t v16 = 251;
  }
  else
  {
    if (self->_remoteAssertionCoordinator != v8) {
      goto LABEL_14;
    }
    id v12 = +[AFAnalytics sharedAnalytics];
    if (v5) {
      __int16 v13 = &__kCFBooleanTrue;
    }
    else {
      __int16 v13 = &__kCFBooleanFalse;
    }
    CFStringRef v28 = @"isLast";
    __int16 v29 = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    __int16 v15 = v12;
    uint64_t v16 = 255;
  }
  [v15 logEventWithType:v16 context:v14 contextNoCopy:1];

  localAssertionCoordinator = self->_localAssertionCoordinator;
LABEL_14:
  if (localAssertionCoordinator == v8)
  {
    [(ADAudioSessionCoordinator *)self _handleRemovedLocalAssertion:v9 isLast:v5];
    if (!v5) {
      goto LABEL_24;
    }
  }
  else if (!v5)
  {
    goto LABEL_24;
  }
  if (![(AFAssertionCoordinator *)self->_localAssertionCoordinator numberOfPendingAndActiveAssertions]&& ![(AFAssertionCoordinator *)self->_remoteAssertionCoordinator numberOfPendingAndActiveAssertions])
  {
    int v18 = AFSupportsAudioSessionCoordination();
    if (v18 != [(AFAudioSessionCoordinationSystemInfo *)self->_localSystemInfo isSupportedAndEnabled])
    {
      localSystemInfo = self->_localSystemInfo;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1002D687C;
      v26[3] = &unk_10050AD28;
      char v27 = v18;
      id v20 = [(AFAudioSessionCoordinationSystemInfo *)localSystemInfo mutatedCopyWithMutator:v26];
      __int16 v21 = self->_localSystemInfo;
      self->_localSystemInfo = v20;

      id v22 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = self->_localSystemInfo;
        long long v24 = v22;
        unsigned int v25 = [(AFAudioSessionCoordinationSystemInfo *)v23 isSupportedAndEnabled];
        *(_DWORD *)buf = 136315394;
        __int16 v33 = "-[ADAudioSessionCoordinator assertionCoordinator:didRemoveAssertion:isLastAssertion:]";
        __int16 v34 = 1024;
        LODWORD(v35) = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s isSupportedAndEnabled = %d (updated)", buf, 0x12u);
      }
    }
    self->_hasLoggedAudioSessionCoordinationDisablement = 0;
  }
LABEL_24:
}

- (void)assertionCoordinator:(id)a3 didDeactivateAssertion:(id)a4 isLastAssertion:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (AFAssertionCoordinator *)a3;
  id v9 = a4;
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    unsigned int v25 = "-[ADAudioSessionCoordinator assertionCoordinator:didDeactivateAssertion:isLastAssertion:]";
    __int16 v26 = 2112;
    char v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 1024;
    BOOL v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s assertionCoordinator = %@, assertion = %@, isLastAssertion = %d", buf, 0x26u);
  }
  localAssertionCoordinator = self->_localAssertionCoordinator;
  if (localAssertionCoordinator == v8)
  {
    id v12 = +[AFAnalytics sharedAnalytics];
    if (v5) {
      __int16 v17 = &__kCFBooleanTrue;
    }
    else {
      __int16 v17 = &__kCFBooleanFalse;
    }
    CFStringRef v22 = @"isLast";
    uint64_t v23 = v17;
    id v14 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    __int16 v15 = v12;
    uint64_t v16 = 250;
  }
  else
  {
    if (self->_remoteAssertionCoordinator != v8) {
      goto LABEL_14;
    }
    id v12 = +[AFAnalytics sharedAnalytics];
    if (v5) {
      __int16 v13 = &__kCFBooleanTrue;
    }
    else {
      __int16 v13 = &__kCFBooleanFalse;
    }
    CFStringRef v20 = @"isLast";
    __int16 v21 = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    __int16 v15 = v12;
    uint64_t v16 = 254;
  }
  [v15 logEventWithType:v16 context:v14 contextNoCopy:1];

  localAssertionCoordinator = self->_localAssertionCoordinator;
LABEL_14:
  id v18 = [(AFAssertionCoordinator *)localAssertionCoordinator numberOfActiveAssertions];
  if (!((char *)[(AFAssertionCoordinator *)self->_remoteAssertionCoordinator numberOfActiveAssertions]+ (void)v18))
  {
    __int16 v19 = +[AFAnalytics sharedAnalytics];
    [v19 logEventWithType:257 context:0 contextNoCopy:0];
  }
  if (self->_localAssertionCoordinator == v8)
  {
    [(ADAudioSessionCoordinator *)self _handleRelinquishedLocalAssertion:v9 isLast:v5];
  }
  else if (self->_remoteAssertionCoordinator == v8)
  {
    [(ADAudioSessionCoordinator *)self _handleRelinquishedRemoteAssertion:v9 isLast:v5];
  }
}

- (void)assertionCoordinator:(id)a3 didActivateAssertion:(id)a4 isFirstAssertion:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (AFAssertionCoordinator *)a3;
  id v9 = a4;
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    unsigned int v25 = "-[ADAudioSessionCoordinator assertionCoordinator:didActivateAssertion:isFirstAssertion:]";
    __int16 v26 = 2112;
    char v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 1024;
    BOOL v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s assertionCoordinator = %@, assertion = %@, isFirstAssertion = %d", buf, 0x26u);
  }
  localAssertionCoordinator = self->_localAssertionCoordinator;
  if (localAssertionCoordinator == v8)
  {
    id v12 = +[AFAnalytics sharedAnalytics];
    if (v5) {
      __int16 v17 = &__kCFBooleanTrue;
    }
    else {
      __int16 v17 = &__kCFBooleanFalse;
    }
    CFStringRef v22 = @"isFirst";
    uint64_t v23 = v17;
    id v14 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    __int16 v15 = v12;
    uint64_t v16 = 249;
  }
  else
  {
    if (self->_remoteAssertionCoordinator != v8) {
      goto LABEL_14;
    }
    id v12 = +[AFAnalytics sharedAnalytics];
    if (v5) {
      __int16 v13 = &__kCFBooleanTrue;
    }
    else {
      __int16 v13 = &__kCFBooleanFalse;
    }
    CFStringRef v20 = @"isFirst";
    __int16 v21 = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    __int16 v15 = v12;
    uint64_t v16 = 253;
  }
  [v15 logEventWithType:v16 context:v14 contextNoCopy:1];

  localAssertionCoordinator = self->_localAssertionCoordinator;
LABEL_14:
  id v18 = (char *)[(AFAssertionCoordinator *)localAssertionCoordinator numberOfActiveAssertions];
  if (&v18[(void)[(AFAssertionCoordinator *)self->_remoteAssertionCoordinator numberOfActiveAssertions]] == (char *)1)
  {
    __int16 v19 = +[AFAnalytics sharedAnalytics];
    [v19 logEventWithType:256 context:0 contextNoCopy:0];
  }
  if (self->_localAssertionCoordinator == v8)
  {
    [(ADAudioSessionCoordinator *)self _handleAcquiredLocalAssertion:v9 isFirst:v5];
  }
  else if (self->_remoteAssertionCoordinator == v8)
  {
    [(ADAudioSessionCoordinator *)self _handleAcquiredRemoteAssertion:v9 isFirst:v5];
  }
}

- (void)assertionCoordinator:(id)a3 didAddAssertion:(id)a4 isFirstAssertion:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (AFAssertionCoordinator *)a3;
  id v9 = a4;
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v23 = "-[ADAudioSessionCoordinator assertionCoordinator:didAddAssertion:isFirstAssertion:]";
    __int16 v24 = 2112;
    unsigned int v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 1024;
    BOOL v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s assertionCoordinator = %@, assertion = %@, isFirstAssertion = %d", buf, 0x26u);
  }
  localAssertionCoordinator = self->_localAssertionCoordinator;
  if (localAssertionCoordinator == v8)
  {
    id v12 = +[AFAnalytics sharedAnalytics];
    if (v5) {
      __int16 v17 = &__kCFBooleanTrue;
    }
    else {
      __int16 v17 = &__kCFBooleanFalse;
    }
    CFStringRef v20 = @"isFirst";
    __int16 v21 = v17;
    id v14 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    __int16 v15 = v12;
    uint64_t v16 = 248;
  }
  else
  {
    if (self->_remoteAssertionCoordinator != v8) {
      goto LABEL_14;
    }
    id v12 = +[AFAnalytics sharedAnalytics];
    if (v5) {
      __int16 v13 = &__kCFBooleanTrue;
    }
    else {
      __int16 v13 = &__kCFBooleanFalse;
    }
    CFStringRef v18 = @"isFirst";
    __int16 v19 = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    __int16 v15 = v12;
    uint64_t v16 = 252;
  }
  [v15 logEventWithType:v16 context:v14 contextNoCopy:1];

  localAssertionCoordinator = self->_localAssertionCoordinator;
LABEL_14:
  if (localAssertionCoordinator == v8) {
    [(ADAudioSessionCoordinator *)self _handleAddedLocalAssertion:v9 isFirst:v5];
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002D6FE0;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)fetchAndUpdateMediaRemoteGroupIdentifierForReason:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v13 = "-[ADAudioSessionCoordinator fetchAndUpdateMediaRemoteGroupIdentifierForReason:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s reason = %@", buf, 0x16u);
  }
  uint64_t v6 = mach_absolute_time();
  id v7 = +[AFMediaRemoteDeviceInfo currentDevice];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002D713C;
  v9[3] = &unk_10050AD08;
  id v10 = v4;
  uint64_t v11 = v6;
  void v9[4] = self;
  id v8 = v4;
  [v7 getGroupIdentifierWithCompletion:v9];
}

- (void)fetchAndUpdateMediaRemoteRouteIdentifierForReason:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v13 = "-[ADAudioSessionCoordinator fetchAndUpdateMediaRemoteRouteIdentifierForReason:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s reason = %@", buf, 0x16u);
  }
  uint64_t v6 = mach_absolute_time();
  id v7 = +[AFMediaRemoteDeviceInfo currentDevice];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002D7414;
  v9[3] = &unk_10050AD08;
  id v10 = v4;
  uint64_t v11 = v6;
  void v9[4] = self;
  id v8 = v4;
  [v7 getRouteIdentifierWithCompletion:v9];
}

- (BOOL)_relinquishRemoteAssertionForSenderID:(id)a3 reason:(id)a4 effectiveDate:(id)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v12 = a5;
  __int16 v13 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    __int16 v14 = v13;
    [v12 timeIntervalSinceNow];
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "-[ADAudioSessionCoordinator _relinquishRemoteAssertionForSenderID:reason:effectiveDate:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    BOOL v39 = v11;
    *(_WORD *)__int16 v40 = 2112;
    *(void *)&v40[2] = v12;
    *(_WORD *)&v40[10] = 2048;
    *(void *)&v40[12] = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s senderID = %@, reason = %@, effectiveDate = %@ (%f seconds)", buf, 0x34u);
  }
  if (([(AFAudioSessionCoordinationSystemInfo *)self->_localSystemInfo isSupportedAndEnabled] & 1) == 0)
  {
    if (!self->_hasLoggedAudioSessionCoordinationDisablement
      && (self->_hasLoggedAudioSessionCoordinationDisablement = 1,
          __int16 v26 = AFSiriLogContextDaemon,
          os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ADAudioSessionCoordinator _relinquishRemoteAssertionForSenderID:reason:effectiveDate:error:]";
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.", buf, 0xCu);
      if (!a6) {
        goto LABEL_19;
      }
    }
    else if (!a6)
    {
      goto LABEL_19;
    }
    id v27 = +[AFError errorWithCode:1901];
LABEL_15:
    BOOL v28 = 0;
    *a6 = v27;
    goto LABEL_20;
  }
  if (!v10)
  {
    if (a6)
    {
      id v27 = +[AFError errorWithCode:1907 description:@"Sender ID is nil."];
      goto LABEL_15;
    }
LABEL_19:
    BOOL v28 = 0;
    goto LABEL_20;
  }
  uint64_t v16 = mach_absolute_time();
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1002D79FC;
  v33[3] = &unk_10050D7A0;
  v33[4] = self;
  id v17 = v10;
  id v34 = v17;
  uint64_t v37 = v16;
  id v18 = v12;
  id v35 = v18;
  __int16 v36 = v11;
  __int16 v19 = objc_retainBlock(v33);
  [v18 timeIntervalSinceNow];
  double v21 = v20;
  if (v20 <= 0.0)
  {
    ((void (*)(void *))v19[2])(v19);
  }
  else
  {
    CFStringRef v22 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[ADAudioSessionCoordinator _relinquishRemoteAssertionForSenderID:reason:effectiveDate:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2048;
      BOOL v39 = *(uint64_t (**)(uint64_t, uint64_t))&v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Remote assertions from %@ will be relinquished in %f seconds.", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    BOOL v39 = sub_1002D7B40;
    *(void *)__int16 v40 = sub_1002D7B50;
    *(void *)&v40[8] = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    uint64_t v23 = *(NSObject **)(*(void *)&buf[8] + 40);
    dispatch_time_t v24 = AFDispatchTimeGetFromDateAndOffset();
    dispatch_source_set_timer(v23, v24, 0xFFFFFFFFFFFFFFFFLL, 0);
    unsigned int v25 = *(NSObject **)(*(void *)&buf[8] + 40);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1002D7B58;
    handler[3] = &unk_10050CA58;
    BOOL v31 = v19;
    double v32 = buf;
    dispatch_source_set_event_handler(v25, handler);
    dispatch_resume(*(dispatch_object_t *)(*(void *)&buf[8] + 40));

    _Block_object_dispose(buf, 8);
  }

  BOOL v28 = 1;
LABEL_20:

  return v28;
}

- (id)_acquireRemoteAssertionForSenderID:(id)a3 reason:(id)a4 effectiveDate:(id)a5 expirationDuration:(double)a6 error:(id *)a7
{
  id v12 = a3;
  v54 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v13 = a5;
  if (a7) {
    *a7 = 0;
  }
  __int16 v14 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v14;
    [v13 timeIntervalSinceNow];
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = "-[ADAudioSessionCoordinator _acquireRemoteAssertionForSenderID:reason:effectiveDate:expirationDuration:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v82 = v54;
    *(_WORD *)v83 = 2112;
    *(void *)&v83[2] = v13;
    *(_WORD *)&v83[10] = 2048;
    *(void *)&v83[12] = v16;
    __int16 v84 = 2048;
    double v85 = a6;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s senderID = %@, reason = %@, effectiveDate = %@ (%f seconds), expirationDuration = %f", buf, 0x3Eu);
  }
  if (([(AFAudioSessionCoordinationSystemInfo *)self->_localSystemInfo isSupportedAndEnabled] & 1) == 0)
  {
    if (!self->_hasLoggedAudioSessionCoordinationDisablement
      && (self->_hasLoggedAudioSessionCoordinationDisablement = 1,
          id v27 = AFSiriLogContextDaemon,
          os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ADAudioSessionCoordinator _acquireRemoteAssertionForSenderID:reason:effectiveDate:expiratio"
                           "nDuration:error:]";
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.", buf, 0xCu);
      if (!a7) {
        goto LABEL_43;
      }
    }
    else if (!a7)
    {
      goto LABEL_43;
    }
    id v28 = +[AFError errorWithCode:1901];
LABEL_24:
    id v29 = 0;
    *a7 = v28;
    goto LABEL_44;
  }
  if (!v12)
  {
    if (a7)
    {
      id v28 = +[AFError errorWithCode:1906 description:@"Sender ID is nil."];
      goto LABEL_24;
    }
LABEL_43:
    id v29 = 0;
    goto LABEL_44;
  }
  uint64_t v53 = mach_absolute_time();
  if (AFIsInternalInstall())
  {
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v17 = [(ADRapportLink *)self->_rapportLink activeDevices];
    id v18 = [v17 countByEnumeratingWithState:&v72 objects:v80 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v73;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v73 != v19) {
            objc_enumerationMutation(v17);
          }
          double v21 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          CFStringRef v22 = objc_msgSend(v21, "identifier", v53);
          unsigned __int8 v23 = [v22 isEqual:v12];

          if ((v23 & 1) == 0)
          {
            dispatch_time_t v24 = [v21 effectiveIdentifier];
            unsigned __int8 v25 = [v24 isEqual:v12];

            if ((v25 & 1) == 0) {
              continue;
            }
          }
          __int16 v26 = [v21 name];
          goto LABEL_28;
        }
        id v18 = [v17 countByEnumeratingWithState:&v72 objects:v80 count:16];
        __int16 v26 = 0;
        if (v18) {
          continue;
        }
        break;
      }
    }
    else
    {
      __int16 v26 = 0;
    }
LABEL_28:
  }
  else
  {
    __int16 v26 = 0;
  }
  if (v13)
  {
    __int16 v30 = +[NSDate date];
    [v13 timeIntervalSinceDate:v30];
    double v32 = v31;
    if (v31 <= 0.0 || v31 >= 0.02)
    {
      id v33 = v13;
    }
    else
    {
      id v33 = v30;

      double v34 = -0.0;
      if (a6 > 0.0) {
        double v34 = v32;
      }
      a6 = v34 + a6;
      id v35 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        __int16 v36 = v35;
        [v33 timeIntervalSinceNow];
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[ADAudioSessionCoordinator _acquireRemoteAssertionForSenderID:reason:effectiveDate:expirat"
                             "ionDuration:error:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v33;
        *(_WORD *)&buf[22] = 2048;
        v82 = v37;
        *(_WORD *)v83 = 2048;
        *(double *)&v83[2] = a6;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%s effectiveDate = %@ (%f), expirationDuration = %f (Time Drift Mitigation)", buf, 0x2Au);
      }
    }
  }
  else
  {
    id v33 = 0;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v82 = sub_1002D7B40;
  *(void *)v83 = sub_1002D7B50;
  *(void *)&v83[8] = 0;
  remoteAssertionCoordinator = self->_remoteAssertionCoordinator;
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_1002D85D8;
  v65[3] = &unk_10050AC18;
  uint64_t v70 = v53;
  BOOL v39 = v54;
  v66 = v39;
  id v40 = v33;
  id v67 = v40;
  double v71 = a6;
  id v41 = v26;
  id v68 = v41;
  id v42 = v12;
  id v69 = v42;
  id v43 = +[AFAssertionContext newWithBuilder:v65];
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_1002D870C;
  v64[3] = &unk_10050AC40;
  v64[4] = buf;
  uint64_t v44 = [(AFAssertionCoordinator *)remoteAssertionCoordinator acquireRelinquishableAssertionWithContext:v43 relinquishmentHandler:v64];
  v45 = *(void **)(*(void *)&buf[8] + 40);
  *(void *)(*(void *)&buf[8] + 40) = v44;

  v46 = [*(id *)(*(void *)&buf[8] + 40) uuid];
  v47 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v48 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)v76 = 136315394;
    v77 = "-[ADAudioSessionCoordinator _acquireRemoteAssertionForSenderID:reason:effectiveDate:expirationDuration:error:]";
    __int16 v78 = 2112;
    uint64_t v79 = v48;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%s Acquired remote assertion %@.", v76, 0x16u);
  }
  _Block_object_dispose(buf, 8);

  v49 = self->_remoteAssertionCoordinator;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_1002D87E4;
  v61[3] = &unk_10050AC68;
  id v62 = v42;
  id v29 = v46;
  id v63 = v29;
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_1002D897C;
  v55[3] = &unk_10050AC90;
  uint64_t v60 = v53;
  id v13 = v40;
  id v56 = v13;
  v57 = v39;
  id v58 = v41;
  id v59 = v62;
  id v50 = v41;
  id v51 = +[AFAssertionContext newWithBuilder:v55];
  [(AFAssertionCoordinator *)v49 relinquishAsertionsPassingTest:v61 context:v51];

LABEL_44:
  return v29;
}

- (void)_registerRequestID:(id)a3 requestHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_queue;
  rapportLink = self->_rapportLink;
  uint64_t v18 = RPOptionStatusFlags;
  uint64_t v19 = &off_100523B58;
  id v10 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002D8C08;
  v14[3] = &unk_10050ABF0;
  id v15 = v6;
  uint64_t v16 = v8;
  id v17 = v7;
  id v11 = v7;
  id v12 = v8;
  id v13 = v6;
  [(ADRapportLink *)rapportLink registerRequestID:v13 options:v10 handler:v14];
}

- (void)_sendRequestID:(id)a3 request:(id)a4 recipientID:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    double v32 = "-[ADAudioSessionCoordinator _sendRequestID:request:recipientID:responseHandler:]";
    __int16 v33 = 2112;
    id v34 = v12;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 2112;
    id v38 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s --->>> recipientID = %@, requestID = %@, request = %@", buf, 0x2Au);
  }
  id v15 = self->_queue;
  uint64_t v16 = mach_absolute_time();
  rapportLinkReadyGroup = self->_rapportLinkReadyGroup;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002D91D0;
  block[3] = &unk_10050AB78;
  block[4] = self;
  id v25 = v10;
  id v26 = v11;
  id v27 = v12;
  id v29 = v13;
  uint64_t v30 = v16;
  id v28 = v15;
  id v19 = v13;
  double v20 = v15;
  id v21 = v12;
  id v22 = v11;
  id v23 = v10;
  dispatch_group_notify(rapportLinkReadyGroup, queue, block);
}

- (id)_queue
{
  return self->_queue;
}

- (void)handleDidSetAudioSessionActive:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[ADAudioSessionCoordinator handleDidSetAudioSessionActive:]";
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s isActive = %d", buf, 0x12u);
  }
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002D9614;
  v7[3] = &unk_10050CD50;
  void v7[4] = self;
  BOOL v8 = v3;
  dispatch_async(queue, v7);
}

- (void)handleWillSetAudioSessionActive:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[ADAudioSessionCoordinator handleWillSetAudioSessionActive:]";
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s isActive = %d", buf, 0x12u);
  }
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002D9740;
  v7[3] = &unk_10050CD50;
  void v7[4] = self;
  BOOL v8 = v3;
  dispatch_async(queue, v7);
}

- (void)relinquishLocalAssertions
{
  BOOL v3 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[ADAudioSessionCoordinator relinquishLocalAssertions]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  uint64_t v4 = mach_absolute_time();
  localAssertionCoordinator = self->_localAssertionCoordinator;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002D987C;
  v7[3] = &unk_10050AB28;
  void v7[4] = v4;
  id v6 = +[AFAssertionContext newWithBuilder:v7];
  [(AFAssertionCoordinator *)localAssertionCoordinator relinquishAsertionsPassingTest:&stru_10050AB08 context:v6];
}

- (void)getSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = dispatch_group_create();
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = sub_1002D7B40;
    v33[4] = sub_1002D7B50;
    id v34 = 0;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = sub_1002D7B40;
    v31[4] = sub_1002D7B50;
    id v32 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = sub_1002D7B40;
    v29[4] = sub_1002D7B50;
    id v30 = 0;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = sub_1002D7B40;
    v27[4] = sub_1002D7B50;
    id v28 = 0;
    dispatch_group_enter(v5);
    localAssertionCoordinator = self->_localAssertionCoordinator;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1002D9C24;
    v22[3] = &unk_10050AA78;
    dispatch_time_t v24 = &stru_10050AA50;
    id v25 = v33;
    id v26 = v31;
    id v7 = v5;
    id v23 = v7;
    [(AFAssertionCoordinator *)localAssertionCoordinator getPendingAndActiveAssertionsWithCompletion:v22];
    dispatch_group_enter(v7);
    remoteAssertionCoordinator = self->_remoteAssertionCoordinator;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1002D9CD8;
    v17[3] = &unk_10050AA78;
    id v19 = &stru_10050AA50;
    double v20 = v29;
    id v21 = v27;
    id v9 = v7;
    uint64_t v18 = v9;
    [(AFAssertionCoordinator *)remoteAssertionCoordinator getPendingAndActiveAssertionsWithCompletion:v17];
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002D9D8C;
    block[3] = &unk_10050AAC8;
    block[4] = self;
    id v13 = v33;
    __int16 v14 = v31;
    id v15 = v29;
    uint64_t v16 = v27;
    id v12 = v4;
    dispatch_group_notify(v9, queue, block);

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(v29, 8);

    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v33, 8);
  }
}

- (BOOL)hasActiveAudioSessionAssertions
{
  id v3 = [(AFAssertionCoordinator *)self->_localAssertionCoordinator numberOfActiveAssertions];
  if (v3)
  {
    id v4 = v3;
    BOOL v5 = AFSiriLogContextDaemon;
    BOOL v6 = 1;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      id v12 = "-[ADAudioSessionCoordinator hasActiveAudioSessionAssertions]";
      __int16 v13 = 2048;
      id v14 = v4;
      id v7 = "%s numberOfActiveAssertions = %llu (local)";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    id v8 = [(AFAssertionCoordinator *)self->_remoteAssertionCoordinator numberOfActiveAssertions];
    BOOL v5 = AFSiriLogContextDaemon;
    BOOL v9 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (!v9) {
        return 1;
      }
      int v11 = 136315394;
      id v12 = "-[ADAudioSessionCoordinator hasActiveAudioSessionAssertions]";
      __int16 v13 = 2048;
      id v14 = v8;
      id v7 = "%s numberOfActiveAssertions = %llu (remote)";
      BOOL v6 = 1;
      goto LABEL_7;
    }
    if (v9)
    {
      int v11 = 136315138;
      id v12 = "-[ADAudioSessionCoordinator hasActiveAudioSessionAssertions]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s numberOfActiveAssertions = 0 (local + remote)", (uint8_t *)&v11, 0xCu);
    }
    return 0;
  }
  return v6;
}

- (id)acquireAudioSessionAssertionWithContext:(id)a3 relinquishmentHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADAudioSessionCoordinator acquireAudioSessionAssertionWithContext:relinquishmentHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  BOOL v9 = [v6 userInfo];
  id v10 = [v9 objectForKey:AFAudioSessionAssertionUserInfoKey[4]];
  unsigned int v11 = [v10 BOOLValue];

  if (!v11) {
    goto LABEL_13;
  }
  id v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[ADAudioSessionCoordinator acquireAudioSessionAssertionWithContext:relinquishmentHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Checking Stereo Pair partner to decide whether legacy audio ducking coordination should be handled...", buf, 0xCu);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v30 = 1;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002DAC3C;
  block[3] = &unk_10050D5F0;
  block[4] = self;
  void block[5] = buf;
  dispatch_sync(queue, block);
  int v14 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
  id v15 = AFSiriLogContextDaemon;
  BOOL v16 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (!v16) {
      goto LABEL_12;
    }
    *(_DWORD *)id v27 = 136315138;
    id v28 = "-[ADAudioSessionCoordinator acquireAudioSessionAssertionWithContext:relinquishmentHandler:]";
    id v17 = "%s Continue to handle legacy audio ducking coordination.";
  }
  else
  {
    if (!v16) {
      goto LABEL_12;
    }
    *(_DWORD *)id v27 = 136315138;
    id v28 = "-[ADAudioSessionCoordinator acquireAudioSessionAssertionWithContext:relinquishmentHandler:]";
    id v17 = "%s Drop legacy audio ducking coordination because Stereo Pair partner supports new audio session coordination.";
  }
  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v17, v27, 0xCu);
LABEL_12:
  _Block_object_dispose(buf, 8);
  if (!v14)
  {
    id v21 = 0;
    goto LABEL_20;
  }
LABEL_13:
  localAssertionCoordinator = self->_localAssertionCoordinator;
  id v19 = [v6 effectiveDate];
  double v20 = v6;
  if (!v19)
  {
    double v20 = [v6 mutatedCopyWithMutator:&stru_10050A9E8];
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1002DAE94;
  v24[3] = &unk_10050AA10;
  id v25 = v7;
  id v21 = [(AFAssertionCoordinator *)localAssertionCoordinator acquireRelinquishableAssertionWithContext:v20 relinquishmentHandler:v24];
  if (!v19) {

  }
  id v22 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADAudioSessionCoordinator acquireAudioSessionAssertionWithContext:relinquishmentHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s assertion = %@", buf, 0x16u);
  }

LABEL_20:
  return v21;
}

- (void)_setUpRapportLink
{
  id v3 = [ADRapportLink alloc];
  rapportLinkQueue = self->_rapportLinkQueue;
  id v5 = +[ADRapportLinkConfiguration newWithBuilder:&stru_10050A928];
  id v6 = [(ADRapportLink *)v3 initWithQueue:rapportLinkQueue configuration:v5];
  rapportLink = self->_rapportLink;
  self->_rapportLink = v6;

  [(ADRapportLink *)self->_rapportLink addListener:self];
  [(ADAudioSessionCoordinator *)self _setUpRequestHandlers];
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = self->_rapportLink;
    *(_DWORD *)buf = 136315394;
    __int16 v13 = "-[ADAudioSessionCoordinator _setUpRapportLink]";
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Activating Report Link %@...", buf, 0x16u);
  }
  dispatch_group_enter((dispatch_group_t)self->_rapportLinkReadyGroup);
  id v10 = self->_rapportLink;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002DB1D4;
  v11[3] = &unk_10050C610;
  v11[4] = self;
  [(ADRapportLink *)v10 activateWithCompletion:v11];
}

- (ADAudioSessionCoordinator)initWithInstanceContext:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)ADAudioSessionCoordinator;
  id v8 = [(ADAudioSessionCoordinator *)&v39 init];
  if (v8)
  {
    BOOL v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.assistant.audio-session-coordination", v10);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    if (v6)
    {
      __int16 v13 = (AFInstanceContext *)v6;
    }
    else
    {
      __int16 v13 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v8->_instanceContext;
    v8->_instanceContext = v13;

    objc_storeWeak((id *)&v8->_delegate, v7);
    id v15 = (AFAssertionCoordinator *)[objc_alloc((Class)AFAssertionCoordinator) initWithIdentifier:@"com.apple.assistant.audio-session-coordination.assertion-coordinator.local" queue:v8->_queue delegate:v8];
    localAssertionCoordinator = v8->_localAssertionCoordinator;
    v8->_localAssertionCoordinator = v15;

    id v17 = (AFAssertionCoordinator *)[objc_alloc((Class)AFAssertionCoordinator) initWithIdentifier:@"com.apple.assistant.audio-session-coordination.assertion-coordinator.remote" queue:v8->_queue delegate:v8];
    remoteAssertionCoordinator = v8->_remoteAssertionCoordinator;
    v8->_remoteAssertionCoordinator = v17;

    id v19 = (AFAudioSessionCoordinationSystemInfo *)+[AFAudioSessionCoordinationSystemInfo newWithBuilder:&stru_10050A8E8];
    localSystemInfo = v8->_localSystemInfo;
    v8->_localSystemInfo = v19;

    id v21 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v22 = v8->_localSystemInfo;
      id v23 = v21;
      unsigned int v24 = [(AFAudioSessionCoordinationSystemInfo *)v22 isSupportedAndEnabled];
      *(_DWORD *)buf = 136315394;
      id v41 = "-[ADAudioSessionCoordinator initWithInstanceContext:delegate:]";
      __int16 v42 = 1024;
      unsigned int v43 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s isSupportedAndEnabled = %d (initial)", buf, 0x12u);
    }
    id v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v8 selector:"mediaRemoteDeviceInfoRouteIdentifierDidChange:" name:AFMediaRemoteDeviceInfoRouteIdentifierDidChangeNotification object:0];

    id v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v8 selector:"mediaRemoteDeviceInfoGroupIdentifierDidChange:" name:AFMediaRemoteDeviceInfoGroupIdentifierDidChangeNotification object:0];

    [(ADAudioSessionCoordinator *)v8 fetchAndUpdateMediaRemoteGroupIdentifierForReason:@"Initialization"];
    [(ADAudioSessionCoordinator *)v8 fetchAndUpdateMediaRemoteRouteIdentifierForReason:@"Initialization"];
    id v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v28 = dispatch_queue_attr_make_with_qos_class(v27, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v29 = dispatch_queue_create("com.apple.assistant.audio-session-coordination.rapport-link", v28);
    rapportLinkQueue = v8->_rapportLinkQueue;
    v8->_rapportLinkQueue = (OS_dispatch_queue *)v29;

    dispatch_group_t v31 = dispatch_group_create();
    rapportLinkReadyGroup = v8->_rapportLinkReadyGroup;
    v8->_rapportLinkReadyGroup = (OS_dispatch_group *)v31;

    [(ADAudioSessionCoordinator *)v8 _setUpRapportLink];
    __int16 v33 = v8->_queue;
    id v34 = +[ADQueueMonitor sharedMonitor];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1002DB864;
    v37[3] = &unk_10050C458;
    id v38 = v33;
    __int16 v35 = v33;
    [v34 addQueue:v35 heartBeatInterval:v37 timeoutInterval:5.0 timeoutHandler:5.0];
  }
  return v8;
}

- (void)dealloc
{
  [(ADAudioSessionCoordinator *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ADAudioSessionCoordinator;
  [(ADAudioSessionCoordinator *)&v3 dealloc];
}

@end