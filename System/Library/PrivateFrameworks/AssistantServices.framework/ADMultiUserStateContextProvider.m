@interface ADMultiUserStateContextProvider
- (ADMultiUserStateContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
- (void)handleMultiUserDidReceiveScoresNotification:(id)a3;
@end

@implementation ADMultiUserStateContextProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_destroyWeak((id *)&self->_donationService);
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
}

- (void)handleMultiUserDidReceiveScoresNotification:(id)a3
{
  id v4 = a3;
  v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v20 = v5;
    v21 = [v4 object];
    int v22 = 136315394;
    v23 = "-[ADMultiUserStateContextProvider handleMultiUserDidReceiveScoresNotification:]";
    __int16 v24 = 2112;
    v25 = v21;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s #hal %@", (uint8_t *)&v22, 0x16u);
  }
  v6 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [v4 object];
    if (v8)
    {
      v9 = v8;
      v10 = [v8 objectForKey:@"vtSatScore"];
      if (v10
        && (id v11 = [objc_alloc((Class)AFMultiUserStateSnapshot) initWithVtSatScore:v10]) != 0)
      {
        v12 = v11;
        v13 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          int v22 = 136315394;
          v23 = "-[ADMultiUserStateContextProvider handleMultiUserDidReceiveScoresNotification:]";
          __int16 v24 = 2112;
          v25 = v12;
          _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s #hal %@", (uint8_t *)&v22, 0x16u);
        }
        v14 = +[NSDate date];
        v15 = [v14 dateByAddingTimeInterval:5.0];
        id v16 = objc_alloc((Class)AFDeviceContextMetadata);
        id v17 = [v16 initWithType:AFDeviceContextKeyMultiUserState deliveryDate:v14 expirationDate:v15 redactedKeyPaths:0 historyConfiguration:0];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_donationService);
        [WeakRetained donateContext:v12 withMetadata:v17 pushToRemote:1];
      }
      else
      {
        v19 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          int v22 = 136315138;
          v23 = "-[ADMultiUserStateContextProvider handleMultiUserDidReceiveScoresNotification:]";
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s #hal Invalid score", (uint8_t *)&v22, 0xCu);
        }
      }
    }
  }
}

- (ADMultiUserStateContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ADMultiUserStateContextProvider;
  v8 = [(ADMultiUserStateContextProvider *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_donationService, v6);
    if (v7)
    {
      v10 = (AFInstanceContext *)v7;
    }
    else
    {
      v10 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v9->_instanceContext;
    v9->_instanceContext = v10;

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v9 selector:"handleMultiUserDidReceiveScoresNotification:" name:@"ADMultiUserDidReceiveScoresNotification" object:0];

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_donationService);
    [WeakRetained registerContextTransformer:v9 forType:AFDeviceContextKeyMultiUserState];
  }
  return v9;
}

@end