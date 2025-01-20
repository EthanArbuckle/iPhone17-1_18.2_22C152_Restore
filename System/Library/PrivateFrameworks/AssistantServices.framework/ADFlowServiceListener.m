@interface ADFlowServiceListener
- (ADFlowServiceListener)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)fetchSiriKitApplicationsWithNotificationPreviewRestrictionsWithCompletion:(id)a3;
- (void)getPersonalSettingsForSharedUserID:(id)a3 completion:(id)a4;
- (void)setupListener;
@end

@implementation ADFlowServiceListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)getPersonalSettingsForSharedUserID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, AFPersonalUserSettings *, void))a4;
  if (v6)
  {
    if (v5 && AFSupportsMultiUser())
    {
      v7 = +[ADMultiUserService sharedService];
      [v7 getMultiUserSettingsForSharedUserID:v5 completion:v6];
    }
    else
    {
      v8 = +[ADAssistantDataManager sharedDataManager];
      v7 = [v8 _cachedAssistantData];

      if (v7)
      {
        v9 = [v7 temperatureUnit];
        v10 = [v7 twentyFourHourTimeDisplay];
        id v11 = [v10 BOOLValue];

        v12 = [v7 region];
        v13 = [v7 countryCode];
        v14 = [v7 preferredLanguage];
        v15 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          int v18 = 136315138;
          v19 = "-[ADFlowServiceListener getPersonalSettingsForSharedUserID:completion:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s Settings found", (uint8_t *)&v18, 0xCu);
        }
        v16 = objc_alloc_init(AFPersonalUserSettings);
        [(AFPersonalUserSettings *)v16 setTemperatureUnit:v9];
        [(AFPersonalUserSettings *)v16 setTwentyFourHourTimeDisplay:v11];
        [(AFPersonalUserSettings *)v16 setRegion:v12];
        [(AFPersonalUserSettings *)v16 setCountryCode:v13];
        [(AFPersonalUserSettings *)v16 setPreferredLanguage:v14];
        v6[2](v6, v16, 0);
      }
      else
      {
        v17 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          int v18 = 136315138;
          v19 = "-[ADFlowServiceListener getPersonalSettingsForSharedUserID:completion:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s Settings not found", (uint8_t *)&v18, 0xCu);
        }
        v9 = +[AFError errorWithCode:0 description:@"User Settings unavailable"];
        ((void (**)(id, AFPersonalUserSettings *, void *))v6)[2](v6, 0, v9);
      }
    }
  }
}

- (void)fetchSiriKitApplicationsWithNotificationPreviewRestrictionsWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[ADNotificationManager sharedManager];
  [v4 fetchSiriRelatedNotificationPreviewRestrictedAppsWithCompletion:v3];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  char HasEntitlement = AFConnectionHasEntitlement();
  if (HasEntitlement)
  {
    unsigned int v7 = [v5 processIdentifier];
    v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v17 = "-[ADFlowServiceListener listener:shouldAcceptNewConnection:]";
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 1024;
      unsigned int v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ Flow Service Connection Connected (pid=%d])", buf, 0x1Cu);
    }
    v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AFFlowService];
    [v5 setExportedInterface:v9];

    [v5 setExportedObject:self];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001420F8;
    v14[3] = &unk_10050A4D8;
    unsigned int v15 = v7;
    [v5 setInvalidationHandler:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001421B4;
    v12[3] = &unk_10050A4D8;
    unsigned int v13 = v7;
    [v5 setInterruptionHandler:v12];
    [v5 resume];
  }
  else
  {
    v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[ADFlowServiceListener listener:shouldAcceptNewConnection:]";
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s %@ Flow Service Connection does not have required entitlements.", buf, 0x16u);
    }
  }

  return HasEntitlement;
}

- (void)setupListener
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001422E4;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (ADFlowServiceListener)init
{
  v8.receiver = self;
  v8.super_class = (Class)ADFlowServiceListener;
  v2 = [(ADFlowServiceListener *)&v8 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("ADFlowServiceListener", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

@end