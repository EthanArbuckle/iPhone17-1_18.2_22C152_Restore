@interface MDGeoServicesServer
- (MDGeoServicesServer)initWithNotificationCenter:(id)a3;
- (void)clearIncompatibleOfflineDataNotification;
- (void)dealloc;
- (void)expiredOfflineSubscriptions:(id)a3 withDisplayNames:(id)a4 forReason:(int64_t)a5;
- (void)finishedDownloadingOfflineSubscription:(id)a3 withDisplayName:(id)a4 willSyncToPairedDevice:(BOOL)a5;
- (void)geodInternalErrorNotification:(int64_t)a3;
- (void)geodProxyAuthFailedNotification:(int64_t)a3;
- (void)notifyForIncompatibleOfflineDataVersionsForIdentifiers:(id)a3 displayNames:(id)a4 completionHandler:(id)a5;
- (void)pairedDeviceHasInsufficientDiskSpace:(unint64_t)a3 forSubscriptions:(id)a4 withDisplayNames:(id)a5;
- (void)willExpireOfflineSubscriptionsWithIdentifiers:(id)a3 displayNames:(id)a4 unlessUpdatedByDate:(id)a5 completionHandler:(id)a6;
@end

@implementation MDGeoServicesServer

- (MDGeoServicesServer)initWithNotificationCenter:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MDGeoServicesServer;
  v6 = [(MDGeoServicesServer *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notificationCenter, a3);
    v8 = [[NotificationFromGEODHandler alloc] initWithDelegate:v7];
    notificationFromGEODHandler = v7->_notificationFromGEODHandler;
    v7->_notificationFromGEODHandler = v8;

    [(NotificationFromGEODHandler *)v7->_notificationFromGEODHandler resume];
  }

  return v7;
}

- (void)dealloc
{
  [(NotificationFromGEODHandler *)self->_notificationFromGEODHandler setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MDGeoServicesServer;
  [(MDGeoServicesServer *)&v3 dealloc];
}

- (void)geodInternalErrorNotification:(int64_t)a3
{
  id v5 = +[GEOPlatform sharedPlatform];
  unsigned int v6 = [v5 isInternalInstall];

  if (v6)
  {
    switch(a3)
    {
      case -1001:
        CFStringRef v7 = @"The VPN connection appears to be failing. Can not change to new environment.";
        break;
      case 0:
        return;
      case -1000:
        CFStringRef v7 = @"The VPN connection appears to be failing. Some Maps endpoints will not be reachable.";
        break;
      default:
        CFStringRef v7 = @"Unknown error";
        break;
    }
    id v8 = [(MDNotificationCenter *)self->_notificationCenter addGeoDInternalNotificationWithTitle:@"GeoD Internal (only) Error" subtitle:v7];
  }
}

- (void)geodProxyAuthFailedNotification:(int64_t)a3
{
  switch(a3)
  {
    case -1:
      CFStringRef v5 = @"Proxy auth invalid failure reason";
      goto LABEL_10;
    case 0:
      CFStringRef v5 = @"Auth proxy failure for unknown reasons";
      goto LABEL_10;
    case 1:
      CFStringRef v5 = @"Invalid token, going to attempt refresh";
      goto LABEL_10;
    case 2:
      CFStringRef v5 = @"Tap here to authenticate with AppleConnect";
      CFStringRef v6 = @"No Valid Authentication Session";
      goto LABEL_11;
    case 3:
      CFStringRef v5 = @"You do not have permissions to access this environment";
      goto LABEL_10;
    case 4:
      CFStringRef v5 = @"You are missing group access to the current environment";
      goto LABEL_10;
    case 5:
      CFStringRef v5 = @"Your environment does not have the proper URL(s)";
      goto LABEL_10;
    case 6:
      return;
    default:
      CFStringRef v5 = @"Tap here to authenticate with AppleConnect";
LABEL_10:
      CFStringRef v6 = @"Proxy Authentication Failed";
LABEL_11:
      id v7 = -[MDNotificationCenter addProxyAuthFailedNotificationWithTitle:subtitle:](self->_notificationCenter, "addProxyAuthFailedNotificationWithTitle:subtitle:", v6, v5, v3, v4);
      return;
  }
}

- (void)finishedDownloadingOfflineSubscription:(id)a3 withDisplayName:(id)a4 willSyncToPairedDevice:(BOOL)a5
{
  if (a5) {
    CFStringRef v7 = @"watch pending";
  }
  else {
    CFStringRef v7 = 0;
  }
  id v8 = a4;
  id v9 = a3;
  +[GEOAPPortal captureUserAction:370 target:0 value:v7];
  [(MDNotificationCenter *)self->_notificationCenter addOfflineMapDownloadedNotificationForIdentifier:v9 displayName:v8];
}

- (void)expiredOfflineSubscriptions:(id)a3 withDisplayNames:(id)a4 forReason:(int64_t)a5
{
  id v11 = a3;
  id v8 = a4;
  CFStringRef v9 = @"not in use";
  switch(a5)
  {
    case 1:
    case 2:
      goto LABEL_4;
    case 3:
      +[GEOAPPortal captureUserAction:373 target:0 value:@"regulatory"];
      [(MDNotificationCenter *)self->_notificationCenter addOfflineMapsRegulatoryRegionExpirationNotificationForIdentifiers:v11 displayNames:v8];
      goto LABEL_11;
    case 4:
      +[GEOAPPortal captureUserAction:373 target:0 value:@"not updated"];
      [(MDNotificationCenter *)self->_notificationCenter addOfflineMapsExpiredNotificationForIdentifiers:v11 displayNames:v8 dueToNotBeingUpdatedWithinTimeInterval:(double)(unint64_t)GEOConfigGetUint64()];
      goto LABEL_11;
    case 5:
      +[GEOAPPortal captureUserAction:373 target:0 value:@"unsupported"];
      [(MDNotificationCenter *)self->_notificationCenter addOfflineMapsUnsupportedExpirationNotificationForIdentifiers:v11 displayNames:v8];
      goto LABEL_11;
    default:
      CFStringRef v9 = @"<unknown>";
LABEL_4:
      +[GEOAPPortal captureUserAction:373 target:0 value:v9];
      if (a5 == 2)
      {
        notificationCenter = self->_notificationCenter;
      }
      else
      {
        if (a5 != 1) {
          goto LABEL_11;
        }
        notificationCenter = self->_notificationCenter;
      }
      [(MDNotificationCenter *)notificationCenter addOfflineMapsExpiredNotificationForIdentifiers:v11 displayNames:v8 dueToNotBeingUsedWithinTimeInterval:(double)(unint64_t)GEOConfigGetUint64()];
LABEL_11:

      return;
  }
}

- (void)willExpireOfflineSubscriptionsWithIdentifiers:(id)a3 displayNames:(id)a4 unlessUpdatedByDate:(id)a5 completionHandler:(id)a6
{
}

- (void)notifyForIncompatibleOfflineDataVersionsForIdentifiers:(id)a3 displayNames:(id)a4 completionHandler:(id)a5
{
}

- (void)clearIncompatibleOfflineDataNotification
{
}

- (void)pairedDeviceHasInsufficientDiskSpace:(unint64_t)a3 forSubscriptions:(id)a4 withDisplayNames:(id)a5
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);

  objc_storeStrong((id *)&self->_notificationFromGEODHandler, 0);
}

@end