@interface DAOpticalProximityManager
+ (id)sharedInstance;
- (BOOL)isUpdating;
- (BOOL)opticalSensorPresent;
- (BOOL)startProximitySensorUpdatesWithHandler:(id)a3;
- (BOOL)stopProximitySensorUpdates;
- (DAOpticalProximityManager)init;
- (__MTDevice)deviceRef;
- (id)handler;
- (id)sensorData;
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

@implementation DAOpticalProximityManager

+ (id)sharedInstance
{
  if (qword_100011C88 != -1) {
    dispatch_once(&qword_100011C88, &stru_10000C410);
  }
  v2 = (void *)qword_100011C80;

  return v2;
}

- (DAOpticalProximityManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)DAOpticalProximityManager;
  v2 = [(DAOpticalProximityManager *)&v4 init];
  if (v2)
  {
    v2->_deviceRef = (__MTDevice *)MTDeviceCreateDefault();
    v2->_updating = 0;
  }
  return v2;
}

- (void)dealloc
{
  if ([(DAOpticalProximityManager *)self deviceRef]) {
    CFRelease([(DAOpticalProximityManager *)self deviceRef]);
  }
  v3.receiver = self;
  v3.super_class = (Class)DAOpticalProximityManager;
  [(DAOpticalProximityManager *)&v3 dealloc];
}

- (BOOL)opticalSensorPresent
{
  return MTDeviceGetSensorRegionOfType() == 0;
}

- (id)sensorData
{
  if ([(DAOpticalProximityManager *)self deviceRef] && !MTDeviceGetSensorRegionOfType())
  {
    v11[0] = @"sensorType";
    objc_super v3 = +[NSNumber numberWithUnsignedChar:0];
    v12[0] = v3;
    v11[1] = @"startRow";
    objc_super v4 = +[NSNumber numberWithUnsignedChar:0];
    v12[1] = v4;
    v11[2] = @"rows";
    v5 = +[NSNumber numberWithUnsignedChar:0];
    v12[2] = v5;
    v11[3] = @"rowSkip";
    v6 = +[NSNumber numberWithUnsignedChar:0];
    v12[3] = v6;
    v11[4] = @"startCol";
    v7 = +[NSNumber numberWithUnsignedChar:0];
    v12[4] = v7;
    v11[5] = @"cols";
    v8 = +[NSNumber numberWithUnsignedChar:0];
    v12[5] = v8;
    v11[6] = @"hardwareColoffset";
    v9 = +[NSNumber numberWithUnsignedChar:0];
    v12[6] = v9;
    v2 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:7];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)startProximitySensorUpdatesWithHandler:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(DAOpticalProximityManager *)self isUpdating];
  if ((v5 & 1) == 0)
  {
    [(DAOpticalProximityManager *)self deviceStart];
    [(DAOpticalProximityManager *)self registerProximityChangedCallback];
    [(DAOpticalProximityManager *)self setUpdating:1];
    [(DAOpticalProximityManager *)self setHandler:v4];
  }

  return v5 ^ 1;
}

- (BOOL)stopProximitySensorUpdates
{
  BOOL v3 = [(DAOpticalProximityManager *)self isUpdating];
  if (v3)
  {
    [(DAOpticalProximityManager *)self deviceStop];
    [(DAOpticalProximityManager *)self unregisterProximityChangedCallback];
    [(DAOpticalProximityManager *)self setUpdating:0];
    [(DAOpticalProximityManager *)self setHandler:0];
  }
  return v3;
}

- (void)deviceStart
{
  [(DAOpticalProximityManager *)self deviceRef];
  MTDeviceStart();

  [(DAOpticalProximityManager *)self deviceSetDataStream:1];
}

- (void)deviceStop
{
  [(DAOpticalProximityManager *)self deviceRef];
  MTDeviceStop();

  [(DAOpticalProximityManager *)self deviceSetDataStream:2];
}

- (void)deviceSetDataStream:(unsigned __int8)a3
{
}

- (void)registerProximityChangedCallback
{
  v2 = [(DAOpticalProximityManager *)self deviceRef];

  _MTRegisterOpticalProximityChangedCallback(v2, MTProximityChangedCallbackFunc, 0);
}

- (void)unregisterProximityChangedCallback
{
  v2 = [(DAOpticalProximityManager *)self deviceRef];

  _MTUnregisterOpticalProximityChangedCallback(v2, MTProximityChangedCallbackFunc);
}

- (void)handleNewProximityValue:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned __int8 v5 = [(DAOpticalProximityManager *)self handler];
  id v4 = +[NSDate date];
  v5[2](v5, v3, v4);
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

- (BOOL)isUpdating
{
  return self->_updating;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

- (void).cxx_destruct
{
}

@end