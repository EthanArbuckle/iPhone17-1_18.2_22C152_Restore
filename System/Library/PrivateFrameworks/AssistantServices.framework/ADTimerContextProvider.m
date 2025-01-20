@interface ADTimerContextProvider
- (ADTimerContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4;
- (void)clockTimerObserver:(id)a3 snapshotDidUpdateFrom:(id)a4 to:(id)a5;
- (void)clockTimerObserver:(id)a3 timerDidDismiss:(id)a4;
- (void)clockTimerObserver:(id)a3 timerDidFire:(id)a4;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
@end

@implementation ADTimerContextProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_destroyWeak((id *)&self->_donationService);
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, id, id))a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v9;
    v13 = v12;
    if (!a5 || a5 == 50)
    {
      v27 = [v12 timersByID];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000C5ABC;
      v28[3] = &unk_10050A490;
      id v29 = [v27 mutableCopy];
      id v14 = v29;
      [v27 enumerateKeysAndObjectsUsingBlock:v28];
      id v15 = objc_alloc((Class)AFClockTimerSnapshot);
      id v16 = [v13 generation];
      v17 = [v13 date];
      [v13 notifiedFiringTimerIDs];
      v18 = v26 = v13;
      id v19 = [v15 initWithGeneration:v16 date:v17 timersByID:v14 notifiedFiringTimerIDs:v18];

      id v20 = objc_alloc((Class)AFDeviceContextMetadata);
      uint64_t v21 = AFDeviceContextKeyTimer;
      v22 = [v10 deliveryDate];
      v23 = [v10 expirationDate];
      uint64_t v30 = *((void *)&AFClockTimerSnapshotKey + 2);
      v24 = +[NSArray arrayWithObjects:&v30 count:1];
      id v25 = [v20 initWithType:v21 deliveryDate:v22 expirationDate:v23 redactedKeyPaths:v24 historyConfiguration:0];

      v13 = v26;
      v11[2](v11, v19, v25);
    }
    else if (a5 == 10)
    {
      v11[2](v11, v12, v10);
    }
  }
  else
  {
    v11[2](v11, 0, 0);
  }
}

- (void)clockTimerObserver:(id)a3 snapshotDidUpdateFrom:(id)a4 to:(id)a5
{
  id v6 = a5;
  v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315394;
    id v15 = "-[ADTimerContextProvider clockTimerObserver:snapshotDidUpdateFrom:to:]";
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s #hal updated snapshot: %@", (uint8_t *)&v14, 0x16u);
  }
  v8 = +[NSDate date];
  id v9 = objc_alloc((Class)AFDeviceContextMetadata);
  uint64_t v10 = AFDeviceContextKeyTimer;
  v11 = [v8 dateByAddingTimeInterval:900.0];
  id v12 = [v9 initWithType:v10 deliveryDate:v8 expirationDate:v11 redactedKeyPaths:0 historyConfiguration:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_donationService);
  [WeakRetained donateContext:v6 withMetadata:v12 pushToRemote:1];
}

- (void)clockTimerObserver:(id)a3 timerDidDismiss:(id)a4
{
  id v4 = a4;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    v7 = "-[ADTimerContextProvider clockTimerObserver:timerDidDismiss:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)clockTimerObserver:(id)a3 timerDidFire:(id)a4
{
  id v4 = a4;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    __int16 v8 = "-[ADTimerContextProvider clockTimerObserver:timerDidFire:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s #hal %@", (uint8_t *)&v7, 0x16u);
  }
  int v6 = +[ADDeviceProximityManager sharedManager];
  [v6 performProximityScan];
}

- (ADTimerContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ADTimerContextProvider;
  __int16 v8 = [(ADTimerContextProvider *)&v16 init];
  __int16 v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_donationService, v6);
    if (v7)
    {
      id v10 = (AFInstanceContext *)v7;
    }
    else
    {
      id v10 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v9->_instanceContext;
    v9->_instanceContext = v10;

    id v12 = (SOClockTimerObserver *)[objc_alloc((Class)SOClockTimerObserver) initWithInstanceContext:v9->_instanceContext];
    observer = v9->_observer;
    v9->_observer = v12;

    [(SOClockTimerObserver *)v9->_observer addListener:v9];
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_donationService);
    [WeakRetained registerContextTransformer:v9 forType:AFDeviceContextKeyTimer];
  }
  return v9;
}

@end