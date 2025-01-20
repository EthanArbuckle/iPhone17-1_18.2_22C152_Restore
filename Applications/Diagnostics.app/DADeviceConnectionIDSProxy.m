@interface DADeviceConnectionIDSProxy
- (BOOL)isCommunicationAvailable;
- (BOOL)isDisconnecting;
- (DADeviceConnectionDelegate)delegate;
- (DADeviceConnectionIDSProxy)initWithState:(id)a3;
- (DADeviceState)state;
- (DAIDSDestination)destination;
- (DAIDSMessengerProxy)messenger;
- (DASessionSettings)sessionSettings;
- (NSNumber)lastMessageTimestamp;
- (NSTimer)deviceStatePingTimer;
- (OS_dispatch_queue)messageReceivingQueue;
- (OS_dispatch_queue)messageSendingQueue;
- (void)_endDeviceStatePingTimer;
- (void)_ping;
- (void)_resetDeviceStatePingTimer;
- (void)_sendMessage:(id)a3 overrideCannotCommunicate:(BOOL)a4 response:(id)a5;
- (void)_startDeviceStatePingTimer;
- (void)_updateState:(id)a3;
- (void)connect;
- (void)end;
- (void)idle;
- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7;
- (void)setCommunicationAvailable:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceStatePingTimer:(id)a3;
- (void)setDisconnecting:(BOOL)a3;
- (void)setLastMessageTimestamp:(id)a3;
- (void)setMessageReceivingQueue:(id)a3;
- (void)setMessageSendingQueue:(id)a3;
- (void)setSessionSettings:(id)a3;
- (void)start;
@end

@implementation DADeviceConnectionIDSProxy

- (DADeviceConnectionIDSProxy)initWithState:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DADeviceConnectionIDSProxy;
  v6 = [(DADeviceConnectionIDSProxy *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_state, a3);
    v8 = objc_alloc_init(DAIDSMessengerProxy);
    messenger = v7->_messenger;
    v7->_messenger = v8;

    [(DAIDSMessengerProxy *)v7->_messenger setReceiver:v7];
    v7->_communicationAvailable = 1;
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.Diagnostics.messageSendingQueue", 0);
    messageSendingQueue = v7->_messageSendingQueue;
    v7->_messageSendingQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.Diagnostics.messageReceivingQueue", 0);
    messageReceivingQueue = v7->_messageReceivingQueue;
    v7->_messageReceivingQueue = (OS_dispatch_queue *)v12;

    lastMessageTimestamp = v7->_lastMessageTimestamp;
    v7->_lastMessageTimestamp = (NSNumber *)&off_100157210;
  }
  return v7;
}

- (DADeviceState)state
{
  return self->_state;
}

- (void)connect
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001E380;
  v2[3] = &unk_10014BEC8;
  v2[4] = self;
  [(DADeviceConnectionIDSProxy *)self _sendMessage:@"requestDeviceState" overrideCannotCommunicate:0 response:v2];
}

- (void)start
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001E528;
  v2[3] = &unk_10014BEC8;
  v2[4] = self;
  [(DADeviceConnectionIDSProxy *)self _sendMessage:@"wakeDevice" overrideCannotCommunicate:1 response:v2];
}

- (void)idle
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001E674;
  v2[3] = &unk_10014BEC8;
  v2[4] = self;
  [(DADeviceConnectionIDSProxy *)self _sendMessage:@"idleDevice" overrideCannotCommunicate:0 response:v2];
}

- (void)end
{
  v3 = [(DADeviceConnectionIDSProxy *)self state];
  [v3 setPhase:5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001E7E8;
  v4[3] = &unk_10014BEC8;
  v4[4] = self;
  [(DADeviceConnectionIDSProxy *)self _sendMessage:@"endDevice" overrideCannotCommunicate:0 response:v4];
}

- (void)_ping
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001E934;
  v2[3] = &unk_10014BEC8;
  v2[4] = self;
  [(DADeviceConnectionIDSProxy *)self _sendMessage:@"requestDeviceState" overrideCannotCommunicate:0 response:v2];
}

- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7
{
  v11 = (__CFString *)a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void (**)(id, __CFString *, void))a7;
  v15 = [(DADeviceConnectionIDSProxy *)self destination];
  unsigned int v16 = [v15 isEqual:v13];

  if (v16)
  {
    v17 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412546;
      v22 = v11;
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received message: %@; from destination: %@;",
        (uint8_t *)&v21,
        0x16u);
    }

    v18 = @"messageReceived";
    [(DADeviceConnectionIDSProxy *)self _resetDeviceStatePingTimer];
    if ([(__CFString *)v11 isEqual:@"deviceState"])
    {
      v19 = (__CFString *)v12;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138412546;
          v22 = v19;
          __int16 v23 = 2112;
          id v24 = v13;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Received device state: %@; from destination: %@;",
            (uint8_t *)&v21,
            0x16u);
        }

        [(DADeviceConnectionIDSProxy *)self _updateState:v19];
      }
    }
    else
    {
      v19 = v18;
      v18 = @"unknownMessage";
    }

    if (v14) {
      v14[2](v14, v18, 0);
    }
  }
}

- (void)_sendMessage:(id)a3 overrideCannotCommunicate:(BOOL)a4 response:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_queue_t v10 = [(DADeviceConnectionIDSProxy *)self destination];

  if (v10)
  {
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = sub_10001EF4C;
    v27[4] = sub_10001EF78;
    id v28 = objc_retainBlock(v9);
    v11 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(DADeviceConnectionIDSProxy *)self destination];
      *(_DWORD *)buf = 138412546;
      id v30 = v8;
      __int16 v31 = 2112;
      v32 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Adding message to sending queue: %@; to destination: %@;",
        buf,
        0x16u);
    }
    id v13 = [(DADeviceConnectionIDSProxy *)self messageSendingQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001EF80;
    block[3] = &unk_10014BF68;
    block[4] = self;
    BOOL v26 = a4;
    id v23 = v8;
    v25 = v27;
    id v24 = v9;
    dispatch_async(v13, block);

    _Block_object_dispose(v27, 8);
  }
  else
  {
    v14 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100101FA0((uint64_t)v8, v14, v15, v16, v17, v18, v19, v20);
    }

    int v21 = +[NSError errorWithDomain:@"com.apple.Diagnostics.DADeviceConnectionIDSProxy" code:6 userInfo:0];
    if (v9) {
      (*((void (**)(id, void, void *, void, void))v9 + 2))(v9, 0, v21, 0, 0);
    }
    +[DSAnalytics sendAnalyticsWithEvent:7 error:v21];
  }
}

- (void)_updateState:(id)a3
{
  id v4 = a3;
  id v5 = [(DADeviceConnectionIDSProxy *)self lastMessageTimestamp];
  objc_sync_enter(v5);
  v6 = [(DADeviceConnectionIDSProxy *)self lastMessageTimestamp];
  v7 = [v4 timestamp];
  id v8 = [v7 compare:v6];
  objc_sync_exit(v5);

  if (v8 == (id)1)
  {
    if ([v4 phase] == (id)1 || !objc_msgSend(v4, "phase")) {
      [(DADeviceConnectionIDSProxy *)self _endDeviceStatePingTimer];
    }
    id v9 = [(DADeviceConnectionIDSProxy *)self state];
    [v9 updateWithDeviceState:v4];
  }
  else
  {
    id v9 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001023B8((uint64_t)v6, (uint64_t)v7, v9);
    }
  }
}

- (void)_startDeviceStatePingTimer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FA50;
  block[3] = &unk_10014B0D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_endDeviceStatePingTimer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FC34;
  block[3] = &unk_10014B0D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_resetDeviceStatePingTimer
{
  [(DADeviceConnectionIDSProxy *)self _endDeviceStatePingTimer];

  [(DADeviceConnectionIDSProxy *)self _startDeviceStatePingTimer];
}

- (DADeviceConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DADeviceConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DAIDSMessengerProxy)messenger
{
  return self->_messenger;
}

- (DAIDSDestination)destination
{
  return self->_destination;
}

- (DASessionSettings)sessionSettings
{
  return self->_sessionSettings;
}

- (void)setSessionSettings:(id)a3
{
}

- (BOOL)isDisconnecting
{
  return self->_disconnecting;
}

- (void)setDisconnecting:(BOOL)a3
{
  self->_disconnecting = a3;
}

- (NSNumber)lastMessageTimestamp
{
  return self->_lastMessageTimestamp;
}

- (void)setLastMessageTimestamp:(id)a3
{
}

- (NSTimer)deviceStatePingTimer
{
  return self->_deviceStatePingTimer;
}

- (void)setDeviceStatePingTimer:(id)a3
{
}

- (BOOL)isCommunicationAvailable
{
  return self->_communicationAvailable;
}

- (void)setCommunicationAvailable:(BOOL)a3
{
  self->_communicationAvailable = a3;
}

- (OS_dispatch_queue)messageSendingQueue
{
  return self->_messageSendingQueue;
}

- (void)setMessageSendingQueue:(id)a3
{
}

- (OS_dispatch_queue)messageReceivingQueue
{
  return self->_messageReceivingQueue;
}

- (void)setMessageReceivingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageReceivingQueue, 0);
  objc_storeStrong((id *)&self->_messageSendingQueue, 0);
  objc_storeStrong((id *)&self->_deviceStatePingTimer, 0);
  objc_storeStrong((id *)&self->_lastMessageTimestamp, 0);
  objc_storeStrong((id *)&self->_sessionSettings, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_state, 0);
}

@end