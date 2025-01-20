@interface UNNotificationRequest
+ (UNNotificationRequest)requestWithContent:(id)a3 destinations:(unint64_t)a4;
+ (UNNotificationRequest)requestWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 userInfo:(id)a6 destinations:(unint64_t)a7 categoryIdentifier:(id)a8 interruptionLevel:(unint64_t)a9 shouldIgnoreDoNotDisturb:(BOOL)a10;
+ (UNNotificationRequest)requestWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 userInfo:(id)a6 destinations:(unint64_t)a7 url:(id)a8 categoryIdentifier:(id)a9 interruptionLevel:(unint64_t)a10 shouldIgnoreDoNotDisturb:(BOOL)a11;
+ (UNNotificationRequest)requestWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 userInfo:(id)a6 destinations:(unint64_t)a7 url:(id)a8 date:(id)a9 expirationDate:(id)a10 categoryIdentifier:(id)a11 interruptionLevel:(unint64_t)a12 shouldIgnoreDoNotDisturb:(BOOL)a13;
+ (UNNotificationRequest)requestWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 userInfo:(id)a6 destinations:(unint64_t)a7 url:(id)a8 date:(id)a9 expirationDate:(id)a10 categoryIdentifier:(id)a11 threadIdentifier:(id)a12 interruptionLevel:(unint64_t)a13 shouldIgnoreDoNotDisturb:(BOOL)a14;
+ (UNNotificationRequest)requestWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 userInfo:(id)a6 destinations:(unint64_t)a7 url:(id)a8 expirationDate:(id)a9 categoryIdentifier:(id)a10 threadIdentifier:(id)a11 interruptionLevel:(unint64_t)a12 shouldIgnoreDoNotDisturb:(BOOL)a13;
+ (UNNotificationRequest)requestWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 userInfo:(id)a6 interruptionLevel:(unint64_t)a7 shouldIgnoreDoNotDisturb:(BOOL)a8;
+ (id)_contentWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 userInfo:(id)a6 url:(id)a7 date:(id)a8 expirationDate:(id)a9 categoryIdentifier:(id)a10 interruptionLevel:(unint64_t)a11 shouldIgnoreDoNotDisturb:(BOOL)a12;
+ (id)_requestForSharedTripIdentifier:(id)a3 state:(id)a4 title:(id)a5 subtitle:(id)a6 message:(id)a7 isUpdate:(BOOL)a8;
+ (id)requestForAirportArrivalNotificationWithTitle:(id)a3 message:(id)a4 mapRegion:(id)a5 regionName:(id)a6;
+ (id)requestForAnnouncement:(id)a3;
+ (id)requestForArrivingSharedTripIdentifier:(id)a3 state:(id)a4;
+ (id)requestForChargingStopSharedTripIdentifier:(id)a3 state:(id)a4;
+ (id)requestForClearedPhotoAttributionNotificationWithTitle:(id)a3 message:(id)a4;
+ (id)requestForDownloadedOfflineMapWithIdentifier:(id)a3 displayName:(id)a4;
+ (id)requestForExpiredOfflineMapsWithIdentifiers:(id)a3 displayNames:(id)a4 dueToNotBeingUpdatedWithinTimeInterval:(double)a5;
+ (id)requestForExpiredOfflineMapsWithIdentifiers:(id)a3 displayNames:(id)a4 dueToNotBeingUsedWithinTimeInterval:(double)a5;
+ (id)requestForFixedRAP:(id)a3;
+ (id)requestForGeoDInternalNotificationWithTitle:(id)a3 subtitle:(id)a4;
+ (id)requestForIntermediateStopSharedTripIdentifier:(id)a3 state:(id)a4;
+ (id)requestForLowFuelAlertNotificationWithDetails:(id)a3;
+ (id)requestForMapsSuggestionsNotificationWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5;
+ (id)requestForOfflineDataIncompatibilityForIdentifiers:(id)a3 displayNames:(id)a4;
+ (id)requestForOfflineUnsupportedExpirationWithIdentifiers:(id)a3 displayNames:(id)a4 isOSVersionUnsupported:(BOOL)a5;
+ (id)requestForPairedDeviceStorageRequired:(unint64_t)a3 forSubscriptionIdentifiers:(id)a4 withDisplayNames:(id)a5;
+ (id)requestForParkedCarNotificationForEvent:(id)a3 mapItem:(id)a4;
+ (id)requestForParkedCarNotificationForEvent:(id)a3 replacingEvent:(id)a4;
+ (id)requestForPredictedRouteTrafficIncidentNotificationWithCommuteDetails:(id)a3;
+ (id)requestForProxyAuthFailedNotificationWithTitle:(id)a3 subtitle:(id)a4;
+ (id)requestForPushedBookmark:(id)a3;
+ (id)requestForRAPStatusChangeNotification:(id)a3;
+ (id)requestForResumeSharedTripIdentifier:(id)a3 state:(id)a4;
+ (id)requestForSharedTripIdentifier:(id)a3 state:(id)a4;
+ (id)requestForSubmittedPhotosWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5;
+ (id)requestForTrafficIncidentAlertWithID:(id)a3 withReroute:(BOOL)a4 title:(id)a5 description:(id)a6;
+ (id)requestForUpcomingOfflineMapsExpirationForIdentifiers:(id)a3 displayNames:(id)a4 unlessUpdatedByDate:(id)a5;
+ (id)requestForUpdatingSharedTripIdentifier:(id)a3 state:(id)a4;
+ (id)requestForVenueNotificationWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5;
- (BOOL)shouldShowIfAppInForeground;
- (NSData)trafficIncidentAlertID;
- (NSNumber)announcementDestinations;
- (NSNumber)announcementId;
- (NSNumber)announcementType;
- (NSNumber)trafficIncidentAlert;
- (NSString)fixedRAPProblemStatusStateString;
- (NSString)sharedTripIdentifier;
- (NSString)sharedTripTransportTypeString;
- (NSUUID)parkedCarIdentifier;
- (id)contextValueForKey:(id)a3;
- (int64_t)type;
@end

@implementation UNNotificationRequest

- (id)contextValueForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(UNNotificationRequest *)self content];
    v6 = [v5 userInfo];

    if (v6)
    {
      v7 = [(UNNotificationRequest *)self content];
      v8 = [v7 userInfo];
      v9 = [v8 objectForKeyedSubscript:v4];

      goto LABEL_10;
    }
    v10 = sub_10000F0F4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138412290;
      id v17 = v4;
      v11 = "Request userInfo empty - no value for key %@";
      v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
      uint32_t v14 = 12;
      goto LABEL_8;
    }
  }
  else
  {
    v10 = sub_10000F0F4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      v11 = "Requested userInfo for nil key";
      v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v16, v14);
    }
  }

  v9 = 0;
LABEL_10:

  return v9;
}

- (int64_t)type
{
  v2 = [(UNNotificationRequest *)self content];
  v3 = [v2 userInfo];

  if (v3)
  {
    id v4 = [v3 objectForKeyedSubscript:@"MapsNotificationType"];
    int64_t v5 = [v4 unsignedIntValue];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (NSNumber)announcementId
{
  v2 = [(UNNotificationRequest *)self contextValueForKey:@"AnnouncementID"];
  v3 = v2;
  if (!v2) {
    v2 = &off_10003C3A0;
  }
  id v4 = v2;

  return v4;
}

- (NSNumber)announcementType
{
  v2 = [(UNNotificationRequest *)self contextValueForKey:@"AnnouncementType"];
  v3 = v2;
  if (!v2) {
    v2 = &off_10003C3B8;
  }
  id v4 = v2;

  return v4;
}

- (NSNumber)announcementDestinations
{
  v2 = [(UNNotificationRequest *)self contextValueForKey:@"AnnouncementDestinations"];
  v3 = v2;
  if (!v2) {
    v2 = &off_10003C3A0;
  }
  id v4 = v2;

  return v4;
}

- (BOOL)shouldShowIfAppInForeground
{
  int64_t v3 = [(UNNotificationRequest *)self type];
  BOOL result = 0;
  if (v3 != 1)
  {
    if (v3 != 3) {
      return 1;
    }
    id v4 = [(UNNotificationRequest *)self announcementDestinations];
    unsigned __int8 v5 = [v4 integerValue];

    if ((v5 & 2) == 0) {
      return 1;
    }
  }
  return result;
}

+ (UNNotificationRequest)requestWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 userInfo:(id)a6 interruptionLevel:(unint64_t)a7 shouldIgnoreDoNotDisturb:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return (UNNotificationRequest *)[a1 requestWithTitle:a3 subtitle:a4 message:a5 userInfo:a6 destinations:15 url:0 date:0 expirationDate:0 categoryIdentifier:0 interruptionLevel:a7 shouldIgnoreDoNotDisturb:v9];
}

+ (UNNotificationRequest)requestWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 userInfo:(id)a6 destinations:(unint64_t)a7 url:(id)a8 categoryIdentifier:(id)a9 interruptionLevel:(unint64_t)a10 shouldIgnoreDoNotDisturb:(BOOL)a11
{
  LOBYTE(v12) = a11;
  return (UNNotificationRequest *)[a1 requestWithTitle:a3 subtitle:a4 message:a5 userInfo:a6 destinations:a7 url:a8 date:0 expirationDate:0 categoryIdentifier:a9 interruptionLevel:a10 shouldIgnoreDoNotDisturb:v12];
}

+ (UNNotificationRequest)requestWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 userInfo:(id)a6 destinations:(unint64_t)a7 url:(id)a8 expirationDate:(id)a9 categoryIdentifier:(id)a10 threadIdentifier:(id)a11 interruptionLevel:(unint64_t)a12 shouldIgnoreDoNotDisturb:(BOOL)a13
{
  LOBYTE(v14) = a13;
  return (UNNotificationRequest *)[a1 requestWithTitle:a3 subtitle:a4 message:a5 userInfo:a6 destinations:a7 url:a8 date:0 expirationDate:a9 categoryIdentifier:a10 threadIdentifier:a11 interruptionLevel:a12 shouldIgnoreDoNotDisturb:v14];
}

+ (UNNotificationRequest)requestWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 userInfo:(id)a6 destinations:(unint64_t)a7 categoryIdentifier:(id)a8 interruptionLevel:(unint64_t)a9 shouldIgnoreDoNotDisturb:(BOOL)a10
{
  LOBYTE(v11) = a10;
  return (UNNotificationRequest *)[a1 requestWithTitle:a3 subtitle:a4 message:a5 userInfo:a6 destinations:a7 url:0 date:0 expirationDate:0 categoryIdentifier:a8 interruptionLevel:a9 shouldIgnoreDoNotDisturb:v11];
}

+ (UNNotificationRequest)requestWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 userInfo:(id)a6 destinations:(unint64_t)a7 url:(id)a8 date:(id)a9 expirationDate:(id)a10 categoryIdentifier:(id)a11 threadIdentifier:(id)a12 interruptionLevel:(unint64_t)a13 shouldIgnoreDoNotDisturb:(BOOL)a14
{
  id v20 = a12;
  LOBYTE(v24) = a14;
  v21 = [a1 _contentWithTitle:a3 subtitle:a4 message:a5 userInfo:a6 url:a8 date:a9 expirationDate:a10 categoryIdentifier:a11 interruptionLevel:a13 shouldIgnoreDoNotDisturb:v24];
  [v21 setThreadIdentifier:v20];

  v22 = [a1 requestWithContent:v21 destinations:a7];

  return (UNNotificationRequest *)v22;
}

+ (UNNotificationRequest)requestWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 userInfo:(id)a6 destinations:(unint64_t)a7 url:(id)a8 date:(id)a9 expirationDate:(id)a10 categoryIdentifier:(id)a11 interruptionLevel:(unint64_t)a12 shouldIgnoreDoNotDisturb:(BOOL)a13
{
  LOBYTE(v18) = a13;
  v15 = [a1 _contentWithTitle:a3 subtitle:a4 message:a5 userInfo:a6 url:a8 date:a9 expirationDate:a10 categoryIdentifier:a11 interruptionLevel:a12 shouldIgnoreDoNotDisturb:v18];
  int v16 = [a1 requestWithContent:v15 destinations:a7];

  return (UNNotificationRequest *)v16;
}

+ (id)_contentWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 userInfo:(id)a6 url:(id)a7 date:(id)a8 expirationDate:(id)a9 categoryIdentifier:(id)a10 interruptionLevel:(unint64_t)a11 shouldIgnoreDoNotDisturb:(BOOL)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  uint64_t v24 = (__CFString *)a10;
  v25 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413826;
    id v32 = v17;
    __int16 v33 = 2112;
    id v34 = v19;
    __int16 v35 = 2112;
    id v36 = v20;
    __int16 v37 = 2112;
    id v38 = v21;
    __int16 v39 = 2112;
    id v40 = v22;
    __int16 v41 = 2112;
    id v42 = v23;
    __int16 v43 = 2112;
    v44 = v24;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Request for notification: %@, %@, %@, %@, %@, %@, %@", buf, 0x48u);
  }

  v26 = objc_opt_new();
  [v26 setTitle:v17];
  if (v18) {
    [v26 setSubtitle:v18];
  }
  objc_msgSend(v26, "setBody:", v19, a11);
  v27 = +[UNNotificationSound defaultSound];
  [v26 setSound:v27];

  [v26 setUserInfo:v20];
  [v26 setDate:v22];
  [v26 setExpirationDate:v23];
  if (v24) {
    CFStringRef v28 = v24;
  }
  else {
    CFStringRef v28 = &stru_100039AE0;
  }
  [v26 setCategoryIdentifier:v28];
  [v26 setDefaultActionURL:v21];
  [v26 setInterruptionLevel:v30];
  [v26 setShouldIgnoreDoNotDisturb:a12];

  return v26;
}

+ (UNNotificationRequest)requestWithContent:(id)a3 destinations:(unint64_t)a4
{
  id v6 = a3;
  v7 = +[NSUUID UUID];
  v8 = [v7 UUIDString];
  uint64_t v9 = [a1 requestWithIdentifier:v8 content:v6 trigger:0 destinations:a4];

  if (!v9)
  {
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [v6 title];
      int v13 = 138412290;
      uint64_t v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to create notification request - %@", (uint8_t *)&v13, 0xCu);
    }
  }

  return (UNNotificationRequest *)v9;
}

+ (id)requestForAnnouncement:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    unsigned int v7 = [v5 hasTitle];
    if (v7 && ([v6 title], int64_t v3 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v3, "length")))
    {
      v8 = [v6 title];
    }
    else
    {
      uint64_t v9 = sub_10001D3F8();
      v8 = [v9 localizedStringForKey:@"Maps [push]" value:@"localized string not found" table:0];

      if (!v7)
      {
LABEL_7:
        if ([v6 hasButtonOneAppURI])
        {
          v10 = [v6 buttonOneAppURI];
          uint64_t v11 = +[NSURL URLWithString:v10];
        }
        else
        {
          uint64_t v11 = 0;
        }
        unsigned int v13 = [v6 displayDestinations];
        char v14 = v13;
        uint64_t v15 = v13;
        v26[0] = &off_10003C3D0;
        v25[0] = @"MapsNotificationType";
        v25[1] = @"AnnouncementID";
        int v16 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v6 announcementID]);
        v26[1] = v16;
        v25[2] = @"AnnouncementType";
        id v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 announcementType]);
        v26[2] = v17;
        v25[3] = @"AnnouncementDestinations";
        id v18 = +[NSNumber numberWithUnsignedInteger:v15];
        v26[3] = v18;
        id v19 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];

        id v20 = [v6 userMessage];
        if (v14) {
          uint64_t v21 = 7;
        }
        else {
          uint64_t v21 = 0;
        }
        LOBYTE(v23) = 0;
        uint64_t v12 = [a1 requestWithTitle:v8 subtitle:0 message:v20 userInfo:v19 destinations:v21 url:v11 categoryIdentifier:off_1000473A0[0] interruptionLevel:0 shouldIgnoreDoNotDisturb:v23];

        goto LABEL_17;
      }
    }

    goto LABEL_7;
  }
  v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Request for empty announcement!", buf, 2u);
  }
  uint64_t v12 = 0;
LABEL_17:

  return v12;
}

+ (id)requestForProxyAuthFailedNotificationWithTitle:(id)a3 subtitle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSURL URLWithString:@"x-maps-ac-auth://"];
  LOBYTE(v11) = 1;
  uint64_t v9 = [a1 requestWithTitle:v7 subtitle:0 message:v6 userInfo:0 destinations:7 url:v8 categoryIdentifier:off_1000473C0[0] interruptionLevel:GEOConfigGetUInteger() shouldIgnoreDoNotDisturb:v11];

  return v9;
}

+ (id)requestForGeoDInternalNotificationWithTitle:(id)a3 subtitle:(id)a4
{
  LOBYTE(v5) = 1;
  return [a1 requestWithTitle:a3 subtitle:0 message:a4 userInfo:0 destinations:7 url:0 categoryIdentifier:@"MapsUNCategoryGeoDInternal" interruptionLevel:0 shouldIgnoreDoNotDisturb:v5];
}

- (NSUUID)parkedCarIdentifier
{
  return (NSUUID *)[(UNNotificationRequest *)self contextValueForKey:@"ParkedCarUUID"];
}

+ (id)requestForParkedCarNotificationForEvent:(id)a3 mapItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_10001E33C();
  uint64_t v9 = [v6 identifier];

  if (v9)
  {
    v51[0] = &off_10003C3E8;
    v50[0] = @"MapsNotificationType";
    v50[1] = @"ParkedCarUUID";
    v10 = [v6 identifier];
    uint64_t v11 = [v10 UUIDString];
    v51[1] = v11;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
  }
  else
  {
    CFStringRef v48 = @"MapsNotificationType";
    v49 = &off_10003C3E8;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  }
  unsigned int v13 = sub_10001D3F8();
  char v14 = [v13 localizedStringForKey:@"Parked Car [FindMyCar]" value:@"localized string not found" table:0];
  uint64_t v15 = [v6 date];
  GEOConfigGetDouble();
  int v16 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
  LOBYTE(v42) = 0;
  id v17 = [a1 _contentWithTitle:v14 subtitle:0 message:&stru_100039AE0 userInfo:v12 url:v8 date:v15 expirationDate:v16 categoryIdentifier:off_1000473B0[0] interruptionLevel:0 shouldIgnoreDoNotDisturb:v42];

  id v18 = v7;
  id v19 = v6;
  id v20 = v17;
  uint64_t v21 = [v19 nearbyLocationOfInterest];

  if (v21)
  {
    id v22 = [v19 nearbyLocationOfInterest];
    id v23 = [v22 type];
    uint64_t v24 = [v19 nearbyLocationOfInterest];
    v25 = [v24 customLabel];
    v26 = sub_100021CEC((uint64_t)v23, v25);

    uint64_t v21 = sub_10000922C(v18, v26);
  }
  if (![v21 length])
  {
    v27 = [v19 mapItem];
    uint64_t v28 = [v27 name];

    uint64_t v21 = (void *)v28;
  }
  if ([v21 length] && objc_msgSend(v21, "hasSuffix:", @"."))
  {
    uint64_t v29 = objc_msgSend(v21, "substringToIndex:", (char *)objc_msgSend(v21, "length") - 1);

    uint64_t v21 = (void *)v29;
  }
  if ([v21 length])
  {
    uint64_t v30 = sub_10001D3F8();
    v31 = [v30 localizedStringForKey:@"Notification message (with address) [FindMyCar notification]" value:@"localized string not found" table:0];
    id v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, v21);
    [v20 setBody:v32];

LABEL_13:
    goto LABEL_15;
  }
  __int16 v33 = sub_10001D3F8();
  id v34 = [v33 localizedStringForKey:@"Notification message (no address) [FindMyCar notification]" value:@"localized string not found" table:0];
  [v20 setBody:v34];

  if (!v18)
  {
    __int16 v37 = [v19 mapItem];
    id v38 = [v37 geoMapItemHandle];

    if (v38)
    {
      dispatch_semaphore_t v39 = dispatch_semaphore_create(0);
      id v40 = +[GEOMapService sharedService];
      __int16 v43 = [v19 mapItem];
      __int16 v41 = [v43 geoMapItemHandle];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100021E08;
      v44[3] = &unk_100039458;
      dispatch_semaphore_t v45 = v39;
      id v46 = v19;
      id v47 = v20;
      uint64_t v30 = v39;
      [v40 resolveMapItemFromHandle:v41 completionHandler:v44];

      dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
      v31 = v45;
      goto LABEL_13;
    }
  }
LABEL_15:

  __int16 v35 = [a1 requestWithContent:v20 destinations:7];

  return v35;
}

+ (id)requestForParkedCarNotificationForEvent:(id)a3 replacingEvent:(id)a4
{
  id v5 = a3;
  id v6 = sub_10001E33C();
  CFStringRef v42 = @"MapsNotificationType";
  __int16 v43 = &off_10003C3E8;
  id v7 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  v8 = sub_10001D3F8();
  uint64_t v9 = [v8 localizedStringForKey:@"Parked Car Updated [notification]" value:@"localized string not found" table:0];
  v10 = [v5 date];
  GEOConfigGetDouble();
  uint64_t v11 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
  LOBYTE(v37) = 0;
  uint64_t v12 = [a1 _contentWithTitle:v9 subtitle:0 message:&stru_100039AE0 userInfo:v7 url:v6 date:v10 expirationDate:v11 categoryIdentifier:off_1000473B8[0] interruptionLevel:0 shouldIgnoreDoNotDisturb:v37];

  id v13 = v5;
  id v14 = v12;
  uint64_t v15 = [v13 nearbyLocationOfInterest];

  if (v15)
  {
    int v16 = [v13 nearbyLocationOfInterest];
    id v17 = [v16 type];
    id v18 = [v13 nearbyLocationOfInterest];
    id v19 = [v18 customLabel];
    id v20 = sub_100021CEC((uint64_t)v17, v19);

    uint64_t v15 = sub_10000922C(0, v20);
  }
  if (![v15 length])
  {
    uint64_t v21 = [v13 mapItem];
    uint64_t v22 = [v21 name];

    uint64_t v15 = (void *)v22;
  }
  if ([v15 length] && objc_msgSend(v15, "hasSuffix:", @"."))
  {
    uint64_t v23 = objc_msgSend(v15, "substringToIndex:", (char *)objc_msgSend(v15, "length") - 1);

    uint64_t v15 = (void *)v23;
  }
  if ([v15 length])
  {
    uint64_t v24 = sub_10001D3F8();
    v25 = [v24 localizedStringForKey:@"Notification message (with address) [FindMyCar notification]" value:@"localized string not found" table:0];
    v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v15);
    [v14 setBody:v26];
  }
  else
  {
    v27 = sub_10001D3F8();
    uint64_t v28 = [v27 localizedStringForKey:@"Notification message (no address) [FindMyCar notification]" value:@"localized string not found" table:0];
    [v14 setBody:v28];

    uint64_t v29 = [v13 mapItem];
    uint64_t v30 = [v29 geoMapItemHandle];

    if (!v30) {
      goto LABEL_13;
    }
    dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
    id v32 = +[GEOMapService sharedService];
    __int16 v33 = [v13 mapItem];
    id v34 = [v33 geoMapItemHandle];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100021E08;
    v38[3] = &unk_100039458;
    dispatch_semaphore_t v39 = v31;
    id v40 = v13;
    id v41 = v14;
    uint64_t v24 = v31;
    [v32 resolveMapItemFromHandle:v34 completionHandler:v38];

    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    v25 = v39;
  }

LABEL_13:
  __int16 v35 = [a1 requestWithContent:v14 destinations:7];

  return v35;
}

+ (id)requestForLowFuelAlertNotificationWithDetails:(id)a3
{
  id v4 = a3;
  id v5 = [v4 engineType];
  id v6 = objc_alloc_init((Class)NSURLComponents);
  [v6 setScheme:@"x-maps-bulletin"];
  [v6 setHost:&stru_100039AE0];
  id v7 = +[NSMutableArray array];
  id v8 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"MapsPushNotificationType" value:@"LowFuel"];
  [v7 addObject:v8];
  if (v5)
  {
    id v9 = objc_alloc((Class)NSURLQueryItem);
    v10 = [v5 stringValue];
    id v11 = [v9 initWithName:@"engineType" value:v10];

    [v7 addObject:v11];
  }
  [v6 setQueryItems:v7];
  uint64_t v12 = [v6 URL];

  CFStringRef v20 = @"MapsNotificationType";
  uint64_t v21 = &off_10003C400;
  id v13 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  id v14 = [v4 title];
  uint64_t v15 = [v4 subtitle];

  int v16 = +[NSDate distantFuture];
  LOBYTE(v19) = 0;
  id v17 = [a1 requestWithTitle:v14 subtitle:0 message:v15 userInfo:v13 destinations:15 url:v12 date:0 expirationDate:v16 categoryIdentifier:@"MapsUNCategoryLowFuel" interruptionLevel:2 shouldIgnoreDoNotDisturb:v19];

  return v17;
}

- (NSData)trafficIncidentAlertID
{
  return (NSData *)[(UNNotificationRequest *)self contextValueForKey:@"TrafficIncidentAlertID"];
}

- (NSNumber)trafficIncidentAlert
{
  return (NSNumber *)[(UNNotificationRequest *)self contextValueForKey:@"TrafficIncidentAlert"];
}

+ (id)requestForMapsSuggestionsNotificationWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5
{
  CFStringRef v15 = @"MapsNotificationType";
  int v16 = &off_10003C418;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  LOBYTE(v14) = 0;
  uint64_t v12 = objc_msgSend(a1, "requestWithTitle:subtitle:message:userInfo:destinations:url:date:expirationDate:categoryIdentifier:interruptionLevel:shouldIgnoreDoNotDisturb:", v10, 0, v9, v11, 7, v8, 0, 0, off_1000473A8[0], 1, v14, v15, v16);

  return v12;
}

+ (id)requestForAirportArrivalNotificationWithTitle:(id)a3 message:(id)a4 mapRegion:(id)a5 regionName:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [a5 data];
  id v13 = [v12 base64EncodedStringWithOptions:0];
  id v14 = objc_alloc_init((Class)NSURLComponents);
  [v14 setScheme:@"x-maps-bulletin"];
  [v14 setHost:&stru_100039AE0];
  CFStringRef v15 = [v9 dataUsingEncoding:4];

  int v16 = [v15 base64EncodedStringWithOptions:0];

  id v17 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"MapsPushNotificationType" value:@"MapsPushNotificationTypeOfflineMapsSuggestion"];
  v29[0] = v17;
  id v18 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"MapsPushNotificationPushData" value:v13];
  v29[1] = v18;
  id v19 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"MapsPushNotificationTypeOfflineMapsSuggestionRegionName" value:v16];
  v29[2] = v19;
  CFStringRef v20 = +[NSArray arrayWithObjects:v29 count:3];
  [v14 setQueryItems:v20];

  CFStringRef v27 = @"MapsNotificationType";
  uint64_t v28 = &off_10003C430;
  uint64_t v21 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  uint64_t v22 = [v14 URL];
  LOBYTE(v25) = 0;
  uint64_t v23 = [a1 requestWithTitle:v11 subtitle:0 message:v10 userInfo:v21 destinations:7 url:v22 date:0 expirationDate:0 categoryIdentifier:off_1000473A8[0] interruptionLevel:0 shouldIgnoreDoNotDisturb:v25];

  return v23;
}

+ (id)requestForVenueNotificationWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5
{
  CFStringRef v15 = @"MapsNotificationType";
  int v16 = &off_10003C448;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  LOBYTE(v14) = 0;
  uint64_t v12 = objc_msgSend(a1, "requestWithTitle:subtitle:message:userInfo:destinations:url:date:expirationDate:categoryIdentifier:interruptionLevel:shouldIgnoreDoNotDisturb:", v10, 0, v9, v11, 7, v8, 0, 0, off_1000473A8[0], 0, v14, v15, v16);

  return v12;
}

+ (id)requestForTrafficIncidentAlertWithID:(id)a3 withReroute:(BOOL)a4 title:(id)a5 description:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = v10;
  if (v10)
  {
    v26[0] = @"MapsNotificationType";
    v26[1] = @"TrafficIncidentAlertID";
    v27[0] = &off_10003C460;
    v27[1] = v10;
    v26[2] = @"TrafficIncidentAlert";
    v27[2] = &__kCFBooleanTrue;
    id v12 = a6;
    id v13 = a5;
    uint64_t v14 = v27;
    CFStringRef v15 = v26;
    uint64_t v16 = 3;
  }
  else
  {
    v24[0] = @"MapsNotificationType";
    v24[1] = @"TrafficIncidentAlert";
    v25[0] = &off_10003C460;
    v25[1] = &__kCFBooleanTrue;
    id v17 = a6;
    id v18 = a5;
    uint64_t v14 = v25;
    CFStringRef v15 = v24;
    uint64_t v16 = 2;
  }
  id v19 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v15 count:v16];
  if (v8) {
    CFStringRef v20 = @"MapsUNCategoryTrafficReroute";
  }
  else {
    CFStringRef v20 = @"MapsUNCategoryTraffic";
  }
  LOBYTE(v23) = 1;
  uint64_t v21 = [a1 requestWithTitle:a5 subtitle:0 message:a6 userInfo:v19 destinations:6 categoryIdentifier:v20 interruptionLevel:1 shouldIgnoreDoNotDisturb:v23];

  return v21;
}

+ (id)requestForPredictedRouteTrafficIncidentNotificationWithCommuteDetails:(id)a3
{
  id v4 = a3;
  id v5 = [v4 commuteDetailsIdentifier];
  id v6 = objc_alloc_init((Class)NSURLComponents);
  [v6 setScheme:@"x-maps-bulletin"];
  [v6 setHost:&stru_100039AE0];
  id v7 = +[NSMutableArray array];
  id v8 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"MapsPushNotificationType" value:@"CommuteDetails"];
  [v7 addObject:v8];
  if ([v5 length])
  {
    id v9 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"uniqueID" value:v5];
    [v7 addObject:v9];
  }
  [v6 setQueryItems:v7];
  id v10 = [v6 URL];

  CFStringRef v18 = @"MapsNotificationType";
  id v19 = &off_10003C478;
  id v11 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  id v12 = [v4 title];
  id v13 = [v4 message];
  uint64_t v14 = [v4 expirationDate];

  LOBYTE(v17) = 0;
  CFStringRef v15 = [a1 requestWithTitle:v12 subtitle:0 message:v13 userInfo:v11 destinations:7 url:v10 date:0 expirationDate:v14 categoryIdentifier:off_1000473A8[0] interruptionLevel:2 shouldIgnoreDoNotDisturb:v17];

  return v15;
}

+ (id)requestForPushedBookmark:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 data];
    id v7 = [v6 base64EncodedStringWithOptions:0];
    id v8 = +[NSString stringWithFormat:@"%@://?%@=%@&%@=%@", @"x-maps-bulletin", @"MapsPushNotificationType", @"MapsPushNotifcationTypePushToPhone", @"MapsPushNotificationPushData", v7];
    __int16 v43 = +[NSURL URLWithString:v8];

    CFStringRef v45 = @"MapsNotificationType";
    id v46 = &off_10003C490;
    id v9 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    id v10 = sub_10001D3F8();
    id v11 = [v10 localizedStringForKey:@"Maps [push]" value:@"localized string not found" table:0];
    id v12 = v5;
    unsigned int v13 = [v12 type];
    if (v13 >= 2)
    {
      if (v13 == 4)
      {
        id v42 = a1;
        if ((unint64_t)[v12 placesCount] > 1)
        {
          id v41 = v6;
          CFStringRef v15 = [v12 placesAtIndex:0];
          uint64_t v25 = [v12 places];
          v26 = [v25 lastObject];

          if ([v15 type] == 2)
          {
            dispatch_semaphore_t v39 = sub_10001D3F8();
            uint64_t v27 = [v39 localizedStringForKey:@"Directions to '%@[a place]' [push-notification]" value:@"localized string not found" table:0];
            uint64_t v37 = [v26 title];
            id v38 = (void *)v27;
            uint64_t v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v37);
            id v6 = v41;
          }
          else
          {
            unsigned int v29 = [v26 type];
            id v36 = v26;
            uint64_t v30 = sub_10001D3F8();
            dispatch_semaphore_t v39 = v30;
            if (v29 == 2)
            {
              uint64_t v31 = [v30 localizedStringForKey:@"Directions from '%@[a place]' [push-notification]" value:@"localized string not found" table:0];
              uint64_t v37 = [v15 title];
              id v38 = (void *)v31;
              uint64_t v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, v37);
            }
            else
            {
              uint64_t v32 = [v30 localizedStringForKey:@"Directions from '%@[a place]' to '%@[another place]' [push-notification]" value:@"localized string not found" table:0];
              uint64_t v33 = [v15 title];
              id v34 = [v36 title];
              uint64_t v37 = (void *)v33;
              id v38 = (void *)v32;
              uint64_t v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v33, v34);
            }
            id v6 = v41;
            v26 = v36;
          }

          uint64_t v14 = (void *)v28;
        }
        else
        {
          CFStringRef v15 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Synced bookmark of trip needs at least 2 places", buf, 2u);
          }
          uint64_t v14 = 0;
        }
        goto LABEL_6;
      }
      uint64_t v14 = 0;
      if (v13 != 3)
      {
LABEL_7:

        LOBYTE(v35) = 0;
        uint64_t v23 = [a1 requestWithTitle:v11 subtitle:0 message:v14 userInfo:v9 destinations:7 url:v43 categoryIdentifier:off_1000473C8[0] interruptionLevel:2 shouldIgnoreDoNotDisturb:v35];

        goto LABEL_9;
      }
    }
    id v42 = a1;
    CFStringRef v15 = sub_10001D3F8();
    [v15 localizedStringForKey:@"Location of '%@[a place]' [push]" value:@"localized string not found" table:0];
    id v40 = v5;
    uint64_t v16 = v11;
    uint64_t v17 = v10;
    CFStringRef v18 = v9;
    id v19 = v7;
    v21 = CFStringRef v20 = v6;
    uint64_t v22 = [v12 title];
    uint64_t v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v22);

    id v6 = v20;
    id v7 = v19;
    id v9 = v18;
    id v10 = v17;
    id v11 = v16;
    id v5 = v40;
LABEL_6:

    a1 = v42;
    goto LABEL_7;
  }
  uint64_t v23 = 0;
LABEL_9:

  return v23;
}

+ (id)requestForFixedRAP:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 problemStatusCount])
  {
    id v6 = [v5 problemStatus];
    id v7 = [v6 objectAtIndexedSubscript:0];

    uint64_t v21 = [v5 data];
    id v8 = [v21 base64EncodedStringWithOptions:0];
    id v9 = +[NSString stringWithFormat:@"%@://?%@=%@&%@=%@", @"x-maps-bulletin", @"MapsPushNotificationType", @"MapsPushNotifcationTypeProblemResolved", @"MapsPushNotificationPushData", v8];
    id v10 = +[NSURL URLWithString:v9];

    v23[0] = &off_10003C4A8;
    v22[0] = @"MapsNotificationType";
    v22[1] = @"FixedProblemStatusString";
    id v11 = [v7 problemState];
    if ((v11 - 1) >= 5)
    {
      id v12 = +[NSString stringWithFormat:@"(unknown: %i)", v11];
    }
    else
    {
      id v12 = off_100039478[(int)v11 - 1];
    }
    v23[1] = v12;
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

    CFStringRef v15 = [v7 notification];
    uint64_t v16 = [v15 localizedTitle];
    uint64_t v17 = [v7 notification];
    CFStringRef v18 = [v17 localizedText];
    LOBYTE(v20) = 0;
    unsigned int v13 = [a1 requestWithTitle:v16 subtitle:0 message:v18 userInfo:v14 destinations:7 url:v10 categoryIdentifier:off_1000473D0[0] interruptionLevel:0 shouldIgnoreDoNotDisturb:v20];
  }
  else
  {
    unsigned int v13 = 0;
  }

  return v13;
}

- (NSString)fixedRAPProblemStatusStateString
{
  return (NSString *)[(UNNotificationRequest *)self contextValueForKey:@"FixedProblemStatusString"];
}

+ (id)requestForRAPStatusChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 rapResponse];
  id v6 = [v5 notification];

  id v7 = [v6 title];
  id v8 = [v7 stringValue];

  if ([v8 length])
  {
    id v9 = [v4 data];
    id v10 = [v9 base64EncodedStringWithOptions:0];
    id v11 = +[NSString stringWithFormat:@"%@://?%@=%@&%@=%@", @"x-maps-bulletin", @"MapsPushNotificationType", @"MapsPushNotifcationTypeProblemStatusChange", @"MapsPushNotificationPushData", v10];
    id v12 = +[NSURL URLWithString:v11];

    CFStringRef v19 = @"MapsNotificationType";
    uint64_t v20 = &off_10003C4C0;
    unsigned int v13 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    uint64_t v14 = [v6 body];
    CFStringRef v15 = [v14 stringValue];

    LOBYTE(v18) = 0;
    uint64_t v16 = [a1 requestWithTitle:v8 subtitle:0 message:v15 userInfo:v13 destinations:7 url:v12 categoryIdentifier:off_1000473D0[0] interruptionLevel:0 shouldIgnoreDoNotDisturb:v18];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (id)requestForSubmittedPhotosWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5
{
  CFStringRef v15 = @"MapsNotificationType";
  uint64_t v16 = &off_10003C4D8;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  LOBYTE(v14) = 0;
  id v12 = objc_msgSend(a1, "requestWithTitle:subtitle:message:userInfo:destinations:url:categoryIdentifier:interruptionLevel:shouldIgnoreDoNotDisturb:", v10, 0, v9, v11, 7, v8, off_1000473D8[0], 0, v14, v15, v16);

  return v12;
}

+ (id)requestForClearedPhotoAttributionNotificationWithTitle:(id)a3 message:(id)a4
{
  CFStringRef v16 = @"MapsNotificationType";
  uint64_t v17 = &off_10003C4F0;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  id v9 = objc_alloc_init((Class)NSURLComponents);
  [v9 setScheme:@"x-maps-bulletin"];
  [v9 setHost:&stru_100039AE0];
  id v10 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"MapsPushNotificationType" value:@"MapsPushNotificationTypeUGCPhotoCreditCleared"];
  id v18 = v10;
  id v11 = +[NSArray arrayWithObjects:&v18 count:1];
  [v9 setQueryItems:v11];

  id v12 = [v9 URL];

  LOBYTE(v15) = 0;
  unsigned int v13 = [a1 requestWithTitle:v7 subtitle:0 message:v6 userInfo:v8 destinations:7 url:v12 categoryIdentifier:off_1000473D8[0] interruptionLevel:0 shouldIgnoreDoNotDisturb:v15];

  return v13;
}

+ (id)requestForSharedTripIdentifier:(id)a3 state:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 initialNotificationSubtitle];
  id v9 = [v6 initialNotificationBody];
  id v10 = [a1 _requestForSharedTripIdentifier:v7 state:v6 title:&stru_100039AE0 subtitle:v8 message:v9 isUpdate:0];

  return v10;
}

+ (id)requestForUpdatingSharedTripIdentifier:(id)a3 state:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 updateNotificationSubtitle];
  id v9 = [v6 updateNotificationBody];
  id v10 = [a1 _requestForSharedTripIdentifier:v7 state:v6 title:&stru_100039AE0 subtitle:v8 message:v9 isUpdate:1];

  return v10;
}

+ (id)requestForChargingStopSharedTripIdentifier:(id)a3 state:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 chargingStopNotificationSubtitle];
  id v9 = [v6 chargingStopNotificationBody];
  id v10 = [a1 _requestForSharedTripIdentifier:v7 state:v6 title:&stru_100039AE0 subtitle:v8 message:v9 isUpdate:1];

  return v10;
}

+ (id)requestForIntermediateStopSharedTripIdentifier:(id)a3 state:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 intermediateArrivalNotificationSubtitle];
  id v9 = [v6 intermediateArrivalNotificationBody];
  id v10 = [a1 _requestForSharedTripIdentifier:v7 state:v6 title:&stru_100039AE0 subtitle:v8 message:v9 isUpdate:1];

  return v10;
}

+ (id)requestForResumeSharedTripIdentifier:(id)a3 state:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 waypointResumeNotificationSubtitle];
  id v9 = [v6 waypointResumeNotificationBody];
  id v10 = [a1 _requestForSharedTripIdentifier:v7 state:v6 title:&stru_100039AE0 subtitle:v8 message:v9 isUpdate:1];

  return v10;
}

+ (id)requestForArrivingSharedTripIdentifier:(id)a3 state:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 arrivalNotificationSubtitle];
  id v9 = [v6 arrivalNotificationBody];
  id v10 = [a1 _requestForSharedTripIdentifier:v7 state:v6 title:&stru_100039AE0 subtitle:v8 message:v9 isUpdate:1];

  return v10;
}

+ (id)_requestForSharedTripIdentifier:(id)a3 state:(id)a4 title:(id)a5 subtitle:(id)a6 message:(id)a7 isUpdate:(BOOL)a8
{
  BOOL v32 = a8;
  id v13 = a3;
  id v14 = a4;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  uint64_t v15 = [v14 etaInfo];
  [v15 etaTimestamp];
  double v17 = v16;
  GEOConfigGetDouble();
  CFStringRef v19 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v17 + v18];

  uint64_t v31 = [v14 data];
  uint64_t v20 = [v31 base64EncodedStringWithOptions:0];
  uint64_t v21 = +[NSString stringWithFormat:@"%@://?%@=%@&%@=%@", @"x-maps-bulletin", @"MapsPushNotificationType", @"MapsPushNotificationTypeSharedTrip", @"MapsPushNotificationPushData", v20];
  uint64_t v22 = +[NSURL URLWithString:v21];

  v36[0] = @"SharedTripIdentifier";
  v36[1] = @"MapsNotificationType";
  v37[0] = v13;
  v37[1] = &off_10003C508;
  uint64_t v23 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
  id v24 = [v23 mutableCopy];

  if ([v14 hasTransportType])
  {
    id v25 = [v14 transportType];
    if (v25 >= 7)
    {
      v26 = +[NSString stringWithFormat:@"(unknown: %i)", v25];
    }
    else
    {
      v26 = off_1000394A0[(int)v25];
    }
    [v24 setObject:v26 forKeyedSubscript:@"SharedTripTransportTypeString"];
  }
  uint64_t v27 = off_1000473E8;
  if (!v32) {
    uint64_t v27 = off_1000473E0;
  }
  LOBYTE(v30) = 0;
  uint64_t v28 = [a1 requestWithTitle:v35 subtitle:v34 message:v33 userInfo:v24 destinations:7 url:v22 expirationDate:v19 categoryIdentifier:*v27 threadIdentifier:v13 interruptionLevel:2 shouldIgnoreDoNotDisturb:v30];

  return v28;
}

- (NSString)sharedTripIdentifier
{
  return (NSString *)[(UNNotificationRequest *)self contextValueForKey:@"SharedTripIdentifier"];
}

- (NSString)sharedTripTransportTypeString
{
  return (NSString *)[(UNNotificationRequest *)self contextValueForKey:@"SharedTripTransportTypeString"];
}

+ (id)requestForDownloadedOfflineMapWithIdentifier:(id)a3 displayName:(id)a4
{
  id v5 = a4;
  id v6 = sub_10001D3F8();
  id v7 = [v6 localizedStringForKey:@"OFFLINE_MAP_DOWNLOADED_NOTIFICATION_TITLE" value:@"localized string not found" table:@"Offline"];

  id v8 = [v5 length];
  id v9 = sub_10001D3F8();
  id v10 = v9;
  if (v8)
  {
    uint64_t v11 = [v9 localizedStringForKey:@"OFFLINE_MAP_DOWNLOADED_NOTIFICATION_MESSAGE" value:@"localized string not found" table:@"Offline"];

    id v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v5);
    id v10 = (void *)v11;
  }
  else
  {
    id v12 = [v9 localizedStringForKey:@"OFFLINE_MAP_DOWNLOADED_NOTIFICATION_MESSAGE_NO_NAME" value:@"localized string not found" table:@"Offline"];
  }

  CFStringRef v18 = @"MapsNotificationType";
  CFStringRef v19 = &off_10003C520;
  id v13 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  id v14 = sub_1000208A4(0);
  LOBYTE(v17) = 0;
  uint64_t v15 = [a1 requestWithTitle:v7 subtitle:0 message:v12 userInfo:v13 destinations:7 url:v14 categoryIdentifier:kUNCategoryOfflineMapData[0] interruptionLevel:1 shouldIgnoreDoNotDisturb:v17];

  return v15;
}

+ (id)requestForExpiredOfflineMapsWithIdentifiers:(id)a3 displayNames:(id)a4 dueToNotBeingUsedWithinTimeInterval:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v10)
  {
    id v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v29;
LABEL_3:
    id v14 = 0;
    uint64_t v15 = v12;
    while (1)
    {
      if (*(void *)v29 != v13) {
        objc_enumerationMutation(v9);
      }
      id v12 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v28 + 1) + 8 * (void)v14)];

      if ([v12 length]) {
        break;
      }
      id v14 = (char *)v14 + 1;
      uint64_t v15 = v12;
      if (v11 == v14)
      {
        id v11 = [v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v12 = 0;
  }

  id v16 = [v9 count];
  uint64_t v17 = sub_10001D3F8();
  CFStringRef v18 = v17;
  if (v16 == (id)1 && v12)
  {
    CFStringRef v19 = [v17 localizedStringForKey:@"OFFLINE_MAPS_OPTIMIZE_STORAGE_REMOVED_NOTIFICATION_TITLE_SINGLE" value:@"localized string not found" table:@"Offline"];

    uint64_t v20 = sub_10001D3F8();
    uint64_t v21 = [v20 localizedStringForKey:@"OFFLINE_MAPS_OPTIMIZE_STORAGE_REMOVED_NOTIFICATION_MESSAGE_SINGLE_NAME" value:@"localized string not found" table:@"Offline"];
    uint64_t v22 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, v12);
  }
  else
  {
    CFStringRef v19 = [v17 localizedStringForKey:@"OFFLINE_MAPS_OPTIMIZE_STORAGE_REMOVED_NOTIFICATION_TITLE_MULTIPLE" value:@"localized string not found" table:@"Offline"];

    uint64_t v20 = sub_10001D3F8();
    uint64_t v22 = [v20 localizedStringForKey:@"OFFLINE_MAPS_OPTIMIZE_STORAGE_REMOVED_NOTIFICATION_MESSAGE_MULTIPLE" value:@"localized string not found" table:@"Offline"];
  }

  v32[0] = @"MapsNotificationType";
  v32[1] = off_1000473F8;
  v33[0] = &off_10003C538;
  v33[1] = @"not in use";
  uint64_t v23 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
  id v24 = sub_1000208A4(@"EXPIRED_MAPS");
  LOBYTE(v27) = 0;
  id v25 = [a1 requestWithTitle:v19 subtitle:0 message:v22 userInfo:v23 destinations:7 url:v24 categoryIdentifier:kUNCategoryOfflineMapData[0] interruptionLevel:1 shouldIgnoreDoNotDisturb:v27];

  return v25;
}

+ (id)requestForOfflineUnsupportedExpirationWithIdentifiers:(id)a3 displayNames:(id)a4 isOSVersionUnsupported:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v36;
LABEL_3:
    uint64_t v15 = 0;
    id v16 = v13;
    while (1)
    {
      if (*(void *)v36 != v14) {
        objc_enumerationMutation(v10);
      }
      uint64_t v13 = [v9 objectForKeyedSubscript:*(void *)(*((void *)&v35 + 1) + 8 * (void)v15)];

      if ([v13 length]) {
        break;
      }
      uint64_t v15 = (char *)v15 + 1;
      id v16 = v13;
      if (v12 == v15)
      {
        id v12 = [v10 countByEnumeratingWithState:&v35 objects:v41 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  BOOL v18 = [v10 count] == (id)1 && v13 != 0;
  CFStringRef v19 = sub_10001D3F8();
  uint64_t v20 = v19;
  if (v5)
  {
    if (v18)
    {
      uint64_t v21 = [v19 localizedStringForKey:@"OFFLINE_MAPS_UPDATE_REQUIRED_NOTIFICATION_TITLE_SINGLE" value:@"localized string not found" table:@"Offline"];

      uint64_t v22 = sub_10001D3F8();
      uint64_t v23 = v22;
      CFStringRef v24 = @"OFFLINE_MAPS_UPDATE_REQUIRED_NOTIFICATION_MESSAGE_SINGLE_NAME";
LABEL_22:
      id v25 = [v22 localizedStringForKey:v24 value:@"localized string not found" table:@"Offline"];
      v26 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v25, v13);

      goto LABEL_26;
    }
    uint64_t v21 = [v19 localizedStringForKey:@"OFFLINE_MAPS_UPDATE_REQUIRED_NOTIFICATION_TITLE_MULTIPLE" value:@"localized string not found" table:@"Offline"];

    uint64_t v27 = sub_10001D3F8();
    uint64_t v23 = v27;
    CFStringRef v28 = @"OFFLINE_MAPS_UPDATE_REQUIRED_NOTIFICATION_MESSAGE_MULTIPLE";
  }
  else
  {
    if (v18)
    {
      uint64_t v21 = [v19 localizedStringForKey:@"OFFLINE_MAPS_UNSUPPORTED_REGION_NOTIFICATION_TITLE_SINGLE" value:@"localized string not found" table:@"Offline"];

      uint64_t v22 = sub_10001D3F8();
      uint64_t v23 = v22;
      CFStringRef v24 = @"OFFLINE_MAPS_UNSUPPORTED_REGION_NOTIFICATION_MESSAGE_SINGLE_NAME";
      goto LABEL_22;
    }
    uint64_t v21 = [v19 localizedStringForKey:@"OFFLINE_MAPS_UNSUPPORTED_REGION_NOTIFICATION_TITLE_MULTIPLE" value:@"localized string not found" table:@"Offline"];

    uint64_t v27 = sub_10001D3F8();
    uint64_t v23 = v27;
    CFStringRef v28 = @"OFFLINE_MAPS_UNSUPPORTED_REGION_NOTIFICATION_MESSAGE_MULTIPLE";
  }
  v26 = [v27 localizedStringForKey:v28 value:@"localized string not found" table:@"Offline"];
LABEL_26:

  v39[0] = @"MapsNotificationType";
  v39[1] = off_1000473F8;
  v40[0] = &off_10003C538;
  v40[1] = @"regulatory";
  long long v29 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
  if (v5) {
    long long v30 = 0;
  }
  else {
    long long v30 = @"EXPIRED_MAPS";
  }
  long long v31 = sub_1000208A4(v30);
  LOBYTE(v34) = 0;
  BOOL v32 = [a1 requestWithTitle:v21 subtitle:0 message:v26 userInfo:v29 destinations:7 url:v31 categoryIdentifier:kUNCategoryOfflineMapData[0] interruptionLevel:1 shouldIgnoreDoNotDisturb:v34];

  return v32;
}

+ (id)requestForExpiredOfflineMapsWithIdentifiers:(id)a3 displayNames:(id)a4 dueToNotBeingUpdatedWithinTimeInterval:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v10)
  {
    id v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v29;
LABEL_3:
    uint64_t v14 = 0;
    uint64_t v15 = v12;
    while (1)
    {
      if (*(void *)v29 != v13) {
        objc_enumerationMutation(v9);
      }
      id v12 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v28 + 1) + 8 * (void)v14)];

      if ([v12 length]) {
        break;
      }
      uint64_t v14 = (char *)v14 + 1;
      uint64_t v15 = v12;
      if (v11 == v14)
      {
        id v11 = [v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v12 = 0;
  }

  id v16 = [v9 count];
  uint64_t v17 = sub_10001D3F8();
  BOOL v18 = v17;
  if (v16 == (id)1 && v12)
  {
    CFStringRef v19 = [v17 localizedStringForKey:@"OFFLINE_MAPS_UPDATE_REQUIRED_NOTIFICATION_TITLE_SINGLE" value:@"localized string not found" table:@"Offline"];

    uint64_t v20 = sub_10001D3F8();
    uint64_t v21 = [v20 localizedStringForKey:@"OFFLINE_MAPS_UPDATE_REQUIRED_NOTIFICATION_MESSAGE_SINGLE_NAME" value:@"localized string not found" table:@"Offline"];
    uint64_t v22 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, v12);
  }
  else
  {
    CFStringRef v19 = [v17 localizedStringForKey:@"OFFLINE_MAPS_UPDATE_REQUIRED_NOTIFICATION_TITLE_MULTIPLE" value:@"localized string not found" table:@"Offline"];

    uint64_t v20 = sub_10001D3F8();
    uint64_t v22 = [v20 localizedStringForKey:@"OFFLINE_MAPS_UPDATE_REQUIRED_NOTIFICATION_MESSAGE_MULTIPLE" value:@"localized string not found" table:@"Offline"];
  }

  v32[0] = @"MapsNotificationType";
  v32[1] = off_1000473F8;
  v33[0] = &off_10003C538;
  v33[1] = @"not updated";
  uint64_t v23 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
  CFStringRef v24 = sub_1000208A4(@"EXPIRED_MAPS");
  LOBYTE(v27) = 0;
  id v25 = [a1 requestWithTitle:v19 subtitle:0 message:v22 userInfo:v23 destinations:7 url:v24 categoryIdentifier:kUNCategoryOfflineMapData[0] interruptionLevel:1 shouldIgnoreDoNotDisturb:v27];

  return v25;
}

+ (id)requestForUpcomingOfflineMapsExpirationForIdentifiers:(id)a3 displayNames:(id)a4 unlessUpdatedByDate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v10)
  {
    id v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v29;
LABEL_3:
    uint64_t v14 = 0;
    uint64_t v15 = v12;
    while (1)
    {
      if (*(void *)v29 != v13) {
        objc_enumerationMutation(v9);
      }
      id v12 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v28 + 1) + 8 * (void)v14)];

      if ([v12 length]) {
        break;
      }
      uint64_t v14 = (char *)v14 + 1;
      uint64_t v15 = v12;
      if (v11 == v14)
      {
        id v11 = [v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v12 = 0;
  }

  id v16 = [v9 count];
  uint64_t v17 = sub_10001D3F8();
  BOOL v18 = v17;
  if (v16 == (id)1 && v12)
  {
    CFStringRef v19 = [v17 localizedStringForKey:@"OFFLINE_MAPS_UPCOMING_UPDATE_REQUIRED_NOTIFICATION_TITLE_SINGLE" value:@"localized string not found" table:@"Offline"];

    uint64_t v20 = sub_10001D3F8();
    uint64_t v21 = [v20 localizedStringForKey:@"OFFLINE_MAPS_UPCOMING_UPDATE_REQUIRED_NOTIFICATION_MESSAGE_SINGLE_NAME" value:@"localized string not found" table:@"Offline"];
    uint64_t v22 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, v12);
  }
  else
  {
    uint64_t v21 = [v17 localizedStringForKey:@"OFFLINE_MAPS_UPCOMING_UPDATE_REQUIRED_NOTIFICATION_TITLE_MULTIPLE" value:@"localized string not found" table:@"Offline"];

    uint64_t v20 = sub_10001D3F8();
    CFStringRef v19 = [v20 localizedStringForKey:@"OFFLINE_MAPS_UPCOMING_UPDATE_REQUIRED_NOTIFICATION_MESSAGE_MULTIPLE" value:@"localized string not found" table:@"Offline"];
    uint64_t v22 = 0;
  }

  v32[0] = @"MapsNotificationType";
  v32[1] = off_1000473F8;
  v33[0] = &off_10003C538;
  v33[1] = @"Will expire";
  uint64_t v23 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
  CFStringRef v24 = sub_1000208A4(0);
  LOBYTE(v27) = 0;
  id v25 = [a1 requestWithTitle:v19 subtitle:0 message:v22 userInfo:v23 destinations:7 url:v24 categoryIdentifier:kUNCategoryOfflineMapData[0] interruptionLevel:1 shouldIgnoreDoNotDisturb:v27];

  return v25;
}

+ (id)requestForOfflineDataIncompatibilityForIdentifiers:(id)a3 displayNames:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v28;
LABEL_3:
    uint64_t v13 = 0;
    uint64_t v14 = v11;
    while (1)
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v8);
      }
      id v11 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * (void)v13)];

      if ([v11 length]) {
        break;
      }
      uint64_t v13 = (char *)v13 + 1;
      uint64_t v14 = v11;
      if (v10 == v13)
      {
        id v10 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v11 = 0;
  }

  id v15 = [v8 count];
  id v16 = sub_10001D3F8();
  uint64_t v17 = v16;
  if (v15 == (id)1 && v11)
  {
    BOOL v18 = [v16 localizedStringForKey:@"OFFLINE_MAPS_UPDATE_REQUIRED_NOTIFICATION_TITLE_SINGLE" value:@"localized string not found" table:@"Offline"];

    CFStringRef v19 = sub_10001D3F8();
    uint64_t v20 = [v19 localizedStringForKey:@"OFFLINE_MAPS_UPDATE_REQUIRED_NOTIFICATION_MESSAGE_SINGLE_NAME" value:@"localized string not found" table:@"Offline"];
    uint64_t v21 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v11);
  }
  else
  {
    BOOL v18 = [v16 localizedStringForKey:@"OFFLINE_MAPS_UPDATE_REQUIRED_NOTIFICATION_TITLE_MULTIPLE" value:@"localized string not found" table:@"Offline"];

    CFStringRef v19 = sub_10001D3F8();
    uint64_t v21 = [v19 localizedStringForKey:@"OFFLINE_MAPS_UPDATE_REQUIRED_NOTIFICATION_MESSAGE_MULTIPLE" value:@"localized string not found" table:@"Offline"];
  }

  CFStringRef v31 = @"MapsNotificationType";
  BOOL v32 = &off_10003C550;
  uint64_t v22 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  uint64_t v23 = sub_1000208A4(0);
  LOBYTE(v26) = 0;
  CFStringRef v24 = [a1 requestWithTitle:v18 subtitle:0 message:v21 userInfo:v22 destinations:7 url:v23 categoryIdentifier:kUNCategoryOfflineMapData[0] interruptionLevel:1 shouldIgnoreDoNotDisturb:v26];

  return v24;
}

+ (id)requestForPairedDeviceStorageRequired:(unint64_t)a3 forSubscriptionIdentifiers:(id)a4 withDisplayNames:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSByteCountFormatter stringFromByteCount:(unint64_t)((double)(uint64_t)llround((double)a3 / 1000000.0) * 1000000.0) countStyle:2];
  if ([v8 count] == (id)1
    && ([v8 firstObject],
        id v11 = objc_claimAutoreleasedReturnValue(),
        [v9 objectForKeyedSubscript:v11],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        id v13 = [v12 length],
        v12,
        v11,
        v13))
  {
    uint64_t v14 = [v8 firstObject];
    id v15 = [v9 objectForKeyedSubscript:v14];

    id v16 = sub_10001D3F8();
    uint64_t v17 = [v16 localizedStringForKey:@"OFFLINE_MAPS_WATCH_INSUFFICIENT_STORAGE_NOTIFICATION_TITLE_SINGLE" value:@"localized string not found" table:@"Offline"];

    BOOL v18 = sub_10001D3F8();
    CFStringRef v19 = [v18 localizedStringForKey:@"OFFLINE_MAPS_WATCH_INSUFFICIENT_STORAGE_NOTIFICATION_MESSAGE_SINGLE" value:@"localized string not found" table:@"Offline"];
    uint64_t v20 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, v15, v10);
  }
  else
  {
    uint64_t v21 = sub_10001D3F8();
    uint64_t v17 = [v21 localizedStringForKey:@"OFFLINE_MAPS_WATCH_INSUFFICIENT_STORAGE_NOTIFICATION_TITLE_MULTIPLE" value:@"localized string not found" table:@"Offline"];

    id v15 = sub_10001D3F8();
    BOOL v18 = [v15 localizedStringForKey:@"OFFLINE_MAPS_WATCH_INSUFFICIENT_STORAGE_NOTIFICATION_MESSAGE_MULTIPLE" value:@"localized string not found" table:@"Offline"];
    uint64_t v20 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v10);
  }

  CFStringRef v27 = @"MapsNotificationType";
  long long v28 = &off_10003C568;
  uint64_t v22 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  uint64_t v23 = +[NSURL URLWithString:@"bridge:tab=SETTINGS&root=GENERAL_LINK&path=USAGE_LINK"];
  LOBYTE(v26) = 0;
  CFStringRef v24 = [a1 requestWithTitle:v17 subtitle:0 message:v20 userInfo:v22 destinations:7 url:v23 categoryIdentifier:kUNCategoryOfflineMapData[0] interruptionLevel:1 shouldIgnoreDoNotDisturb:v26];

  return v24;
}

@end