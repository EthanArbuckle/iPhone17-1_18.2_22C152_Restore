@interface ADAlarmContextProvider
- (ADAlarmContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4;
- (void)clockAlarmObserver:(id)a3 alarmDidDismiss:(id)a4;
- (void)clockAlarmObserver:(id)a3 alarmDidFire:(id)a4;
- (void)clockAlarmObserver:(id)a3 snapshotDidUpdateFrom:(id)a4 to:(id)a5;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
@end

@implementation ADAlarmContextProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_donationService, 0);
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
      v27 = [v12 alarmsByID];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1001F8494;
      v28[3] = &unk_100506930;
      id v29 = [v27 mutableCopy];
      id v14 = v29;
      [v27 enumerateKeysAndObjectsUsingBlock:v28];
      id v15 = objc_alloc((Class)AFClockAlarmSnapshot);
      id v16 = [v13 generation];
      v17 = [v13 date];
      [v13 notifiedFiringAlarmIDs];
      v18 = v26 = v13;
      id v19 = [v15 initWithGeneration:v16 date:v17 alarmsByID:v14 notifiedFiringAlarmIDs:v18];

      id v20 = objc_alloc((Class)AFDeviceContextMetadata);
      uint64_t v21 = AFDeviceContextKeyAlarm;
      v22 = [v10 deliveryDate];
      v23 = [v10 expirationDate];
      uint64_t v30 = *((void *)&AFClockAlarmSnapshotKey + 2);
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

- (void)clockAlarmObserver:(id)a3 snapshotDidUpdateFrom:(id)a4 to:(id)a5
{
  id v6 = a5;
  v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315394;
    id v14 = "-[ADAlarmContextProvider clockAlarmObserver:snapshotDidUpdateFrom:to:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s #hal updated snapshot: %@", (uint8_t *)&v13, 0x16u);
  }
  v8 = +[NSDate date];
  id v9 = objc_alloc((Class)AFDeviceContextMetadata);
  uint64_t v10 = AFDeviceContextKeyAlarm;
  v11 = [v8 dateByAddingTimeInterval:900.0];
  id v12 = [v9 initWithType:v10 deliveryDate:v8 expirationDate:v11 redactedKeyPaths:0 historyConfiguration:0];

  [(AFContextDonation *)self->_donationService donateContext:v6 withMetadata:v12 pushToRemote:1];
}

- (void)clockAlarmObserver:(id)a3 alarmDidDismiss:(id)a4
{
  id v4 = a4;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    v7 = "-[ADAlarmContextProvider clockAlarmObserver:alarmDidDismiss:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)clockAlarmObserver:(id)a3 alarmDidFire:(id)a4
{
  id v4 = a4;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    __int16 v8 = "-[ADAlarmContextProvider clockAlarmObserver:alarmDidFire:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s #hal %@", (uint8_t *)&v7, 0x16u);
  }
  int v6 = +[ADDeviceProximityManager sharedManager];
  [v6 performProximityScan];
}

- (ADAlarmContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ADAlarmContextProvider;
  __int16 v9 = [(ADAlarmContextProvider *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_donationService, a3);
    if (v8)
    {
      v11 = (AFInstanceContext *)v8;
    }
    else
    {
      v11 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v10->_instanceContext;
    v10->_instanceContext = v11;

    int v13 = (SOClockAlarmObserver *)[objc_alloc((Class)SOClockAlarmObserver) initWithInstanceContext:v10->_instanceContext];
    observer = v10->_observer;
    v10->_observer = v13;

    [(SOClockAlarmObserver *)v10->_observer addListener:v10];
    [(AFContextDonation *)v10->_donationService registerContextTransformer:v10 forType:AFDeviceContextKeyAlarm];
  }

  return v10;
}

@end