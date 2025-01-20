@interface MapsDaemon
- (void)_adoptPersonalPersona;
- (void)_consumeDarwinNotifications;
- (void)_main;
- (void)_registerXPCActivities;
- (void)mapsInstallStateDidChange:(BOOL)a3;
- (void)start;
@end

@implementation MapsDaemon

- (void)_main
{
  v3 = objc_alloc_init(MDState);
  state = self->_state;
  self->_state = v3;

  v5 = objc_alloc_init(MDLocationManager);
  locationManager = self->_locationManager;
  self->_locationManager = v5;

  [(MDState *)self->_state setLocationManager:self->_locationManager];
  v7 = objc_alloc_init(MDNotificationCenter);
  notificationCenter = self->_notificationCenter;
  self->_notificationCenter = v7;

  [(MDState *)self->_state setNotificationCenter:self->_notificationCenter];
  v9 = [MDGeoServicesServer alloc];
  v10 = [(MDState *)self->_state notificationCenter];
  v11 = [(MDGeoServicesServer *)v9 initWithNotificationCenter:v10];
  geoServicesServer = self->_geoServicesServer;
  self->_geoServicesServer = v11;

  v13 = [[MDShareETAServer alloc] initWithState:self->_state];
  shareETSServer = self->_shareETSServer;
  self->_shareETSServer = v13;

  v15 = [[MDDevicePushManager alloc] initWithState:self->_state];
  devicePushManager = self->_devicePushManager;
  self->_devicePushManager = v15;

  v17 = objc_alloc_init(RAPSubmissionStatusDownloader);
  submissionStatusDownloader = self->_submissionStatusDownloader;
  self->_submissionStatusDownloader = v17;

  [(RAPSubmissionStatusDownloader *)self->_submissionStatusDownloader setNotificationCenter:self->_notificationCenter];
  v19 = [[MDLocalProxy alloc] initWithState:self->_state];
  localProxy = self->_localProxy;
  self->_localProxy = v19;

  [(MDLocalProxy *)self->_localProxy setPushManager:self->_devicePushManager];
  v21 = [[MDAnnouncementsManager alloc] initWithState:self->_state];
  announcementsManager = self->_announcementsManager;
  self->_announcementsManager = v21;

  [(MDLocalProxy *)self->_localProxy setAnnouncementsManager:self->_announcementsManager];
  v23 = objc_alloc_init(MapsConnectionBrokerServer);
  mapsConnectionBrokerServer = self->_mapsConnectionBrokerServer;
  self->_mapsConnectionBrokerServer = v23;

  [(MDLocalProxy *)self->_localProxy startServer];
  v25 = +[MSPMapsInstallState sharedState];
  [v25 registerMapsInstallStateObserver:self];

  v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v26 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Maps.mapspushd.activity.queue", v28);
  activityQueue = self->_activityQueue;
  self->_activityQueue = v26;
}

- (void)_consumeDarwinNotifications
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001BA6C;
  handler[3] = &unk_1000393D0;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
}

- (void)_registerXPCActivities
{
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    GEOConfigGetDouble();
    double v4 = v3;
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REPEATING, 1);
    xpc_dictionary_set_string(v5, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
    xpc_dictionary_set_int64(v5, XPC_ACTIVITY_DELAY, (uint64_t)v4);
    xpc_dictionary_set_int64(v5, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_5_MIN);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001BD98;
    handler[3] = &unk_1000393D0;
    handler[4] = self;
    xpc_activity_register("com.apple.Maps.mapspushd.launchForAnnouncements", v5, handler);
  }
}

- (void)mapsInstallStateDidChange:(BOOL)a3
{
  if (a3) {
    [(MapsDaemon *)self _registerXPCActivities];
  }
  else {
    xpc_activity_unregister("com.apple.Maps.mapspushd.launchForAnnouncements");
  }
}

- (void)_adoptPersonalPersona
{
  v2 = +[UMUserManager sharedManager];
  unsigned __int8 v3 = [v2 isSharedIPad];

  if ((v3 & 1) == 0)
  {
    double v4 = +[UMUserManager sharedManager];
    xpc_object_t v5 = [v4 currentPersona];

    if (([v5 isPersonalPersona] & 1) == 0)
    {
      v6 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
      v7 = [v6 userPersonaUniqueString];
      v8 = [v5 generateAndRestorePersonaContextWithPersonaUniqueString:v7];

      if (v8)
      {
        v9 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v10 = 138412290;
          v11 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to adopt persona: %@", (uint8_t *)&v10, 0xCu);
        }
      }
    }
  }
}

- (void)start
{
  [(MapsDaemon *)self _adoptPersonalPersona];
  [(MapsDaemon *)self _migrate];
  [(MapsDaemon *)self _main];
  [(MapsDaemon *)self _registerXPCActivities];

  [(MapsDaemon *)self _consumeDarwinNotifications];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityQueue, 0);
  objc_storeStrong((id *)&self->_mapsConnectionBrokerServer, 0);
  objc_storeStrong((id *)&self->_announcementsManager, 0);
  objc_storeStrong((id *)&self->_submissionStatusDownloader, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_shareETSServer, 0);
  objc_storeStrong((id *)&self->_geoServicesServer, 0);
  objc_storeStrong((id *)&self->_devicePushManager, 0);
  objc_storeStrong((id *)&self->_localProxy, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end