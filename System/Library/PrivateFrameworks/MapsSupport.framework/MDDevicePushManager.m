@interface MDDevicePushManager
- (BOOL)_shouldDisplayNotificationForProblemStatus:(id)a3;
- (MDDevicePushManager)initWithState:(id)a3;
- (id)devicePushToken;
- (void)_cleanupRAPNotifications;
- (void)clearRAPStatusChangeNotificationWithManager:(id)a3;
- (void)dealloc;
- (void)pushManager:(id)a3 gotPushData:(id)a4;
- (void)pushManager:(id)a3 receivedClearedPhotoAttributionNotificationWithTitle:(id)a4 message:(id)a5;
- (void)pushManager:(id)a3 receivedFixedProblemNotification:(id)a4 manifestToken:(id)a5;
- (void)pushManager:(id)a3 receivedPhotoLivenessMUID:(id)a4 title:(id)a5 message:(id)a6 actionURL:(id)a7;
- (void)pushManager:(id)a3 receivedRAPStatusChangeNotification:(id)a4;
- (void)simulateProblemResolution;
- (void)simulateRAPStatusChangeNotification;
- (void)simulateUGCPhotoAttributionClearedNotification;
- (void)simulateUGCPhotoSubmissionResolution;
@end

@implementation MDDevicePushManager

- (MDDevicePushManager)initWithState:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MDDevicePushManager;
  v6 = [(MDDevicePushManager *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_state, a3);
    v8 = objc_alloc_init(MapsPushManager);
    pushManager = v7->_pushManager;
    v7->_pushManager = v8;

    v10 = objc_alloc_init(RAPSubmissionStatusSyncHandler);
    syncHandler = v7->_syncHandler;
    v7->_syncHandler = v10;

    [(MapsPushManager *)v7->_pushManager setDelegate:v7];
    [(MDDevicePushManager *)v7 _cleanupRAPNotifications];
    [(MapsPushManager *)v7->_pushManager registerForMapsICloudPushTopic];
  }

  return v7;
}

- (void)dealloc
{
  [(MapsPushManager *)self->_pushManager setDelegate:0];
  pushManager = self->_pushManager;
  self->_pushManager = 0;

  v4.receiver = self;
  v4.super_class = (Class)MDDevicePushManager;
  [(MDDevicePushManager *)&v4 dealloc];
}

- (id)devicePushToken
{
  return [(MapsPushManager *)self->_pushManager devicePushToken];
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

- (BOOL)_shouldDisplayNotificationForProblemStatus:(id)a3
{
  v3 = [a3 details];
  unsigned int v4 = [v3 displayStyle];
  unsigned int v5 = (v4 < 6) & (0x36u >> v4);
  if ([v3 displayStyle] == 5 && (unint64_t)objc_msgSend(v3, "placesCount") <= 1) {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_cleanupRAPNotifications
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = +[NSFileManager defaultManager];
  v3 = +[RAPNotification notificationCachePath];
  unsigned int v4 = [v2 contentsOfDirectoryAtPath:v3 error:0];

  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (+[RAPNotification shouldDeleteNotificationWithID:v9])
        {
          +[RAPNotification deleteNotificationWithID:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)pushManager:(id)a3 gotPushData:(id)a4
{
  id v5 = a4;
  id v6 = [[SyncedBookmarkRepr alloc] initWithData:v5];
  if (v6)
  {
    uint64_t v7 = [(MDState *)self->_state notificationCenter];
    v8 = [v7 addPushedBookmark:v6];

    if (v8)
    {
      uint64_t v9 = [(MDState *)self->_state peerConnectionsLock];
      [v9 lock];

      long long v10 = [(MDState *)self->_state peerConnections];
      id v11 = [v10 copy];

      long long v12 = [(MDState *)self->_state peerConnectionsLock];
      [v12 unlock];

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v13 = v11;
      id v14 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v20;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v20 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "remoteObjectProxy", (void)v19);
            [v18 pushDaemonProxyReceivedNotificationData:v5 forType:@"MapsPushNotifcationTypePushToPhone" recordIdentifier:v8];
          }
          id v15 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v15);
      }
    }
  }
  else
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid data. Ignoring...", buf, 2u);
    }
  }
}

- (void)pushManager:(id)a3 receivedFixedProblemNotification:(id)a4 manifestToken:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 problemStatus];
  long long v10 = [v9 firstObject];

  if (!v10)
  {
    id v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error: no problem status found in notification.", buf, 2u);
    }
    goto LABEL_6;
  }
  if ([(MDDevicePushManager *)self _shouldDisplayNotificationForProblemStatus:v10])
  {
    [(RAPSubmissionStatusSyncHandler *)self->_syncHandler setFixedProblemAsReviewed:v7];
    id v11 = +[GEOResourceManifestManager modernManager];
    [v11 openServerConnection];

    long long v12 = +[GEOResourceManifestManager modernManager];
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_10000F848;
    v18 = &unk_100038F10;
    long long v19 = v7;
    long long v20 = self;
    [v12 setManifestToken:v8 completionHandler:&v15];

    id v13 = +[GEOPlaceCardRequester sharedRequester];
    [v13 clearCache];

    id v14 = v19;
LABEL_6:
  }
}

- (void)pushManager:(id)a3 receivedRAPStatusChangeNotification:(id)a4
{
  id v7 = a4;
  id v5 = [(MDState *)self->_state notificationCenter];
  id v6 = [v5 addRAPNotificationForProblemStatusChangeWithRapInfo:v7];
}

- (void)pushManager:(id)a3 receivedPhotoLivenessMUID:(id)a4 title:(id)a5 message:(id)a6 actionURL:(id)a7
{
  id v14 = a5;
  id v10 = a6;
  id v11 = a7;
  long long v12 = [(MDState *)self->_state notificationCenter];
  id v13 = [v12 addUGCPhotoNotificationWithTitle:v14 message:v10 actionURL:v11];
}

- (void)pushManager:(id)a3 receivedClearedPhotoAttributionNotificationWithTitle:(id)a4 message:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  id v8 = [(MDState *)self->_state notificationCenter];
  id v9 = [v8 addUGCClearedPhotoAttributionNotificationWithTitle:v10 message:v7];
}

- (void)clearRAPStatusChangeNotificationWithManager:(id)a3
{
  id v3 = [(MDState *)self->_state notificationCenter];
  [v3 clearNotificationsOfType:15];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncHandler, 0);
  objc_storeStrong((id *)&self->_pushManager, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end