@interface ARLocationSensorService
+ (id)serviceName;
- (ARLocationSensorService)initWithConnection:(id)a3;
- (id)updateFromDeviceOrientationData:(id)a3;
- (id)updateFromLocationData:(id)a3;
- (void)configureForReplay;
- (void)currentLocationWithReply:(id)a3;
- (void)lookupAltitudeAtCoordinate:(CLLocationCoordinate2D)a3 completionHandler:(id)a4;
- (void)sensor:(id)a3 didOutputSensorData:(id)a4;
- (void)updateARSessionState:(unint64_t)a3;
- (void)updateEstimationFromVIOPose:(id)a3 imageData:(id)a4;
- (void)updateFromVisualLocalizationResult:(id)a3;
@end

@implementation ARLocationSensorService

- (ARLocationSensorService)initWithConnection:(id)a3
{
  id v4 = a3;
  v5 = ARRemoteLocationSensorServiceInterface();
  v6 = ARRemoteLocationSensorClientInterface();
  v14.receiver = self;
  v14.super_class = (Class)ARLocationSensorService;
  v7 = [(ARDaemonService *)&v14 initWithConnection:v4 exportedInterface:v5 remoteObjectInterface:v6];

  if (v7)
  {
    v8 = [v4 remoteObjectProxy];
    [(ARSensorService *)v7 setClientProxy:v8];

    id v9 = objc_alloc(MEMORY[0x263F20EE0]);
    v10 = [(ARDaemonService *)v7 clientBundleIdentifier];
    v11 = (void *)[v9 initWithBundleIdentifier:v10];
    [(ARSensorService *)v7 setSensor:v11];

    v12 = [(ARSensorService *)v7 sensor];
    [v12 setDelegate:v7];
  }
  return v7;
}

- (void)configureForReplay
{
  id v2 = [(ARSensorService *)self sensor];
  [v2 configureForReplay];
}

- (void)currentLocationWithReply:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  v5 = [(ARSensorService *)self sensor];
  id v6 = [v5 currentLocation];

  v4[2](v4, v6, 0);
}

- (void)lookupAltitudeAtCoordinate:(CLLocationCoordinate2D)a3 completionHandler:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v7 = a4;
  id v8 = [(ARSensorService *)self sensor];
  objc_msgSend(v8, "lookupAltitudeAtCoordinate:completionHandler:", v7, latitude, longitude);
}

- (void)updateARSessionState:(unint64_t)a3
{
  id v4 = [(ARSensorService *)self sensor];
  [v4 updateARSessionState:a3];
}

- (void)updateEstimationFromVIOPose:(id)a3 imageData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ARSensorService *)self sensor];
  [v8 updateEstimationFromVIOPose:v7 imageData:v6];
}

- (void)updateFromVisualLocalizationResult:(id)a3
{
  id v4 = a3;
  id v5 = [(ARSensorService *)self sensor];
  [v5 updateFromVisualLocalizationResult:v4];
}

- (id)updateFromLocationData:(id)a3
{
  id v4 = a3;
  id v5 = [(ARSensorService *)self sensor];
  id v6 = [v5 updateFromLocationData:v4];

  return v6;
}

- (id)updateFromDeviceOrientationData:(id)a3
{
  id v4 = a3;
  id v5 = [(ARSensorService *)self sensor];
  id v6 = [v5 updateFromDeviceOrientationData:v4];

  return v6;
}

- (void)sensor:(id)a3 didOutputSensorData:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(ARDaemonService *)self dataSource];
    id v7 = [v6 service:self peerServiceOfType:objc_opt_class()];

    if (_ARLogDaemon_onceToken_3 != -1) {
      dispatch_once(&_ARLogDaemon_onceToken_3, &__block_literal_global_3);
    }
    id v8 = (void *)_ARLogDaemon_logObj_3;
    if (os_log_type_enabled((os_log_t)_ARLogDaemon_logObj_3, OS_LOG_TYPE_DEBUG))
    {
      id v9 = v8;
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544130;
      v16 = v11;
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 2048;
      v20 = v7;
      __int16 v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_24719A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: sensor:didOutputSensorData: - Calling processLocationData on geoTrackingTechniqueService (%p): %@", buf, 0x2Au);
    }
    id v12 = (id)[v7 processLocationData:v5];
  }
  v13 = [(ARSensorService *)self sensor];
  v14.receiver = self;
  v14.super_class = (Class)ARLocationSensorService;
  [(ARSensorService *)&v14 sensor:v13 didOutputSensorData:v5];
}

+ (id)serviceName
{
  return (id)*MEMORY[0x263F20E28];
}

@end