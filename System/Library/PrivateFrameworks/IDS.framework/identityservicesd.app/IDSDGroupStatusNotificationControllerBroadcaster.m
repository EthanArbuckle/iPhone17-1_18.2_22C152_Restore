@interface IDSDGroupStatusNotificationControllerBroadcaster
- (void)broadcastGroupSessionParticipantDataUpdate:(id)a3 onTopic:(id)a4 toURI:(id)a5 fromURI:(id)a6;
- (void)broadcastGroupSessionParticipantUpdate:(id)a3 onTopic:(id)a4 toURI:(id)a5 fromURI:(id)a6 context:(id)a7;
@end

@implementation IDSDGroupStatusNotificationControllerBroadcaster

- (void)broadcastGroupSessionParticipantUpdate:(id)a3 onTopic:(id)a4 toURI:(id)a5 fromURI:(id)a6 context:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v33 = v12;
    __int16 v34 = 2112;
    id v35 = v11;
    __int16 v36 = 2112;
    id v37 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Broadcasting receivedGroupSessionParticipantUpdate:forTopic: {topic: %@, update: %@, context: %@}", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  id v17 = objc_alloc_init((Class)IMMessageContext);
  [v17 setShouldBoost:1];
  v18 = +[IDSDaemon sharedInstance];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000E2614;
  v26[3] = &unk_100981B28;
  id v27 = v11;
  id v28 = v12;
  id v29 = v13;
  id v30 = v14;
  id v31 = v15;
  uint64_t v19 = kIDSSessionEntitlement;
  uint64_t v20 = kIDSListenerCapConsumesLaunchOnDemandGroupSessionParticipantUpdates;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  id v24 = v12;
  id v25 = v11;
  [v18 enqueueBroadcast:v26 forTopic:v24 entitlement:v19 command:0 capabilities:v20 messageContext:v17];
}

- (void)broadcastGroupSessionParticipantDataUpdate:(id)a3 onTopic:(id)a4 toURI:(id)a5 fromURI:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Broadcasting receivedGroupSessionParticipantDataUpdate:forTopic: {topic: %@, update: %@}", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  id v14 = objc_alloc_init((Class)IMMessageContext);
  [v14 setShouldBoost:1];
  id v15 = +[IDSDaemon sharedInstance];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000E2A14;
  v22[3] = &unk_100981B50;
  id v23 = v9;
  id v24 = v10;
  id v25 = v11;
  id v26 = v12;
  uint64_t v16 = kIDSSessionEntitlement;
  uint64_t v17 = kIDSListenerCapConsumesLaunchOnDemandGroupSessionParticipantUpdates;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  id v21 = v9;
  [v15 enqueueBroadcast:v22 forTopic:v20 entitlement:v16 command:0 capabilities:v17 messageContext:v14];
}

@end