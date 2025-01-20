@interface ADSiriClientStateContextProvider
- (ADSiriClientStateContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4 queue:(id)a5;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
@end

@implementation ADSiriClientStateContextProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_destroyWeak((id *)&self->_donationService);
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
  v6 = (void (*)(id, id, id))*((void *)a6 + 2);
  if (a5 == 10) {
    v6(a6, a3, a4);
  }
  else {
    ((void (*)(id, void, void, id))v6)(a6, 0, 0, a4);
  }
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 136315650;
    v18 = "-[ADSiriClientStateContextProvider notifyObserver:didChangeStateFrom:to:]";
    __int16 v19 = 2048;
    unint64_t v20 = a4;
    __int16 v21 = 2048;
    unint64_t v22 = a5;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s AFSiriClientState changed from %llu to %llu", (uint8_t *)&v17, 0x20u);
  }
  v9 = +[NSDate now];
  id v10 = [objc_alloc((Class)AFDeviceContextHistoryConfiguration) initWithKeepsHistory:1 historyBufferSize:3];
  id v11 = objc_alloc((Class)AFDeviceContextMetadata);
  uint64_t v12 = AFDeviceContextKeySiriClientState;
  v13 = +[NSDate dateWithTimeInterval:v9 sinceDate:60.0];
  id v14 = [v11 initWithType:v12 deliveryDate:v9 expirationDate:v13 redactedKeyPaths:0 historyConfiguration:v10];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_donationService);
  v16 = +[NSNumber numberWithUnsignedLongLong:a5];
  [WeakRetained donateContext:v16 withMetadata:v14 pushToRemote:0];
}

- (ADSiriClientStateContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ADSiriClientStateContextProvider;
  id v11 = [(ADSiriClientStateContextProvider *)&v21 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_donationService, v8);
    if (v9)
    {
      v13 = (AFInstanceContext *)v9;
    }
    else
    {
      v13 = +[AFInstanceContext currentContext];
    }
    instanceContext = v12->_instanceContext;
    v12->_instanceContext = v13;

    id v15 = [objc_alloc((Class)NSString) initWithUTF8String:"com.apple.siri.client-state-changed"];
    v16 = AFNotifyGetEffectiveNotificationName();

    int v17 = (AFNotifyObserver *)[objc_alloc((Class)AFNotifyObserver) initWithName:v16 options:1 queue:v10 delegate:v12];
    observer = v12->_observer;
    v12->_observer = v17;

    id WeakRetained = objc_loadWeakRetained((id *)&v12->_donationService);
    [WeakRetained registerContextTransformer:v12 forType:AFDeviceContextKeySiriClientState];
  }
  return v12;
}

@end