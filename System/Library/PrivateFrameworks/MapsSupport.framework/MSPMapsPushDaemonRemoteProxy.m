@interface MSPMapsPushDaemonRemoteProxy
+ (MSPMapsPushDaemonRemoteProxy)sharedInstance;
- (MSPMapsPushDaemonRemoteProxy)init;
- (id)_connection;
- (id)_remoteObjectProxy;
- (void)_clearConnection;
- (void)_connectToDaemonIfNeeded;
- (void)addObserver:(id)a3;
- (void)clearAirportArrivalBulletin;
- (void)clearBulletinWithRecordID:(id)a3;
- (void)clearCurrentAnnouncement;
- (void)clearLowFuelAlertBulletin;
- (void)clearMapsSuggestionsBulletin;
- (void)clearParkedCarBulletin;
- (void)clearPredictedRouteTrafficIncidentBulletin;
- (void)clearTrafficIncidentBulletinWithAlertID:(id)a3;
- (void)clearVenueBulletin;
- (void)closeConnection;
- (void)fetchCurrentAnnouncement:(id)a3;
- (void)fetchDevicePushToken:(id)a3;
- (void)handleMapsApplicationRemoval:(id)a3;
- (void)pushDaemonProxyReceivedNotificationData:(id)a3 forType:(id)a4 recordIdentifier:(id)a5;
- (void)removeObserver:(id)a3;
- (void)resetAnnouncements;
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
@end

@implementation MSPMapsPushDaemonRemoteProxy

void __57__MSPMapsPushDaemonRemoteProxy_fetchCurrentAnnouncement___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__MSPMapsPushDaemonRemoteProxy_fetchCurrentAnnouncement___block_invoke_2;
  v6[3] = &unk_1E617D7A0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

+ (MSPMapsPushDaemonRemoteProxy)sharedInstance
{
  if (qword_1EB7F45D8 != -1) {
    dispatch_once(&qword_1EB7F45D8, &__block_literal_global_8);
  }
  v2 = (void *)_MergedGlobals_41;

  return (MSPMapsPushDaemonRemoteProxy *)v2;
}

- (void)fetchCurrentAnnouncement:(id)a3
{
  id v4 = a3;
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v5 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__MSPMapsPushDaemonRemoteProxy_fetchCurrentAnnouncement___block_invoke;
    v6[3] = &unk_1E617D7C8;
    id v7 = v4;
    [v5 fetchCurrentAnnouncement:v6];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (id)_remoteObjectProxy
{
  v2 = [(MSPMapsPushDaemonRemoteProxy *)self _connection];
  id v3 = [v2 remoteObjectProxy];

  return v3;
}

- (id)_connection
{
  [(MSPMapsPushDaemonRemoteProxy *)self _connectToDaemonIfNeeded];
  id v3 = self;
  objc_sync_enter(v3);
  id v4 = v3->_connection;
  objc_sync_exit(v3);

  return v4;
}

- (void)_connectToDaemonIfNeeded
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_connection)
  {
    objc_initWeak(&location, v2);
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.Maps.mapspushd" options:0];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F120F7D8];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    [v5 setClasses:v8 forSelector:sel_fetchCurrentAnnouncement_ argumentIndex:0 ofReply:1];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];
    v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F120F328];
    [(NSXPCConnection *)v2->_connection setExportedInterface:v9];

    v10 = [[MSPMapsPushDaemonRemoteXPCProxy alloc] initWithObserver:v2];
    [(NSXPCConnection *)v2->_connection setExportedObject:v10];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__MSPMapsPushDaemonRemoteProxy__connectToDaemonIfNeeded__block_invoke;
    v13[3] = &unk_1E617C9A8;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)v2->_connection setInterruptionHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__MSPMapsPushDaemonRemoteProxy__connectToDaemonIfNeeded__block_invoke_2;
    v11[3] = &unk_1E617C9A8;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:v11];
    [(NSXPCConnection *)v2->_connection resume];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers addObject:v5];
  objc_sync_exit(v4);
}

uint64_t __57__MSPMapsPushDaemonRemoteProxy_fetchCurrentAnnouncement___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __46__MSPMapsPushDaemonRemoteProxy_sharedInstance__block_invoke()
{
  _MergedGlobals_41 = objc_alloc_init(MSPMapsPushDaemonRemoteProxy);

  return MEMORY[0x1F41817F8]();
}

- (MSPMapsPushDaemonRemoteProxy)init
{
  v7.receiver = self;
  v7.super_class = (Class)MSPMapsPushDaemonRemoteProxy;
  v2 = [(MSPMapsPushDaemonRemoteProxy *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    id v5 = v2;
  }

  return v2;
}

- (void)closeConnection
{
  obj = self;
  objc_sync_enter(obj);
  [(NSXPCConnection *)obj->_connection invalidate];
  connection = obj->_connection;
  obj->_connection = 0;

  objc_sync_exit(obj);
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers removeObject:v5];
  objc_sync_exit(v4);
}

void __56__MSPMapsPushDaemonRemoteProxy__connectToDaemonIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _clearConnection];
}

void __56__MSPMapsPushDaemonRemoteProxy__connectToDaemonIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _clearConnection];
}

- (void)_clearConnection
{
  obj = self;
  objc_sync_enter(obj);
  [(NSXPCConnection *)obj->_connection invalidate];
  connection = obj->_connection;
  obj->_connection = 0;

  objc_sync_exit(obj);
}

- (void)simulateProblemResolution
{
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v3 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v3 simulateProblemResolution];
  }
}

- (void)simulateUGCPhotoSubmissionResolution
{
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v3 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v3 simulateUGCPhotoSubmissionResolution];
  }
}

- (void)simulateUGCPhotoAttributionClearedNotification
{
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v3 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v3 simulateUGCPhotoAttributionClearedNotification];
  }
}

- (void)simulateRAPStatusChangeNotification
{
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v3 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v3 simulateRAPStatusChangeNotification];
  }
}

- (void)fetchDevicePushToken:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v4 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v4 fetchDevicePushToken:v5];
  }
  else
  {
    v5[2](v5, 0);
  }
}

- (void)clearCurrentAnnouncement
{
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v3 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v3 clearCurrentAnnouncement];
  }
}

- (void)resetAnnouncements
{
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v3 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v3 resetAnnouncements];
  }
}

- (void)clearBulletinWithRecordID:(id)a3
{
  id v5 = a3;
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v4 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v4 clearBulletinWithRecordID:v5];
  }
}

- (void)showMapsSuggestionsBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    v10 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v10 showMapsSuggestionsBulletinWithTitle:v11 message:v8 actionURL:v9];
  }
}

- (void)clearMapsSuggestionsBulletin
{
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v3 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v3 clearMapsSuggestionsBulletin];
  }
}

- (void)showAirportArrivalBulletinWithTitle:(id)a3 message:(id)a4 mapRegion:(id)a5 regionName:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    v13 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v13 showAirportArrivalBulletinWithTitle:v14 message:v10 mapRegion:v11 regionName:v12];
  }
}

- (void)clearAirportArrivalBulletin
{
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v3 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v3 clearMapsSuggestionsBulletin];
  }
}

- (void)showVenueBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v10 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v10 showMapsSuggestionsBulletinWithTitle:v11 message:v8 actionURL:v9];
  }
}

- (void)clearVenueBulletin
{
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v3 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v3 clearMapsSuggestionsBulletin];
  }
}

- (void)showTrafficIncidentAlertWithID:(id)a3 withReroute:(BOOL)a4 title:(id)a5 description:(id)a6
{
  BOOL v8 = a4;
  id v13 = a3;
  id v10 = a5;
  id v11 = a6;
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v12 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v12 showTrafficIncidentAlertWithID:v13 withReroute:v8 title:v10 description:v11];
  }
}

- (void)clearTrafficIncidentBulletinWithAlertID:(id)a3
{
  id v5 = a3;
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v4 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v4 clearTrafficIncidentBulletinWithAlertID:v5];
  }
}

- (void)showPredictedRouteTrafficIncidentBulletinForCommuteDetails:(id)a3
{
  id v5 = a3;
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v4 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v4 showPredictedRouteTrafficIncidentBulletinForCommuteDetails:v5];
  }
}

- (void)clearPredictedRouteTrafficIncidentBulletin
{
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v3 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v3 clearPredictedRouteTrafficIncidentBulletin];
  }
}

- (void)showLowFuelAlertBulletinForLowFuelDetails:(id)a3
{
  id v5 = a3;
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v4 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v4 showLowFuelAlertBulletinForLowFuelDetails:v5];
  }
}

- (void)clearLowFuelAlertBulletin
{
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v3 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v3 clearLowFuelAlertBulletin];
  }
}

- (void)showParkedCarBulletinForEvent:(id)a3
{
  id v5 = a3;
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v4 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v4 showParkedCarBulletinForEvent:v5];
  }
}

- (void)showParkedCarReplacementBulletinForEvent:(id)a3 replacingEvent:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    objc_super v7 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v7 showParkedCarReplacementBulletinForEvent:v8 replacingEvent:v6];
  }
}

- (void)clearParkedCarBulletin
{
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v3 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v3 clearParkedCarBulletin];
  }
}

- (void)handleMapsApplicationRemoval:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v4 = [(MSPMapsPushDaemonRemoteProxy *)self _remoteObjectProxy];
    [v4 handleMapsApplicationRemoval:v5];
  }
  else
  {
    v5[2](v5, 0);
  }
}

- (void)pushDaemonProxyReceivedNotificationData:(id)a3 forType:(id)a4 recordIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v11 = self;
    objc_sync_enter(v11);
    id v12 = [(NSHashTable *)v11->_observers allObjects];
    objc_sync_exit(v11);

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __97__MSPMapsPushDaemonRemoteProxy_pushDaemonProxyReceivedNotificationData_forType_recordIdentifier___block_invoke;
    v14[3] = &unk_1E617C5B0;
    id v15 = v12;
    id v16 = v8;
    id v17 = v9;
    id v18 = v10;
    id v13 = v12;
    dispatch_async(MEMORY[0x1E4F14428], v14);
  }
}

void __97__MSPMapsPushDaemonRemoteProxy_pushDaemonProxyReceivedNotificationData_forType_recordIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "pushDaemonProxyReceivedNotificationData:forType:recordIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end