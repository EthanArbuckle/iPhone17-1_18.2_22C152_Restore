@interface ADHomeAnnouncementContextProvider
- (ADHomeAnnouncementContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
- (void)handleHomeAnnouncementSnapshotUpdate:(id)a3;
@end

@implementation ADHomeAnnouncementContextProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAnnouncementContextAdaptor, 0);
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

- (void)handleHomeAnnouncementSnapshotUpdate:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315394;
    v13 = "-[ADHomeAnnouncementContextProvider handleHomeAnnouncementSnapshotUpdate:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s #hal snapshot = %@", (uint8_t *)&v12, 0x16u);
  }
  v6 = +[NSDate date];
  id v7 = objc_alloc((Class)AFDeviceContextMetadata);
  uint64_t v8 = AFDeviceContextKeyHomeAnnouncement;
  v9 = [v6 dateByAddingTimeInterval:60.0];
  id v10 = [v7 initWithType:v8 deliveryDate:v6 expirationDate:v9 redactedKeyPaths:0 historyConfiguration:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_donationService);
  [WeakRetained donateContext:v4 withMetadata:v10 pushToRemote:0];
}

- (ADHomeAnnouncementContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ADHomeAnnouncementContextProvider;
  uint64_t v8 = [(ADHomeAnnouncementContextProvider *)&v20 init];
  v9 = v8;
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

    if (+[AFFeatureFlags isAnnounceEnabled])
    {
      int v12 = [[ADHomeAnnouncementContextAdaptor alloc] initWithInstanceContext:v9->_instanceContext];
      homeAnnouncementContextAdaptor = v9->_homeAnnouncementContextAdaptor;
      v9->_homeAnnouncementContextAdaptor = v12;

      objc_initWeak(&location, v9);
      __int16 v14 = v9->_homeAnnouncementContextAdaptor;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000C1A38;
      v17[3] = &unk_100500E60;
      objc_copyWeak(&v18, &location);
      [(ADHomeAnnouncementContextAdaptor *)v14 registerSnapshotUpdater:v17];
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_donationService);
    [WeakRetained registerContextTransformer:v9 forType:AFDeviceContextKeyHomeAnnouncement];
  }
  return v9;
}

@end