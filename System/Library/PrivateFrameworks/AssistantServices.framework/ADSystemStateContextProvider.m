@interface ADSystemStateContextProvider
- (ADSystemStateContextProvider)initWithDonationService:(id)a3;
- (void)_donateSystemStateContextWithSnapshot:(id)a3;
- (void)_handleSleepStateChangedToState:(int64_t)a3 fromState:(int64_t)a4;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
- (void)pineBoardSystemStateObserver:(id)a3 pineBoardStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5;
@end

@implementation ADSystemStateContextProvider

- (void).cxx_destruct
{
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
}

- (void)pineBoardSystemStateObserver:(id)a3 pineBoardStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  if ((unint64_t)(a5 - 1) > 7) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_1003E2C28[a5 - 1];
  }
  if ((unint64_t)(a4 - 1) > 7) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_1003E2C28[a4 - 1];
  }
  [(ADSystemStateContextProvider *)self _handleSleepStateChangedToState:v5 fromState:v6];
}

- (void)_donateSystemStateContextWithSnapshot:(id)a3
{
  id v4 = a3;
  id v9 = +[NSDate date];
  uint64_t v5 = [v9 dateByAddingTimeInterval:86400.0];
  id v6 = objc_alloc((Class)AFDeviceContextMetadata);
  id v7 = [v6 initWithType:AFDeviceContextKeySystemState deliveryDate:v9 expirationDate:v5 redactedKeyPaths:0 historyConfiguration:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_donationService);
  [WeakRetained donateContext:v4 withMetadata:v7 pushToRemote:1];
}

- (void)_handleSleepStateChangedToState:(int64_t)a3 fromState:(int64_t)a4
{
  if (a3 != a4)
  {
    id v6 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v8 = v6;
      id v9 = AFSleepStateGetName();
      v10 = AFSleepStateGetName();
      int v11 = 136315650;
      v12 = "-[ADSystemStateContextProvider _handleSleepStateChangedToState:fromState:]";
      __int16 v13 = 2112;
      v14 = v9;
      __int16 v15 = 2112;
      v16 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s #hal to: %@, from: %@", (uint8_t *)&v11, 0x20u);
    }
    id v7 = [objc_alloc((Class)AFSystemStateSnapshot) initWithSleepState:a3];
    [(ADSystemStateContextProvider *)self _donateSystemStateContextWithSnapshot:v7];
  }
}

- (ADSystemStateContextProvider)initWithDonationService:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ADSystemStateContextProvider;
  uint64_t v5 = [(ADSystemStateContextProvider *)&v13 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_donationService, v4);
    id v7 = +[AFPineBoardSystemStateObserver defaultObserver];
    [v7 addListener:v6];

    v8 = +[AFPineBoardSystemStateObserver defaultObserver];
    id v9 = (char *)[v8 pineBoardSystemState];
    if ((unint64_t)(v9 - 1) > 7) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = qword_1003E2C28[(void)(v9 - 1)];
    }

    [(ADSystemStateContextProvider *)v6 _handleSleepStateChangedToState:v10 fromState:0];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_donationService);
    [WeakRetained registerContextTransformer:v6 forType:AFDeviceContextKeySystemState];
  }
  return v6;
}

@end