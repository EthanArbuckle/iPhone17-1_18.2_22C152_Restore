@interface NMCGizmoConnection
+ (id)sharedInstance;
+ (void)initializePairedDeviceRegistry;
- (BOOL)canSendMessageWithType:(int)a3;
- (BOOL)supportsTransportType:(int)a3;
- (BOOL)supportsXPCUseIPCForStartingCompanionNavigation;
- (BOOL)supportsXPCUseMapsForRoutePlanning;
- (NMCGizmoConnection)init;
- (NRDevice)activeDevice;
- (void)_updateActiveDevice;
- (void)dealloc;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setActiveDevice:(id)a3;
@end

@implementation NMCGizmoConnection

- (NMCGizmoConnection)init
{
  v8.receiver = self;
  v8.super_class = (Class)NMCGizmoConnection;
  v2 = [(NMDeviceConnection *)&v8 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_updateActiveDevice" name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];

    v4 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100037940;
    block[3] = &unk_100080F10;
    v7 = v2;
    dispatch_async(v4, block);
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];

  v4.receiver = self;
  v4.super_class = (Class)NMCGizmoConnection;
  [(NMCGizmoConnection *)&v4 dealloc];
}

+ (id)sharedInstance
{
  if (qword_10009B820 != -1) {
    dispatch_once(&qword_10009B820, &stru_100082380);
  }
  v2 = (void *)qword_10009B818;

  return v2;
}

+ (void)initializePairedDeviceRegistry
{
  if (qword_10009B810 != -1) {
    dispatch_once(&qword_10009B810, &stru_1000823A0);
  }
}

- (BOOL)canSendMessageWithType:(int)a3
{
  int v3 = a3 - 305;
  if ((a3 - 305) > 6 || ((0x59u >> v3) & 1) == 0) {
    return 1;
  }
  unint64_t v5 = qword_1000644B8[v3];
  return [(NMDeviceConnection *)self protocolVersion] > v5;
}

- (BOOL)supportsTransportType:(int)a3
{
  unint64_t v5 = [(NMCGizmoConnection *)self activeDevice];

  if (!v5) {
    return 0;
  }
  if (a3 != 3) {
    return a3 != 6;
  }
  if ([(NMDeviceConnection *)self protocolVersion] > 3) {
    return 1;
  }
  v7 = [(NMCGizmoConnection *)self activeDevice];
  objc_super v8 = [v7 valueForProperty:NRDevicePropertySystemVersion];

  BOOL v6 = [v8 compare:@"6.2" options:64] != (id)-1;
  return v6;
}

- (NRDevice)activeDevice
{
  v2 = self;
  objc_sync_enter(v2);
  activeDevice = v2->_activeDevice;
  if (!activeDevice)
  {
    objc_super v4 = +[NRPairedDeviceRegistry sharedInstance];
    uint64_t v5 = [v4 getActivePairedDevice];
    BOOL v6 = v2->_activeDevice;
    v2->_activeDevice = (NRDevice *)v5;

    activeDevice = v2->_activeDevice;
  }
  v7 = activeDevice;
  objc_sync_exit(v2);

  return v7;
}

- (void)setActiveDevice:(id)a3
{
  objc_super v4 = (NRDevice *)a3;
  obj = self;
  objc_sync_enter(obj);
  activeDevice = obj->_activeDevice;
  obj->_activeDevice = v4;

  objc_sync_exit(obj);
}

- (void)_updateActiveDevice
{
  id v4 = +[NRPairedDeviceRegistry sharedInstance];
  int v3 = [v4 getActivePairedDevice];
  [(NMCGizmoConnection *)self setActiveDevice:v3];
}

- (BOOL)supportsXPCUseMapsForRoutePlanning
{
  id v2 = [(NMCGizmoConnection *)self activeDevice];
  if (GEOConfigGetBOOL())
  {
    if (v2)
    {
      int v3 = [v2 valueForProperty:NRDevicePropertySystemVersion];
      BOOL v4 = [v3 compare:@"9.0" options:64] != (id)-1;
    }
    else
    {
      BOOL v4 = 1;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)supportsXPCUseIPCForStartingCompanionNavigation
{
  id v2 = [(NMCGizmoConnection *)self activeDevice];
  if (GEOConfigGetBOOL())
  {
    if (v2)
    {
      int v3 = [v2 valueForProperty:NRDevicePropertySystemVersion];
      BOOL v4 = [v3 compare:@"9.0" options:64] != (id)-1;
    }
    else
    {
      BOOL v4 = 1;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(NMCGizmoConnection *)self _updateActiveDevice];
  v8.receiver = self;
  v8.super_class = (Class)NMCGizmoConnection;
  [(NMDeviceConnection *)&v8 service:v7 devicesChanged:v6];
}

- (void).cxx_destruct
{
}

@end