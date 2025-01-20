@interface DAProximityManager
+ (id)sharedInstance;
- (BOOL)startProximitySensorUpdatesWithHandler:(id)a3;
- (BOOL)stopProximitySensorUpdates;
- (BOOL)updating;
- (DAProximityManager)init;
- (NSDictionary)sensorRegion;
- (__MTDevice)deviceRef;
- (id)handler;
- (void)dealloc;
- (void)deviceSetDataStream:(unsigned __int8)a3;
- (void)deviceStart;
- (void)deviceStop;
- (void)handleNewProximityValue:(int)a3;
- (void)registerProximityChangedCallback;
- (void)setDeviceRef:(__MTDevice *)a3;
- (void)setHandler:(id)a3;
- (void)setUpdating:(BOOL)a3;
- (void)unregisterProximityChangedCallback;
@end

@implementation DAProximityManager

+ (id)sharedInstance
{
  if (qword_1000BE100 != -1) {
    dispatch_once(&qword_1000BE100, &stru_100084B60);
  }
  v2 = (void *)qword_1000BE0F8;

  return v2;
}

- (DAProximityManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)DAProximityManager;
  v2 = [(DAProximityManager *)&v13 init];
  if (v2)
  {
    v2->_deviceRef = (__MTDevice *)MTDeviceCreateDefault();
    v2->_updating = 0;
    if (MTDeviceGetSensorRegionOfType())
    {
      sensorRegion = v2->_sensorRegion;
      v2->_sensorRegion = (NSDictionary *)&__NSDictionary0__struct;
    }
    else
    {
      v14[0] = @"sensorType";
      sensorRegion = +[NSNumber numberWithUnsignedChar:0];
      v15[0] = sensorRegion;
      v14[1] = @"startRow";
      v4 = +[NSNumber numberWithUnsignedChar:0];
      v15[1] = v4;
      v14[2] = @"rows";
      v5 = +[NSNumber numberWithUnsignedChar:0];
      v15[2] = v5;
      v14[3] = @"rowSkip";
      v6 = +[NSNumber numberWithUnsignedChar:0];
      v15[3] = v6;
      v14[4] = @"startCol";
      v7 = +[NSNumber numberWithUnsignedChar:0];
      v15[4] = v7;
      v14[5] = @"cols";
      v8 = +[NSNumber numberWithUnsignedChar:0];
      v15[5] = v8;
      v14[6] = @"hardwareColoffset";
      v9 = +[NSNumber numberWithUnsignedChar:0];
      v15[6] = v9;
      uint64_t v10 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:7];
      v11 = v2->_sensorRegion;
      v2->_sensorRegion = (NSDictionary *)v10;
    }
  }
  return v2;
}

- (void)dealloc
{
  deviceRef = self->_deviceRef;
  if (deviceRef) {
    CFRelease(deviceRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)DAProximityManager;
  [(DAProximityManager *)&v4 dealloc];
}

- (BOOL)startProximitySensorUpdatesWithHandler:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(DAProximityManager *)self updating];
  if ((v5 & 1) == 0)
  {
    [(DAProximityManager *)self deviceStart];
    [(DAProximityManager *)self registerProximityChangedCallback];
    [(DAProximityManager *)self setHandler:v4];
    [(DAProximityManager *)self setUpdating:1];
  }

  return v5 ^ 1;
}

- (void)handleNewProximityValue:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned __int8 v5 = [(DAProximityManager *)self handler];
  id v4 = +[NSDate date];
  v5[2](v5, v3, v4);
}

- (BOOL)stopProximitySensorUpdates
{
  BOOL v3 = [(DAProximityManager *)self updating];
  if (v3)
  {
    [(DAProximityManager *)self deviceStop];
    [(DAProximityManager *)self unregisterProximityChangedCallback];
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self];

    [(DAProximityManager *)self setUpdating:0];
    [(DAProximityManager *)self setHandler:0];
  }
  return v3;
}

- (void)deviceStart
{
  [(DAProximityManager *)self deviceRef];
  MTDeviceStart();

  [(DAProximityManager *)self deviceSetDataStream:1];
}

- (void)deviceStop
{
  [(DAProximityManager *)self deviceRef];
  MTDeviceStop();

  [(DAProximityManager *)self deviceSetDataStream:2];
}

- (void)registerProximityChangedCallback
{
  v2 = [(DAProximityManager *)self deviceRef];

  _MTRegisterOpticalProximityChangedCallback(v2, sub_100029738, 0);
}

- (void)unregisterProximityChangedCallback
{
  v2 = [(DAProximityManager *)self deviceRef];

  _MTUnregisterOpticalProximityChangedCallback(v2, sub_100029738);
}

- (void)deviceSetDataStream:(unsigned __int8)a3
{
}

- (NSDictionary)sensorRegion
{
  return self->_sensorRegion;
}

- (BOOL)updating
{
  return self->_updating;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

- (__MTDevice)deviceRef
{
  return self->_deviceRef;
}

- (void)setDeviceRef:(__MTDevice *)a3
{
  self->_deviceRef = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_sensorRegion, 0);
}

@end