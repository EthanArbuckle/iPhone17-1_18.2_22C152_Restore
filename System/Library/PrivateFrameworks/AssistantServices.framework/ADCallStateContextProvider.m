@interface ADCallStateContextProvider
- (ADCallStateContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4;
- (void)_donateCallStateContextWithSnapshot:(id)a3 completion:(id)a4;
- (void)callObserver:(id)a3 callStateDidChangeFrom:(unint64_t)a4 to:(unint64_t)a5 isDropInCallDidChangeTo:(BOOL)a6;
- (void)callObserver:(id)a3 onSpeakerDidChange:(BOOL)a4;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
@end

@implementation ADCallStateContextProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_donationService, 0);
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
}

- (void)_donateCallStateContextWithSnapshot:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = +[NSDate date];
  v9 = [v8 dateByAddingTimeInterval:7200.0];
  id v10 = objc_alloc((Class)AFDeviceContextMetadata);
  id v11 = [v10 initWithType:AFDeviceContextKeyCallState deliveryDate:v8 expirationDate:v9 redactedKeyPaths:0 historyConfiguration:0];
  v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    currentState = self->_currentState;
    log = v12;
    [(AFCallStateSnapshot *)currentState callState];
    v15 = AFCallStateGetNames();
    v16 = [v15 componentsJoinedByString:@"|"];
    unsigned int v17 = [(AFCallStateSnapshot *)self->_currentState onSpeaker];
    unsigned int v18 = [(AFCallStateSnapshot *)self->_currentState isDropInCall];
    *(_DWORD *)buf = 136315906;
    v26 = "-[ADCallStateContextProvider _donateCallStateContextWithSnapshot:completion:]";
    __int16 v27 = 2112;
    v28 = v16;
    __int16 v29 = 1024;
    unsigned int v30 = v17;
    __int16 v31 = 1024;
    unsigned int v32 = v18;
    _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s #hal Previous callState: %@, onSpeaker: %d, isDropInCall: %d", buf, 0x22u);

    v12 = AFSiriLogContextDaemon;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v19 = v12;
    [v6 callState];
    v20 = AFCallStateGetNames();
    v21 = [v20 componentsJoinedByString:@"|"];
    unsigned int v22 = [v6 onSpeaker];
    unsigned int v23 = [v6 isDropInCall];
    *(_DWORD *)buf = 136315906;
    v26 = "-[ADCallStateContextProvider _donateCallStateContextWithSnapshot:completion:]";
    __int16 v27 = 2112;
    v28 = v21;
    __int16 v29 = 1024;
    unsigned int v30 = v22;
    __int16 v31 = 1024;
    unsigned int v32 = v23;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%s #hal New callState: %@, onSpeaker: %d, isDropInCall: %d", buf, 0x22u);
  }
  [(AFContextDonation *)self->_donationService donateContext:v6 withMetadata:v11 pushToRemote:0];
  v13 = self->_currentState;
  self->_currentState = (AFCallStateSnapshot *)v6;

  if (v7) {
    v7[2](v7);
  }
}

- (void)callObserver:(id)a3 onSpeakerDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[ADCallStateContextProvider callObserver:onSpeakerDidChange:]";
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s #hal call onSpeaker=%d", buf, 0x12u);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10028BE28;
  v8[3] = &unk_100509620;
  v8[4] = self;
  BOOL v9 = v4;
  id v7 = [objc_alloc((Class)AFCallStateSnapshot) initWithBuilder:v8];
  [(ADCallStateContextProvider *)self _donateCallStateContextWithSnapshot:v7 completion:0];
}

- (void)callObserver:(id)a3 callStateDidChangeFrom:(unint64_t)a4 to:(unint64_t)a5 isDropInCallDidChangeTo:(BOOL)a6
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10028C098;
  v17[3] = &unk_1005095D0;
  v17[4] = self;
  v17[5] = a4;
  id v9 = [objc_alloc((Class)AFCallStateSnapshot) initWithBuilder:v17];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10028C118;
  v15[3] = &unk_1005095F8;
  v15[4] = self;
  v15[5] = a5;
  BOOL v16 = a6;
  id v10 = [objc_alloc((Class)AFCallStateSnapshot) initWithBuilder:v15];
  id v11 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    __int16 v12 = v11;
    BOOL v13 = [v9 description];
    v14 = [v10 description];
    *(_DWORD *)buf = 136315650;
    v19 = "-[ADCallStateContextProvider callObserver:callStateDidChangeFrom:to:isDropInCallDidChangeTo:]";
    __int16 v20 = 2112;
    v21 = v13;
    __int16 v22 = 2112;
    unsigned int v23 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s #hal from = %@, to = %@", buf, 0x20u);
  }
  [(ADCallStateContextProvider *)self _donateCallStateContextWithSnapshot:v10 completion:0];
}

- (ADCallStateContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ADCallStateContextProvider;
  id v9 = [(ADCallStateContextProvider *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_donationService, a3);
    if (v8)
    {
      id v11 = (AFInstanceContext *)v8;
    }
    else
    {
      id v11 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v10->_instanceContext;
    v10->_instanceContext = v11;

    BOOL v13 = objc_alloc_init(ADCallObserver);
    observer = v10->_observer;
    v10->_observer = v13;

    [(ADCallObserver *)v10->_observer startObservingCallStateWithDelegate:v10];
    [(AFContextDonation *)v10->_donationService registerContextTransformer:v10 forType:AFDeviceContextKeyCallState];
  }

  return v10;
}

@end