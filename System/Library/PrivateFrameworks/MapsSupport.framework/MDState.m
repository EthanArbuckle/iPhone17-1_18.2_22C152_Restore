@interface MDState
+ (id)getDefault:(id)a3;
+ (void)setDefault:(id)a3 value:(id)a4;
- (MDLocationManager)locationManager;
- (MDNotificationCenter)notificationCenter;
- (MDState)init;
- (NSLock)peerConnectionsLock;
- (NSMutableArray)peerConnections;
- (void)setLocationManager:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setPeerConnections:(id)a3;
- (void)setPeerConnectionsLock:(id)a3;
@end

@implementation MDState

- (MDState)init
{
  v8.receiver = self;
  v8.super_class = (Class)MDState;
  v2 = [(MDState *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    peerConnections = v2->_peerConnections;
    v2->_peerConnections = v3;

    v5 = (NSLock *)objc_alloc_init((Class)NSLock);
    peerConnectionsLock = v2->_peerConnectionsLock;
    v2->_peerConnectionsLock = v5;
  }
  return v2;
}

- (NSMutableArray)peerConnections
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_peerConnections;
  objc_sync_exit(v2);

  return v3;
}

- (NSLock)peerConnectionsLock
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_peerConnectionsLock;
  objc_sync_exit(v2);

  return v3;
}

- (MDLocationManager)locationManager
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_locationManager;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLocationManager:(id)a3
{
  v4 = (MDLocationManager *)a3;
  obj = self;
  objc_sync_enter(obj);
  locationManager = obj->_locationManager;
  obj->_locationManager = v4;

  objc_sync_exit(obj);
}

- (MDNotificationCenter)notificationCenter
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_notificationCenter;
  objc_sync_exit(v2);

  return v3;
}

- (void)setNotificationCenter:(id)a3
{
  v4 = (MDNotificationCenter *)a3;
  obj = self;
  objc_sync_enter(obj);
  notificationCenter = obj->_notificationCenter;
  obj->_notificationCenter = v4;

  objc_sync_exit(obj);
}

+ (id)getDefault:(id)a3
{
  id v3 = a3;
  if (+[GEOKeyBagNotification canAccessFilesWithProtection:3])
  {
    v4 = +[NSFileManager defaultManager];
    v5 = [v4 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.Maps"];
    v6 = [v5 path];
    v7 = (void *)_CFPreferencesCopyAppValueWithContainer();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)setDefault:(id)a3 value:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  if (+[GEOKeyBagNotification canAccessFilesWithProtection:3])
  {
    v6 = +[NSFileManager defaultManager];
    v7 = [v6 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.Maps"];
    objc_super v8 = [v7 path];
    _CFPreferencesSetAppValueWithContainer();
  }
}

- (void)setPeerConnections:(id)a3
{
}

- (void)setPeerConnectionsLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_peerConnectionsLock, 0);

  objc_storeStrong((id *)&self->_peerConnections, 0);
}

@end