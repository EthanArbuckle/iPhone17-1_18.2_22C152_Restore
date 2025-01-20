@interface ADCallObserver
- (ADCallObserver)init;
- (BOOL)isDropInCall;
- (BOOL)isOnSpeaker;
- (unint64_t)currentCallState;
- (void)_callStateChanged:(id)a3;
- (void)_handleCallStateDidChangeTo:(unint64_t)a3 isDropInCallDidChange:(BOOL)a4;
- (void)_handleOnSpeakerDidChangeTo:(BOOL)a3;
- (void)_registerForDropInCallbacks;
- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4;
- (void)routesChangedForRouteController:(id)a3;
- (void)startObservingCallStateWithDelegate:(id)a3;
- (void)stopObservingCallStateWithCompletion:(id)a3;
@end

@implementation ADCallObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_csdConnectionObserver, 0);
  objc_storeStrong((id *)&self->_conversationProviderManager, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  v5 = (AFNotifyObserver *)a3;
  if (self->_csdConnectionObserver == v5)
  {
    v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315138;
      v8 = "-[ADCallObserver notifyObserver:didReceiveNotificationWithToken:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s Received CSD XPC connection notification. Re-registering for drop-in calls", (uint8_t *)&v7, 0xCu);
    }
    [(ADCallObserver *)self _registerForDropInCallbacks];
  }
}

- (void)routesChangedForRouteController:(id)a3
{
  v4 = [a3 pickedRoute];
  id v5 = [v4 isSpeaker];

  if (self->_onSpeaker != v5)
  {
    v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      v8 = "-[ADCallObserver routesChangedForRouteController:]";
      __int16 v9 = 1024;
      int v10 = (int)v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s onSpeaker: %d", (uint8_t *)&v7, 0x12u);
    }
    [(ADCallObserver *)self _handleOnSpeakerDidChangeTo:v5];
  }
}

- (void)_handleOnSpeakerDidChangeTo:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315394;
    int v10 = "-[ADCallObserver _handleOnSpeakerDidChangeTo:]";
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %d", (uint8_t *)&v9, 0x12u);
  }
  if (self->_onSpeaker != v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 callObserver:self onSpeakerDidChange:v3];
    }
    self->_onSpeaker = v3;
  }
}

- (BOOL)isDropInCall
{
  return self->_isDropInCall;
}

- (unint64_t)currentCallState
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000EACB8;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isOnSpeaker
{
  return self->_onSpeaker;
}

- (void)_handleCallStateDidChangeTo:(unint64_t)a3 isDropInCallDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  char v7 = AFCallStateGetNames();
  uint64_t v8 = [v7 componentsJoinedByString:@"|"];

  uint64_t v9 = AFCallStateGetNames();
  int v10 = [v9 componentsJoinedByString:@"|"];

  __int16 v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v27 = 136315650;
    v28 = "-[ADCallObserver _handleCallStateDidChangeTo:isDropInCallDidChange:]";
    __int16 v29 = 2112;
    v30 = v8;
    __int16 v31 = 2112;
    v32 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s #callstate _handleCallStateDidChangeTo: %@ from: %@", (uint8_t *)&v27, 0x20u);
  }
  if (self->_currentCallState != a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      [v14 callObserver:self callStateDidChangeFrom:self->_currentCallState to:a3 isDropInCallDidChangeTo:v4];
    }
    self->_isDropInCall = v4;
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      id v17 = objc_loadWeakRetained((id *)&self->_delegate);
      [v17 callObserver:self callStateDidChangeFrom:self->_currentCallState to:a3];
    }
    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      int v20 = AFIsHorseman();
      uint64_t v21 = 7;
      if (v20) {
        uint64_t v21 = 3;
      }
      BOOL v22 = (v21 & a3) != 0;
      id v23 = objc_loadWeakRetained((id *)&self->_delegate);
      [v23 adCallStateChangedCallInProcess:v22];
    }
    id v24 = objc_loadWeakRetained((id *)&self->_delegate);
    char v25 = objc_opt_respondsToSelector();

    if (v25)
    {
      id v26 = objc_loadWeakRetained((id *)&self->_delegate);
      [v26 adCallStateChangedCallIncoming:(a3 >> 2) & 1];
    }
    self->_currentCallState = a3;
  }
}

- (void)stopObservingCallStateWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v10 = "-[ADCallObserver stopObservingCallStateWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  objc_storeWeak((id *)&self->_delegate, 0);
  if (self->_isObserving)
  {
    self->_isObserving = 0;
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000EB0A0;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_async(serialQueue, block);
  }
  [(AFNotifyObserver *)self->_csdConnectionObserver invalidate];
  csdConnectionObserver = self->_csdConnectionObserver;
  self->_csdConnectionObserver = 0;

  if (v4) {
    v4[2](v4);
  }
}

- (void)_registerForDropInCallbacks
{
  conversationProviderManager = self->_conversationProviderManager;
  if (!conversationProviderManager)
  {
    BOOL v4 = (TUConversationProviderManager *)objc_alloc_init((Class)TUConversationProviderManager);
    id v5 = self->_conversationProviderManager;
    self->_conversationProviderManager = v4;

    conversationProviderManager = self->_conversationProviderManager;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000EB25C;
  v6[3] = &unk_10050C610;
  v6[4] = self;
  [(TUConversationProviderManager *)conversationProviderManager registerForCallbacksForProvider:@"com.apple.private.alloy.dropin.communication" completionHandler:v6];
}

- (void)startObservingCallStateWithDelegate:(id)a3
{
  id v4 = a3;
  char v5 = AFHasCellularTelephony();
  if (AFCanProxyTelephony())
  {
    uint64_t v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v11 = "-[ADCallObserver startObservingCallStateWithDelegate:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Device can receive incoming calls by proxy", buf, 0xCu);
    }
    goto LABEL_5;
  }
  if (v5)
  {
LABEL_5:
    objc_storeWeak((id *)&self->_delegate, v4);
    if (!self->_isObserving)
    {
      self->_isObserving = 1;
      serialQueue = self->_serialQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000EB538;
      block[3] = &unk_10050E138;
      block[4] = self;
      dispatch_async(serialQueue, block);
    }
    goto LABEL_9;
  }
  uint64_t v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v11 = "-[ADCallObserver startObservingCallStateWithDelegate:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Not observing call state", buf, 0xCu);
  }
LABEL_9:
}

- (void)_callStateChanged:(id)a3
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EB7DC;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (ADCallObserver)init
{
  v11.receiver = self;
  v11.super_class = (Class)ADCallObserver;
  v2 = [(ADCallObserver *)&v11 init];
  if (v2)
  {
    unint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("Call Observer Queue", v3);

    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    v2->_currentCallState = 0;
    *(_WORD *)&v2->_onSpeaker = 0;
    id v6 = objc_alloc((Class)AFNotifyObserver);
    char v7 = +[NSString stringWithUTF8String:"com.apple.telephonyutilities.callservicesdaemon.connectionrequest"];
    uint64_t v8 = (AFNotifyObserver *)[v6 initWithName:v7 options:0 queue:v2->_serialQueue delegate:v2];
    csdConnectionObserver = v2->_csdConnectionObserver;
    v2->_csdConnectionObserver = v8;
  }
  return v2;
}

@end