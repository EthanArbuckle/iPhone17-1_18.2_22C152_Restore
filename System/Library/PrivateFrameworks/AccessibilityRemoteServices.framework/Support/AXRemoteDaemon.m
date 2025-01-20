@interface AXRemoteDaemon
+ (id)sharedInstance;
- (AXDispatchTimer)transactionTimeoutTimer;
- (AXRDeviceRemoteScrollAccumulator)scrollAccumulator;
- (AXRemoteReceiver)receiver;
- (NSNumber)previousVoiceOverEnabledState;
- (OS_os_transaction)transaction;
- (id)_init;
- (id)remoteReceiver:(id)a3 connectingDevice:(id)a4 setupConnection:(BOOL)a5 withOptions:(id)a6;
- (void)_cancelTransactionIfNecessary;
- (void)_notifyUserEventOccured;
- (void)_resetTransactionTimer;
- (void)_sendScrollEventWithScrollAmount:(int64_t)a3;
- (void)remoteReceiver:(id)a3 didActivateWithError:(id)a4;
- (void)remoteReceiver:(id)a3 didReceivePayload:(id)a4 withOptions:(id)a5;
- (void)remoteReceiverDidDisconnect:(id)a3;
- (void)run;
- (void)scrollAccumulator:(id)a3 didAccumulateScrollInDirection:(int64_t)a4;
- (void)setPreviousVoiceOverEnabledState:(id)a3;
- (void)setReceiver:(id)a3;
- (void)setScrollAccumulator:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setTransactionTimeoutTimer:(id)a3;
- (void)startXPCService;
@end

@implementation AXRemoteDaemon

+ (id)sharedInstance
{
  if (qword_10000CCE0 != -1) {
    dispatch_once(&qword_10000CCE0, &stru_100008598);
  }
  v2 = (void *)qword_10000CCD8;

  return v2;
}

- (id)_init
{
  v14.receiver = self;
  v14.super_class = (Class)AXRemoteDaemon;
  v2 = [(AXRemoteDaemon *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.accessibility.axremoted.eventReceiverQueue", v4);
    receiverQueue = v2->_receiverQueue;
    v2->_receiverQueue = (OS_dispatch_queue *)v5;

    id v7 = objc_alloc((Class)AXRemoteReceiver);
    id v8 = [v7 initWithEventID:AXDefaultRemoteEventID delegate:v2];
    [(AXRemoteDaemon *)v2 setReceiver:v8];

    id v9 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    [(AXRemoteDaemon *)v2 setTransactionTimeoutTimer:v9];

    v10 = [(AXRemoteDaemon *)v2 transactionTimeoutTimer];
    [v10 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];

    v11 = objc_opt_new();
    [(AXRemoteDaemon *)v2 setScrollAccumulator:v11];

    v12 = [(AXRemoteDaemon *)v2 scrollAccumulator];
    [v12 setDelegate:v2];
  }
  return v2;
}

- (void)run
{
  v3 = ax_remote_daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Running AXRemoteDaemon", v4, 2u);
  }

  [(AXRemoteDaemon *)self startXPCService];
}

- (void)startXPCService
{
  v3 = ax_remote_daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up Rapport XPC event listener", buf, 2u);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100002908;
  handler[3] = &unk_1000085C0;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.rapport.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
}

- (void)_resetTransactionTimer
{
}

- (void)_cancelTransactionIfNecessary
{
  v3 = [(AXRemoteDaemon *)self transaction];

  if (v3)
  {
    v4 = ax_remote_daemon_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "clearing os_transaction", buf, 2u);
    }

    [(AXRemoteDaemon *)self setTransaction:0];
  }
  dispatch_queue_t v5 = [(AXRemoteDaemon *)self previousVoiceOverEnabledState];

  if (v5)
  {
    v6 = ax_remote_daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "resetting VoiceOver state", v8, 2u);
    }

    id v7 = [(AXRemoteDaemon *)self previousVoiceOverEnabledState];
    [v7 BOOLValue];
    _AXSVoiceOverTouchSetEnabled();

    [(AXRemoteDaemon *)self setPreviousVoiceOverEnabledState:0];
  }
}

- (void)_notifyUserEventOccured
{
  if ((AXDeviceIsAudioAccessory() & 1) == 0)
  {
    id v2 = +[AXUserEventTimer sharedInstance];
    [v2 userEventOccurred];
  }
}

- (void)_sendScrollEventWithScrollAmount:(int64_t)a3
{
  id v5 = objc_alloc_init((Class)AXEventRepresentation);
  [v5 setType:1100];
  [v5 setScrollAmount:a3];
  v4 = +[AXEventTapManager sharedManager];
  [v4 sendHIDSystemEvent:v5 senderID:0x8000000817319384];
}

- (void)scrollAccumulator:(id)a3 didAccumulateScrollInDirection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    id v12 = v6;
    if (AXDeviceIsTV())
    {
      id v7 = self;
      uint64_t v8 = -1;
      goto LABEL_7;
    }
    id v9 = +[AXRDeviceRemoteActionHelper sharedInstance];
    v10 = v9;
    v11 = &AXRDeviceRemoteActionMediaVolumeDown;
LABEL_10:
    [v9 performAction:*v11];

    goto LABEL_11;
  }
  if (a4 != 1) {
    goto LABEL_12;
  }
  id v12 = v6;
  if (!AXDeviceIsTV())
  {
    id v9 = +[AXRDeviceRemoteActionHelper sharedInstance];
    v10 = v9;
    v11 = &AXRDeviceRemoteActionMediaVolumeUp;
    goto LABEL_10;
  }
  id v7 = self;
  uint64_t v8 = 1;
LABEL_7:
  [(AXRemoteDaemon *)v7 _sendScrollEventWithScrollAmount:v8];
LABEL_11:
  id v6 = v12;
LABEL_12:
}

- (void)remoteReceiver:(id)a3 didActivateWithError:(id)a4
{
  id v5 = a4;
  id v6 = ax_remote_daemon_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "remote receiver did activate with error: %@", (uint8_t *)&v7, 0xCu);
  }

  [(AXRemoteDaemon *)self _resetTransactionTimer];
}

- (id)remoteReceiver:(id)a3 connectingDevice:(id)a4 setupConnection:(BOOL)a5 withOptions:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  if (v6)
  {
    v11 = AXRLocalizedStringForKey();
    id v12 = [v9 objectForKeyedSubscript:AXRDeviceRequestsVoiceOverEnabledKey];
    unsigned int v13 = [v12 BOOLValue];

    if (v13 && !_AXSVoiceOverTouchEnabled())
    {
      objc_super v14 = ax_remote_daemon_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "enabling VoiceOver due to remote request", buf, 2u);
      }

      v15 = +[NSNumber numberWithUnsignedChar:_AXSVoiceOverTouchEnabled()];
      [(AXRemoteDaemon *)self setPreviousVoiceOverEnabledState:v15];

      _AXSVoiceOverTouchSetEnabled();
      _AXSVoiceOverTouchSetUsageConfirmed();
      uint64_t v16 = AXRLocalizedStringForKey();

      v11 = (void *)v16;
    }
    if (_AXSVoiceOverTouchEnabled()) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 2 * (_AXSAssistiveTouchScannerEnabled() != 0);
    }
    v28[0] = AXRDeviceRemoteActionsPayloadKey;
    v19 = AXRDeviceRemoteActionsPayloadForCurrentDevice();
    v29[0] = v19;
    v28[1] = AXRDeviceRemoteActionsDeviceTypeKey;
    v20 = +[NSNumber numberWithLong:AXDeviceGetType()];
    v29[1] = v20;
    v28[2] = AXRDeviceContextTypeKey;
    v21 = +[NSNumber numberWithInteger:v17];
    v29[2] = v21;
    v28[3] = AXRHandGestureCustomizedActionsKey;
    v22 = +[AXSettings sharedInstance];
    v23 = [v22 remoteHandGestureCustomizedActions];
    v29[3] = v23;
    v18 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:4];

    v24 = +[AXSystemAppServer server];
    [v24 wakeUpDeviceIfNecessary];

    [(AXRemoteDaemon *)self _notifyUserEventOccured];
  }
  else
  {
    v11 = AXRLocalizedStringForKey();
    AXPerformBlockOnMainThread();
    v18 = 0;
  }
  v25 = +[AXBannerServices sharedInstance];
  [v25 presentBannerWithTitle:v10 message:v11 duration:3.0];

  return v18;
}

- (void)remoteReceiverDidDisconnect:(id)a3
{
  v3 = ax_remote_daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "remote receiver did disconnect", buf, 2u);
  }

  AXPerformBlockOnMainThread();
}

- (void)remoteReceiver:(id)a3 didReceivePayload:(id)a4 withOptions:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = ax_remote_daemon_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10000520C((uint64_t)v7, (uint64_t)v8, v9);
  }

  receiverQueue = self->_receiverQueue;
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  objc_super v14 = sub_1000034C0;
  v15 = &unk_100008658;
  id v16 = v7;
  uint64_t v17 = self;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)receiverQueue, &v12);
  [(AXRemoteDaemon *)self _resetTransactionTimer];
}

- (NSNumber)previousVoiceOverEnabledState
{
  return self->_previousVoiceOverEnabledState;
}

- (void)setPreviousVoiceOverEnabledState:(id)a3
{
}

- (AXRemoteReceiver)receiver
{
  return self->_receiver;
}

- (void)setReceiver:(id)a3
{
}

- (AXRDeviceRemoteScrollAccumulator)scrollAccumulator
{
  return self->_scrollAccumulator;
}

- (void)setScrollAccumulator:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (AXDispatchTimer)transactionTimeoutTimer
{
  return self->_transactionTimeoutTimer;
}

- (void)setTransactionTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_scrollAccumulator, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_previousVoiceOverEnabledState, 0);

  objc_storeStrong((id *)&self->_receiverQueue, 0);
}

@end