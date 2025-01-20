@interface MDNotificationCenter
- (MDNotificationCenter)init;
- (id)_addRequest:(id)a3;
- (id)addAirportArrivalNotificationWithTitle:(id)a3 message:(id)a4 mapRegion:(id)a5 regionName:(id)a6;
- (id)addAnnouncement:(id)a3;
- (id)addGeoDInternalNotificationWithTitle:(id)a3 subtitle:(id)a4;
- (id)addLowFuelAlertNotificationWithDetails:(id)a3;
- (id)addMapsSuggestionsNotificationWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5;
- (id)addParkedCarNotificationWithEvent:(id)a3;
- (id)addParkedCarReplacementNotificationWithEvent:(id)a3 replacingEvent:(id)a4;
- (id)addPredictedRouteTrafficIncidentNotificationForCommuteDetails:(id)a3;
- (id)addProxyAuthFailedNotificationWithTitle:(id)a3 subtitle:(id)a4;
- (id)addPushedBookmark:(id)a3;
- (id)addRAPNotificationForFixedProblems:(id)a3;
- (id)addRAPNotificationForProblemStatusChangeWithRapInfo:(id)a3;
- (id)addTrafficIncidentAlertNotificationWithAlertID:(id)a3 withReroute:(BOOL)a4 title:(id)a5 description:(id)a6;
- (id)addUGCClearedPhotoAttributionNotificationWithTitle:(id)a3 message:(id)a4;
- (id)addUGCPhotoNotificationWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5;
- (id)addVenueNotificationWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5;
- (int)GEOUITargetForAnnouncementType:(int)a3;
- (void)_removeRequest:(id)a3;
- (void)addOfflineDataIncompatibilityNotificationForIdentifiers:(id)a3 displayNames:(id)a4 completionHandler:(id)a5;
- (void)addOfflineMapDownloadedNotificationForIdentifier:(id)a3 displayName:(id)a4;
- (void)addOfflineMapsExpiredNotificationForIdentifiers:(id)a3 displayNames:(id)a4 dueToNotBeingUpdatedWithinTimeInterval:(double)a5;
- (void)addOfflineMapsExpiredNotificationForIdentifiers:(id)a3 displayNames:(id)a4 dueToNotBeingUsedWithinTimeInterval:(double)a5;
- (void)addOfflineMapsRegulatoryRegionExpirationNotificationForIdentifiers:(id)a3 displayNames:(id)a4;
- (void)addOfflineMapsUnsupportedExpirationNotificationForIdentifiers:(id)a3 displayNames:(id)a4;
- (void)addOfflineMapsWillExpireNotificationForIdentifiers:(id)a3 displayNames:(id)a4 expirationDate:(id)a5 completionHandler:(id)a6;
- (void)addPairedDeviceHasInsufficientDiskSpaceNotificationWithRequiredStorage:(unint64_t)a3 forSubscriptionIdentifiers:(id)a4 withDisplayNames:(id)a5;
- (void)clearAllNotifications;
- (void)clearNotificationWithIdentifier:(id)a3;
- (void)clearNotificationWithTrafficIncidentAlertID:(id)a3;
- (void)clearNotificationsOfType:(int64_t)a3;
- (void)dealloc;
- (void)handleNotificationResponse:(id)a3;
- (void)handleTapNotificationMetricsWithRequest:(id)a3;
- (void)showSharedTripNotification:(id)a3 ofType:(unint64_t)a4 forState:(id)a5;
- (void)userNotificationCenter:(id)a3 didOpenApplicationForResponse:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation MDNotificationCenter

- (MDNotificationCenter)init
{
  v10.receiver = self;
  v10.super_class = (Class)MDNotificationCenter;
  v2 = [(MDNotificationCenter *)&v10 init];
  if (v2)
  {
    v3 = +[GEOUserSession sharedInstance];
    [v3 setShareSessionWithMaps:1];

    v4 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.Maps"];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = v4;

    [(UNUserNotificationCenter *)v2->_notificationCenter setDelegate:v2];
    [(UNUserNotificationCenter *)v2->_notificationCenter setPrivateDelegate:v2];
    [(UNUserNotificationCenter *)v2->_notificationCenter setWantsNotificationResponsesDelivered];
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    requests = v2->_requests;
    v2->_requests = v6;

    v8 = v2;
  }

  return v2;
}

- (void)dealloc
{
  [(UNUserNotificationCenter *)self->_notificationCenter setDelegate:0];
  [(UNUserNotificationCenter *)self->_notificationCenter setPrivateDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MDNotificationCenter;
  [(MDNotificationCenter *)&v3 dealloc];
}

- (id)_addRequest:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_super v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_100005C84;
    v13 = &unk_100038A18;
    v6 = v4;
    v14 = v6;
    v15 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v10);
    v7 = [v6 identifier];
    v8 = v14;
  }
  else
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Cannot add empty request!", buf, 2u);
    }
    v7 = 0;
  }

  return v7;
}

- (void)_removeRequest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  notificationCenter = self->_notificationCenter;
  v6 = [v4 identifier];
  v15 = v6;
  v7 = +[NSArray arrayWithObjects:&v15 count:1];
  [(UNUserNotificationCenter *)notificationCenter removePendingNotificationRequestsWithIdentifiers:v7];

  v8 = self->_notificationCenter;
  v9 = [v4 identifier];
  v14 = v9;
  objc_super v10 = +[NSArray arrayWithObjects:&v14 count:1];
  [(UNUserNotificationCenter *)v8 removeDeliveredNotificationsWithIdentifiers:v10];

  [(NSMutableSet *)self->_requests removeObject:v4];
  if ([v4 type] == (id)3)
  {
    uint64_t v11 = [v4 announcementId];
    if (v11)
    {
      uint64_t v12 = +[MDState getDefault:@"ActiveAnnouncementID"];
      if (v12)
      {
        v13 = (void *)v12;
        if ((void *)v12 == v11)
        {
          +[MDState setDefault:@"ActiveAnnouncementID" value:0];
          +[MDState setDefault:@"LastAnnouncementDate" value:0];
          [(MDNotificationCenter *)self clearNotificationsOfType:3];
        }
      }
    }
  }
}

- (void)clearNotificationWithIdentifier:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000618C;
  v5[3] = &unk_100038A18;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)clearNotificationsOfType:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006418;
  v3[3] = &unk_100038A40;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)clearAllNotifications
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_super v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Clearing all notifications!", buf, 2u);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(NSMutableSet *)self->_requests copy];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MDNotificationCenter *)self _removeRequest:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)addAnnouncement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[MDNotificationCenter GEOUITargetForAnnouncementType:](self, "GEOUITargetForAnnouncementType:", [v4 announcementType]);
  if ([v4 hasAnnouncementID])
  {
    id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", [v4 announcementID]);
    +[GEOAPPortal captureUserAction:9029 target:v5 value:v6];
  }
  else
  {
    +[GEOAPPortal captureUserAction:9029 target:v5 value:0];
  }
  uint64_t v7 = +[UNNotificationRequest requestForAnnouncement:v4];
  v8 = [(MDNotificationCenter *)self _addRequest:v7];

  return v8;
}

- (id)addProxyAuthFailedNotificationWithTitle:(id)a3 subtitle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[GEOAPPortal captureUserAction:9002 target:718 value:0];
  [(MDNotificationCenter *)self clearNotificationsOfType:8];
  v8 = +[UNNotificationRequest requestForProxyAuthFailedNotificationWithTitle:v7 subtitle:v6];

  long long v9 = [(MDNotificationCenter *)self _addRequest:v8];

  return v9;
}

- (id)addGeoDInternalNotificationWithTitle:(id)a3 subtitle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MDNotificationCenter *)self clearNotificationsOfType:12];
  v8 = +[UNNotificationRequest requestForGeoDInternalNotificationWithTitle:v7 subtitle:v6];

  long long v9 = [(MDNotificationCenter *)self _addRequest:v8];

  return v9;
}

- (id)addParkedCarNotificationWithEvent:(id)a3
{
  id v4 = a3;
  [(MDNotificationCenter *)self clearNotificationsOfType:5];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_100006B7C;
  v26 = sub_100006B8C;
  id v27 = 0;
  uint64_t v5 = +[GEOMapService sharedService];
  id v6 = [v4 location];
  [v6 latitude];
  double v8 = v7;
  long long v9 = [v4 location];
  [v9 longitude];
  double v11 = v10;
  long long v12 = [v4 location];
  v13 = objc_msgSend(v5, "ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:traits:", 1, objc_msgSend(v12, "referenceFrame") != 2, 0, v8, v11);

  id v14 = [objc_alloc((Class)GEOApplicationAuditToken) initWithProxiedApplicationBundleId:@"com.apple.Maps"];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100006B94;
  v18[3] = &unk_100038A90;
  id v15 = v4;
  v20 = self;
  v21 = &v22;
  id v19 = v15;
  [v13 submitWithHandler:v18 auditToken:v14 timeout:0 networkActivity:0];
  id v16 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v16;
}

- (id)addParkedCarReplacementNotificationWithEvent:(id)a3 replacingEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MDNotificationCenter *)self clearNotificationsOfType:5];
  double v8 = +[UNNotificationRequest requestForParkedCarNotificationForEvent:v7 replacingEvent:v6];

  long long v9 = [(MDNotificationCenter *)self _addRequest:v8];

  if (v9) {
    +[GEOAPPortal captureUserAction:9002 target:721 value:0];
  }

  return v9;
}

- (id)addLowFuelAlertNotificationWithDetails:(id)a3
{
  id v4 = a3;
  +[GEOAPPortal captureUserAction:9002 target:720 value:0];
  [(MDNotificationCenter *)self clearNotificationsOfType:7];
  uint64_t v5 = +[UNNotificationRequest requestForLowFuelAlertNotificationWithDetails:v4];

  id v6 = [(MDNotificationCenter *)self _addRequest:v5];

  return v6;
}

- (id)addMapsSuggestionsNotificationWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(MDNotificationCenter *)self clearNotificationsOfType:10];
  double v11 = +[UNNotificationRequest requestForMapsSuggestionsNotificationWithTitle:v10 message:v9 actionURL:v8];

  long long v12 = [(MDNotificationCenter *)self _addRequest:v11];

  return v12;
}

- (id)addVenueNotificationWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  +[GEOAPPortal captureUserAction:9002 target:686 value:0];
  [(MDNotificationCenter *)self clearNotificationsOfType:11];
  double v11 = +[UNNotificationRequest requestForVenueNotificationWithTitle:v10 message:v9 actionURL:v8];

  long long v12 = [(MDNotificationCenter *)self _addRequest:v11];

  return v12;
}

- (id)addAirportArrivalNotificationWithTitle:(id)a3 message:(id)a4 mapRegion:(id)a5 regionName:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  +[GEOAPPortal captureUserAction:393 target:84 value:@"arrival"];
  [(MDNotificationCenter *)self clearNotificationsOfType:19];
  id v14 = +[UNNotificationRequest requestForAirportArrivalNotificationWithTitle:v13 message:v12 mapRegion:v11 regionName:v10];

  id v15 = [(MDNotificationCenter *)self _addRequest:v14];

  return v15;
}

- (id)addTrafficIncidentAlertNotificationWithAlertID:(id)a3 withReroute:(BOOL)a4 title:(id)a5 description:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  [(MDNotificationCenter *)self clearNotificationsOfType:4];
  id v13 = +[UNNotificationRequest requestForTrafficIncidentAlertWithID:v12 withReroute:v7 title:v11 description:v10];

  id v14 = [(MDNotificationCenter *)self _addRequest:v13];

  return v14;
}

- (void)clearNotificationWithTrafficIncidentAlertID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000072A4;
    v6[3] = &unk_100038A18;
    v6[4] = self;
    id v7 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (id)addPredictedRouteTrafficIncidentNotificationForCommuteDetails:(id)a3
{
  id v4 = a3;
  [(MDNotificationCenter *)self clearNotificationsOfType:6];
  uint64_t v5 = +[UNNotificationRequest requestForPredictedRouteTrafficIncidentNotificationWithCommuteDetails:v4];
  id v6 = [(MDNotificationCenter *)self _addRequest:v5];

  if (v6)
  {
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v4 score]);
    +[GEOAPPortal captureUserAction:9002 target:711 value:v7];
  }

  return v6;
}

- (id)addPushedBookmark:(id)a3
{
  id v4 = a3;
  +[GEOAPPortal captureUserAction:9002 target:719 value:0];
  uint64_t v5 = +[UNNotificationRequest requestForPushedBookmark:v4];

  id v6 = [(MDNotificationCenter *)self _addRequest:v5];

  return v6;
}

- (id)addRAPNotificationForFixedProblems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 problemStatus];
  id v6 = [v5 firstObject];

  id v7 = [v6 problemState];
  if ((v7 - 1) >= 5)
  {
    id v8 = +[NSString stringWithFormat:@"(unknown: %i)", v7];
  }
  else
  {
    id v8 = off_100038BA0[(int)v7 - 1];
  }
  +[GEOAPPortal captureUserAction:9002 target:713 value:v8];

  id v9 = +[UNNotificationRequest requestForFixedRAP:v4];

  id v10 = [(MDNotificationCenter *)self _addRequest:v9];

  return v10;
}

- (id)addRAPNotificationForProblemStatusChangeWithRapInfo:(id)a3
{
  id v4 = +[UNNotificationRequest requestForRAPStatusChangeNotification:a3];
  uint64_t v5 = [(MDNotificationCenter *)self _addRequest:v4];

  return v5;
}

- (id)addUGCPhotoNotificationWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  +[GEOAPPortal captureUserAction:332 target:74 value:0];
  id v11 = +[UNNotificationRequest requestForSubmittedPhotosWithTitle:v10 message:v9 actionURL:v8];

  id v12 = [(MDNotificationCenter *)self _addRequest:v11];

  return v12;
}

- (id)addUGCClearedPhotoAttributionNotificationWithTitle:(id)a3 message:(id)a4
{
  uint64_t v5 = +[UNNotificationRequest requestForClearedPhotoAttributionNotificationWithTitle:a3 message:a4];
  id v6 = [(MDNotificationCenter *)self _addRequest:v5];

  return v6;
}

- (void)showSharedTripNotification:(id)a3 ofType:(unint64_t)a4 forState:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  id v9 = [objc_alloc((Class)GEOSharedNavState) initWithData:v8];

  id v10 = [v9 _transportTypeStringForAnalytics];
  switch(a4)
  {
    case 1uLL:
      +[GEOAPPortal captureUserAction:9002 target:723 value:v10];
      uint64_t v11 = +[UNNotificationRequest requestForSharedTripIdentifier:v14 state:v9];
      goto LABEL_8;
    case 2uLL:
      +[GEOAPPortal captureUserAction:9002 target:724 value:v10];
      uint64_t v11 = +[UNNotificationRequest requestForUpdatingSharedTripIdentifier:v14 state:v9];
      goto LABEL_8;
    case 3uLL:
      +[GEOAPPortal captureUserAction:9002 target:724 value:v10];
      uint64_t v11 = +[UNNotificationRequest requestForChargingStopSharedTripIdentifier:v14 state:v9];
      goto LABEL_8;
    case 4uLL:
      +[GEOAPPortal captureUserAction:9002 target:724 value:v10];
      uint64_t v11 = +[UNNotificationRequest requestForIntermediateStopSharedTripIdentifier:v14 state:v9];
      goto LABEL_8;
    case 5uLL:
      +[GEOAPPortal captureUserAction:9002 target:724 value:v10];
      uint64_t v11 = +[UNNotificationRequest requestForResumeSharedTripIdentifier:v14 state:v9];
      goto LABEL_8;
    case 6uLL:
      +[GEOAPPortal captureUserAction:9002 target:724 value:v10];
      uint64_t v11 = +[UNNotificationRequest requestForArrivingSharedTripIdentifier:v14 state:v9];
LABEL_8:
      id v12 = (void *)v11;
      if (v11)
      {
        id v13 = [(MDNotificationCenter *)self _addRequest:v11];
      }
      break;
    default:
      break;
  }
}

- (void)addOfflineMapDownloadedNotificationForIdentifier:(id)a3 displayName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[GEOAPPortal captureUserAction:376 target:84 value:@"1"];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007AFC;
  block[3] = &unk_100038AB8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)addOfflineMapsExpiredNotificationForIdentifiers:(id)a3 displayNames:(id)a4 dueToNotBeingUsedWithinTimeInterval:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  +[GEOAPPortal captureUserAction:395 target:84 value:@"not in use"];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100007C5C;
  v12[3] = &unk_100038AE0;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  double v15 = a5;
  id v10 = v9;
  id v11 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
}

- (void)addOfflineMapsRegulatoryRegionExpirationNotificationForIdentifiers:(id)a3 displayNames:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[GEOAPPortal captureUserAction:395 target:84 value:@"regulatory"];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007DB0;
  block[3] = &unk_100038AB8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)addOfflineMapsUnsupportedExpirationNotificationForIdentifiers:(id)a3 displayNames:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[GEOAPPortal captureUserAction:395 target:84 value:@"regulatory"];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007F04;
  block[3] = &unk_100038AB8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)addOfflineMapsExpiredNotificationForIdentifiers:(id)a3 displayNames:(id)a4 dueToNotBeingUpdatedWithinTimeInterval:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  +[GEOAPPortal captureUserAction:395 target:84 value:@"not updated"];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008088;
  v12[3] = &unk_100038AE0;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  double v15 = a5;
  id v10 = v9;
  id v11 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
}

- (void)addOfflineMapsWillExpireNotificationForIdentifiers:(id)a3 displayNames:(id)a4 expirationDate:(id)a5 completionHandler:(id)a6
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008208;
  block[3] = &unk_100038B08;
  block[4] = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v9 = v17;
  id v10 = v16;
  id v11 = v15;
  id v12 = v14;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)addOfflineDataIncompatibilityNotificationForIdentifiers:(id)a3 displayNames:(id)a4 completionHandler:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100008378;
  v10[3] = &unk_100038B30;
  v10[4] = self;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v7 = v13;
  id v8 = v12;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)addPairedDeviceHasInsufficientDiskSpaceNotificationWithRequiredStorage:(unint64_t)a3 forSubscriptionIdentifiers:(id)a4 withDisplayNames:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (MapsFeature_IsEnabled_StandaloneWatchOffline())
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000084D8;
    v10[3] = &unk_100038AE0;
    v10[4] = self;
    unint64_t v13 = a3;
    id v11 = v8;
    id v12 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  }
}

- (void)handleNotificationResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 notification];
  id v6 = [v5 request];

  id v7 = [v6 trafficIncidentAlert];

  if (v7)
  {
    id v8 = [(_MapsIPCInterface *)[MapsPushDaemonIPCInterface alloc] initWithListenerEndpointIdentifier:@"kPushDaemonXPCEndpointIdentifier"];
    if ([(_MapsIPCInterface *)v8 canReceiveMessages])
    {
      id v9 = objc_alloc_init(IPCHandleTrafficAlertMessage);
      id v10 = [v4 actionIdentifier];
      -[IPCHandleTrafficAlertMessage setShouldReroute:](v9, "setShouldReroute:", [v10 isEqualToString:@"TrafficIncidentAlertRerouteAction"]);

      id v11 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Notifying Maps of response: %@", buf, 0xCu);
      }

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100008898;
      v24[3] = &unk_100038B58;
      v25 = v9;
      id v12 = v9;
      [(MapsPushDaemonIPCInterface *)v8 handleTrafficeReroute:v12 completion:v24];
    }
    else
    {
      id v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Can't send IPC message due to mapsIPCServer because it can't receive messages.", buf, 2u);
      }
    }
  }
  [(MDNotificationCenter *)self handleTapNotificationMetricsWithRequest:v6];
  unint64_t v13 = [v6 content];
  id v14 = [v13 categoryIdentifier];
  unsigned int v15 = [v14 isEqualToString:off_1000473D8[0]];

  if (v15)
  {
    id v16 = [v4 actionIdentifier];
    unsigned int v17 = [v16 isEqualToString:UNNotificationDismissActionIdentifier];

    if (v17) {
      +[GEOAPPortal captureUserAction:328 target:74 value:0];
    }
  }
  v18 = [v6 sharedTripIdentifier];

  if (!v18)
  {
    id v19 = [v4 actionIdentifier];
    [(MDNotificationCenter *)self clearNotificationWithIdentifier:v19];
  }
  v20 = [v6 content];
  v21 = [v20 categoryIdentifier];
  unsigned int v22 = [v21 isEqualToString:off_1000473D0[0]];

  if (v22)
  {
    v23 = +[MapsPushManager defaultManager];
    [v23 propagateIDSMessageOfType:2 message:&stru_100039AE0];
  }
}

- (void)userNotificationCenter:(id)a3 didOpenApplicationForResponse:(id)a4
{
  id v5 = a4;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "received notification response - %@", buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100008A98;
  v8[3] = &unk_100038A18;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "received notification response - %@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008BFC;
  block[3] = &unk_100038B80;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)handleTapNotificationMetricsWithRequest:(id)a3
{
  id v57 = a3;
  id v4 = [v57 content];
  id v5 = [v4 categoryIdentifier];
  unsigned int v6 = [v5 isEqualToString:off_1000473A0[0]];

  id v7 = [v57 content];
  id v8 = v7;
  if (v6)
  {
    id v9 = [v7 userInfo];
    id v10 = [v9 objectForKeyedSubscript:@"AnnouncementID"];

    id v11 = [v57 content];
    id v12 = [v11 userInfo];
    id v13 = [v12 objectForKeyedSubscript:@"AnnouncementID"];

    uint64_t v14 = -[MDNotificationCenter GEOUITargetForAnnouncementType:](self, "GEOUITargetForAnnouncementType:", [v13 integerValue]);
    unsigned int v15 = [v10 stringValue];
    +[GEOAPPortal captureUserAction:9030 target:v14 value:v15];

LABEL_6:
LABEL_17:
    v34 = v57;
    goto LABEL_18;
  }
  id v16 = [v7 categoryIdentifier];
  unsigned int v17 = [v16 isEqualToString:off_1000473D0[0]];

  if (v17)
  {
    id v10 = [v57 fixedRAPProblemStatusStateString];
    uint64_t v18 = 713;
LABEL_5:
    +[GEOAPPortal captureUserAction:9003 target:v18 value:v10];
    goto LABEL_6;
  }
  id v19 = [v57 content];
  v20 = [v19 categoryIdentifier];
  unsigned int v21 = [v20 isEqualToString:off_1000473C0[0]];

  if (v21)
  {
    uint64_t v22 = 9003;
    uint64_t v23 = 718;
    goto LABEL_15;
  }
  uint64_t v24 = [v57 content];
  v25 = [v24 categoryIdentifier];
  unsigned int v26 = [v25 isEqualToString:off_1000473C8[0]];

  if (v26)
  {
    uint64_t v22 = 9003;
    uint64_t v23 = 719;
    goto LABEL_15;
  }
  id v27 = [v57 content];
  v28 = [v27 categoryIdentifier];
  unsigned int v29 = [v28 isEqualToString:off_1000473B0[0]];

  if (v29)
  {
    uint64_t v22 = 9003;
    uint64_t v23 = 708;
    goto LABEL_15;
  }
  v30 = [v57 content];
  v31 = [v30 categoryIdentifier];
  unsigned int v32 = [v31 isEqualToString:off_1000473B8[0]];

  if (v32)
  {
    uint64_t v22 = 9003;
    uint64_t v23 = 721;
    goto LABEL_15;
  }
  v35 = [v57 content];
  v36 = [v35 categoryIdentifier];
  unsigned int v37 = [v36 isEqualToString:off_1000473A8[0]];

  if (v37)
  {
    if ([v57 type] == (id)11)
    {
      uint64_t v22 = 9003;
      uint64_t v23 = 686;
    }
    else
    {
      if ([v57 type] == (id)19)
      {
        CFStringRef v33 = @"arrival";
        uint64_t v22 = 381;
        uint64_t v23 = 84;
        goto LABEL_16;
      }
      uint64_t v22 = 9003;
      uint64_t v23 = 711;
    }
LABEL_15:
    CFStringRef v33 = 0;
LABEL_16:
    +[GEOAPPortal captureUserAction:v22 target:v23 value:v33];
    goto LABEL_17;
  }
  v38 = [v57 content];
  v39 = [v38 categoryIdentifier];
  unsigned int v40 = [v39 isEqualToString:off_1000473E0[0]];

  if (v40)
  {
    id v10 = [v57 sharedTripTransportTypeString];
    uint64_t v18 = 723;
    goto LABEL_5;
  }
  v41 = [v57 content];
  v42 = [v41 categoryIdentifier];
  unsigned int v43 = [v42 isEqualToString:off_1000473E8[0]];

  if (v43)
  {
    id v10 = [v57 sharedTripTransportTypeString];
    uint64_t v18 = 724;
    goto LABEL_5;
  }
  v44 = [v57 content];
  v45 = [v44 categoryIdentifier];
  unsigned int v46 = [v45 isEqualToString:off_1000473D8[0]];

  if (v46)
  {
    uint64_t v22 = 334;
    uint64_t v23 = 74;
    goto LABEL_15;
  }
  v47 = [v57 content];
  v48 = [v47 categoryIdentifier];
  unsigned int v49 = [v48 isEqualToString:kUNCategoryOfflineMapData[0]];

  v34 = v57;
  if (v49)
  {
    v50 = [v57 content];
    v51 = [v50 userInfo];
    v52 = [v51 objectForKeyedSubscript:@"MapsNotificationType"];
    id v53 = [v52 integerValue];

    if (v53 == (id)17)
    {
      v54 = [v57 content];
      v55 = [v54 userInfo];
      v56 = [v55 objectForKeyedSubscript:off_1000473F8];

      +[GEOAPPortal captureUserAction:375 target:84 value:v56];
      goto LABEL_17;
    }
    v34 = v57;
    if (v53 == (id)16)
    {
      uint64_t v22 = 379;
      uint64_t v23 = 84;
      goto LABEL_15;
    }
  }
LABEL_18:
}

- (int)GEOUITargetForAnnouncementType:(int)a3
{
  if ((a3 - 1) >= 7) {
    return 725;
  }
  else {
    return a3 + 725;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);

  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end