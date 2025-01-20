@interface MDLocalProxy
- (BOOL)deleteAppGroupContainer;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MDLocalProxy)initWithState:(id)a3;
- (void)clearAirportArrivalBulletin;
- (void)clearBulletinWithRecordID:(id)a3;
- (void)clearCurrentAnnouncement;
- (void)clearLowFuelAlertBulletin;
- (void)clearMapsSuggestionsBulletin;
- (void)clearParkedCarBulletin;
- (void)clearPredictedRouteTrafficIncidentBulletin;
- (void)clearTrafficIncidentBulletinWithAlertID:(id)a3;
- (void)clearVenueBulletin;
- (void)dealloc;
- (void)deleteFilesOutsideContainer;
- (void)fetchCurrentAnnouncement:(id)a3;
- (void)fetchDevicePushToken:(id)a3;
- (void)handleMapsApplicationRemoval:(id)a3;
- (void)resetAnnouncements;
- (void)setAnnouncementsManager:(id)a3;
- (void)setPushManager:(id)a3;
- (void)showAirportArrivalBulletinWithTitle:(id)a3 message:(id)a4 mapRegion:(id)a5 regionName:(id)a6;
- (void)showLowFuelAlertBulletinForLowFuelDetails:(id)a3;
- (void)showMapsSuggestionsBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5;
- (void)showParkedCarBulletinForEvent:(id)a3;
- (void)showParkedCarReplacementBulletinForEvent:(id)a3 replacingEvent:(id)a4;
- (void)showPredictedRouteTrafficIncidentBulletinForCommuteDetails:(id)a3;
- (void)showTrafficIncidentAlertWithID:(id)a3 withReroute:(BOOL)a4 title:(id)a5 description:(id)a6;
- (void)showVenueBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5;
- (void)simulateProblemResolution;
- (void)simulateRAPStatusChangeNotification;
- (void)simulateUGCPhotoAttributionClearedNotification;
- (void)simulateUGCPhotoSubmissionResolution;
- (void)startServer;
@end

@implementation MDLocalProxy

- (MDLocalProxy)initWithState:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MDLocalProxy;
  v6 = [(MDLocalProxy *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_state, a3);
    v8 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.Maps.mapspushd"];
    listener = v7->_listener;
    v7->_listener = v8;

    [(NSXPCListener *)v7->_listener setDelegate:v7];
    v10 = v7;
  }

  return v7;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  [(NSXPCListener *)self->_listener setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MDLocalProxy;
  [(MDLocalProxy *)&v3 dealloc];
}

- (void)startServer
{
}

- (void)setPushManager:(id)a3
{
}

- (void)setAnnouncementsManager:(id)a3
{
}

- (void)showParkedCarBulletinForEvent:(id)a3
{
  id v8 = a3;
  v4 = [(MDState *)self->_state locationManager];
  unsigned int v5 = [v4 mapsLocationAuthorized];

  if (v5)
  {
    v6 = [(MDState *)self->_state notificationCenter];
    id v7 = [v6 addParkedCarNotificationWithEvent:v8];
  }
}

- (void)showParkedCarReplacementBulletinForEvent:(id)a3 replacingEvent:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(MDState *)self->_state locationManager];
  unsigned int v8 = [v7 mapsLocationAuthorized];

  if (v8)
  {
    v9 = [(MDState *)self->_state notificationCenter];
    id v10 = [v9 addParkedCarReplacementNotificationWithEvent:v11 replacingEvent:v6];
  }
}

- (void)clearParkedCarBulletin
{
  id v2 = [(MDState *)self->_state notificationCenter];
  [v2 clearNotificationsOfType:5];
}

- (void)showLowFuelAlertBulletinForLowFuelDetails:(id)a3
{
  id v6 = a3;
  v4 = [(MDState *)self->_state notificationCenter];
  id v5 = [v4 addLowFuelAlertNotificationWithDetails:v6];
}

- (void)clearLowFuelAlertBulletin
{
  id v2 = [(MDState *)self->_state notificationCenter];
  [v2 clearNotificationsOfType:7];
}

- (void)showMapsSuggestionsBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MDState *)self->_state notificationCenter];
  id v11 = [v10 addMapsSuggestionsNotificationWithTitle:v12 message:v8 actionURL:v9];
}

- (void)clearMapsSuggestionsBulletin
{
  id v2 = [(MDState *)self->_state notificationCenter];
  [v2 clearNotificationsOfType:10];
}

- (void)showPredictedRouteTrafficIncidentBulletinForCommuteDetails:(id)a3
{
  id v6 = a3;
  v4 = [(MDState *)self->_state notificationCenter];
  id v5 = [v4 addPredictedRouteTrafficIncidentNotificationForCommuteDetails:v6];
}

- (void)clearPredictedRouteTrafficIncidentBulletin
{
  id v2 = [(MDState *)self->_state notificationCenter];
  [v2 clearNotificationsOfType:6];
}

- (void)showTrafficIncidentAlertWithID:(id)a3 withReroute:(BOOL)a4 title:(id)a5 description:(id)a6
{
  BOOL v8 = a4;
  id v14 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(MDState *)self->_state notificationCenter];
  id v13 = [v12 addTrafficIncidentAlertNotificationWithAlertID:v14 withReroute:v8 title:v10 description:v11];
}

- (void)clearTrafficIncidentBulletinWithAlertID:(id)a3
{
  state = self->_state;
  id v4 = a3;
  id v5 = [(MDState *)state notificationCenter];
  [v5 clearNotificationWithTrafficIncidentAlertID:v4];
}

- (void)showAirportArrivalBulletinWithTitle:(id)a3 message:(id)a4 mapRegion:(id)a5 regionName:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(MDState *)self->_state notificationCenter];
  id v14 = [v13 addAirportArrivalNotificationWithTitle:v15 message:v10 mapRegion:v11 regionName:v12];
}

- (void)clearAirportArrivalBulletin
{
  id v2 = [(MDState *)self->_state notificationCenter];
  [v2 clearNotificationsOfType:19];
}

- (void)showVenueBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MDState *)self->_state notificationCenter];
  id v11 = [v10 addVenueNotificationWithTitle:v12 message:v8 actionURL:v9];
}

- (void)clearVenueBulletin
{
  id v2 = [(MDState *)self->_state notificationCenter];
  [v2 clearNotificationsOfType:11];
}

- (void)clearBulletinWithRecordID:(id)a3
{
  state = self->_state;
  id v4 = a3;
  id v5 = [(MDState *)state notificationCenter];
  [v5 clearNotificationWithIdentifier:v4];
}

- (void)fetchDevicePushToken:(id)a3
{
  pushManager = self->_pushManager;
  id v5 = a3;
  id v6 = [(MDDevicePushManager *)pushManager devicePushToken];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)simulateProblemResolution
{
}

- (void)simulateUGCPhotoSubmissionResolution
{
}

- (void)simulateUGCPhotoAttributionClearedNotification
{
}

- (void)simulateRAPStatusChangeNotification
{
}

- (void)fetchCurrentAnnouncement:(id)a3
{
}

- (void)clearCurrentAnnouncement
{
}

- (void)resetAnnouncements
{
}

- (void)handleMapsApplicationRemoval:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004248;
  v4[3] = &unk_1000388F8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)deleteFilesOutsideContainer
{
  id v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "App Removal: Deleting files outside of container", buf, 2u);
  }

  id v3 = +[NSFileManager defaultManager];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [&off_10003C340 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v18;
    *(void *)&long long v5 = 138543618;
    long long v15 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(&off_10003C340);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v3, "fileExistsAtPath:", v9, v15))
        {
          id v16 = 0;
          unsigned int v10 = [v3 removeItemAtPath:v9 error:&v16];
          id v11 = v16;
          id v12 = v11;
          if (v10) {
            BOOL v13 = v11 == 0;
          }
          else {
            BOOL v13 = 0;
          }
          if (!v13)
          {
            id v14 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v15;
              uint64_t v22 = v9;
              __int16 v23 = 2114;
              v24 = v12;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error deleting '%{public}@': %{public}@", buf, 0x16u);
            }
          }
        }
      }
      id v6 = [&off_10003C340 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v6);
  }
}

- (BOOL)deleteAppGroupContainer
{
  id v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "App Removal: Deleting app group container", buf, 2u);
  }

  if (!container_query_create()) {
    goto LABEL_17;
  }
  container_query_set_class();
  xpc_object_t v3 = xpc_string_create((const char *)[@"group.com.apple.Maps" UTF8String]);
  container_query_set_group_identifiers();

  container_query_set_persona_unique_string();
  uint64_t single_result = container_query_get_single_result();
  uint64_t last_error = container_query_get_last_error();
  if (!single_result || last_error)
  {
    unsigned int v10 = (void *)container_error_copy_unlocalized_description();
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Could not fetch group container for deletion; error = %s",
        buf,
        0xCu);
    }

    free(v10);
LABEL_17:
    container_query_free();
    container_error_free();
    container_free_array_of_containers();
    return 0;
  }
  BOOL v6 = container_operation_delete() != 0;
  BOOL v7 = v6;
  if (!v6)
  {
    id v8 = (void *)container_error_copy_unlocalized_description();
    uint64_t v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Could not delete group container; error = %s",
        buf,
        0xCu);
    }

    free(v8);
  }
  container_query_free();
  container_error_free();
  container_free_array_of_containers();
  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 valueForEntitlement:@"com.apple.MapsSupport.ParkedCarBulletin"];
  uint64_t v9 = [v7 valueForEntitlement:@"com.apple.MapsSupport.MapsDaemon"];
  if (v8 | v9)
  {
    if (qword_1000474B0 != -1) {
      dispatch_once(&qword_1000474B0, &stru_100038938);
    }
    [v7 setExportedInterface:qword_1000474B8];
    [v7 setExportedObject:self];
    [v7 setRemoteObjectInterface:qword_1000474C0];
    unsigned int v10 = [(MDState *)self->_state peerConnectionsLock];
    [v10 lock];

    id v11 = [(MDState *)self->_state peerConnections];
    [v11 addObject:v7];

    id v12 = [(MDState *)self->_state peerConnectionsLock];
    [v12 unlock];

    objc_initWeak(&location, v7);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100004B48;
    v21[3] = &unk_100038960;
    objc_copyWeak(&v22, &location);
    v21[4] = self;
    [v7 setInvalidationHandler:v21];
    long long v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    long long v17 = sub_100004BE8;
    long long v18 = &unk_100038960;
    objc_copyWeak(&v20, &location);
    long long v19 = self;
    [v7 setInterruptionHandler:&v15];
    objc_msgSend(v7, "resume", v15, v16, v17, v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location) = 67109120;
      HIDWORD(location) = [v7 processIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "ERROR: PID (%d) is trying to connect without proper entitlement.", (uint8_t *)&location, 8u);
    }
  }
  return (v8 | v9) != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_announcementsManager, 0);
  objc_storeStrong((id *)&self->_pushManager, 0);
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end