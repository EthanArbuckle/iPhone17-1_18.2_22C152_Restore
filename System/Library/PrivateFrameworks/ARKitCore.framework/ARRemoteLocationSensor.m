@interface ARRemoteLocationSensor
- (ARLocationData)currentLocation;
- (ARRemoteLocationSensor)init;
- (ARRemoteLocationSensor)initWithServerConnection:(id)a3;
- (id)updateFromLocationData:(id)a3;
- (unint64_t)providedDataTypes;
- (void)configureForReplay;
- (void)lookupAltitudeAtCoordinate:(CLLocationCoordinate2D)a3 completionHandler:(id)a4;
- (void)updateARSessionState:(unint64_t)a3;
- (void)updateEstimationFromVIOPose:(id)a3 imageData:(id)a4;
- (void)updateFromVisualLocalizationResult:(id)a3;
@end

@implementation ARRemoteLocationSensor

- (ARRemoteLocationSensor)init
{
  v3.receiver = self;
  v3.super_class = (Class)ARRemoteLocationSensor;
  return [(ARRemoteSensor *)&v3 initWithServiceName:@"com.apple.arkit.service.location"];
}

- (ARRemoteLocationSensor)initWithServerConnection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARRemoteLocationSensor;
  v5 = [(ARRemoteSensor *)&v9 initWithServerConnection:v4];
  if (v5)
  {
    v6 = ARRemoteLocationSensorClientInterface();
    [v4 setExportedInterface:v6];

    v7 = ARRemoteLocationSensorServiceInterface();
    [v4 setRemoteObjectInterface:v7];
  }
  return v5;
}

- (void)configureForReplay
{
  objc_super v3 = [(ARRemoteSensor *)self serverConnection];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__ARRemoteLocationSensor_configureForReplay__block_invoke;
  v5[3] = &unk_1E6185C00;
  v5[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v5];

  [v4 configureForReplay];
}

void __44__ARRemoteLocationSensor_configureForReplay__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _ARLogSensor_7();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543874;
    objc_super v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Failed to send data to service - error: %@", (uint8_t *)&v8, 0x20u);
  }
}

- (ARLocationData)currentLocation
{
  uint64_t v9 = 0;
  __int16 v10 = &v9;
  uint64_t v11 = 0x3032000000;
  __int16 v12 = __Block_byref_object_copy__4;
  id v13 = __Block_byref_object_dispose__4;
  id v14 = 0;
  id v3 = [(ARRemoteSensor *)self serverConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__ARRemoteLocationSensor_currentLocation__block_invoke;
  v8[3] = &unk_1E6185C00;
  v8[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__ARRemoteLocationSensor_currentLocation__block_invoke_82;
  v7[3] = &unk_1E6187620;
  v7[4] = &v9;
  [v4 currentLocationWithReply:v7];
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return (ARLocationData *)v5;
}

void __41__ARRemoteLocationSensor_currentLocation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _ARLogSensor_7();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Failed to send data to service - error: %@", (uint8_t *)&v8, 0x20u);
  }
}

void __41__ARRemoteLocationSensor_currentLocation__block_invoke_82(uint64_t a1, void *a2)
{
}

- (void)lookupAltitudeAtCoordinate:(CLLocationCoordinate2D)a3 completionHandler:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v7 = a4;
  int v8 = [(ARRemoteSensor *)self serverConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__ARRemoteLocationSensor_lookupAltitudeAtCoordinate_completionHandler___block_invoke;
  v10[3] = &unk_1E6185C00;
  v10[4] = self;
  uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:v10];

  objc_msgSend(v9, "lookupAltitudeAtCoordinate:completionHandler:", v7, latitude, longitude);
}

void __71__ARRemoteLocationSensor_lookupAltitudeAtCoordinate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _ARLogSensor_7();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Failed to send data to service - error: %@", (uint8_t *)&v8, 0x20u);
  }
}

- (unint64_t)providedDataTypes
{
  return 64;
}

- (void)updateARSessionState:(unint64_t)a3
{
  id v5 = [(ARRemoteSensor *)self serverConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__ARRemoteLocationSensor_updateARSessionState___block_invoke;
  v7[3] = &unk_1E6185C00;
  v7[4] = self;
  v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v7];

  [v6 updateARSessionState:a3];
}

void __47__ARRemoteLocationSensor_updateARSessionState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _ARLogSensor_7();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Failed to send data to service - error: %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)updateEstimationFromVIOPose:(id)a3 imageData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(ARRemoteSensor *)self serverConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__ARRemoteLocationSensor_updateEstimationFromVIOPose_imageData___block_invoke;
  v10[3] = &unk_1E6185C00;
  v10[4] = self;
  uint64_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v10];

  [v9 updateEstimationFromVIOPose:v7 imageData:v6];
}

void __64__ARRemoteLocationSensor_updateEstimationFromVIOPose_imageData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _ARLogSensor_7();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Failed to send data to service - error: %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)updateFromVisualLocalizationResult:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = [NSString stringWithUTF8String:"-[ARRemoteLocationSensor updateFromVisualLocalizationResult:]"];
  [v3 raise:v4, @"%@ should no longer be called remotely.", v5 format];
}

- (id)updateFromLocationData:(id)a3
{
  id v3 = a3;
  return v3;
}

@end