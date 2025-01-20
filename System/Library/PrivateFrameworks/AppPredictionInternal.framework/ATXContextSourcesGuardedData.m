@interface ATXContextSourcesGuardedData
- (ATXAmbientLightMonitor)ambientLightMonitor;
- (ATXBiomePredictionContextStream)predictionContextStream;
- (ATXLocationManager)locationManager;
- (ATXMotionManagerWrapper)motionManagerWrapper;
- (BOOL)biomeStreamsInitialized;
- (BOOL)contextSourcesInitialized;
- (Class)deviceStateMonitorClass;
- (_ATXAppInfoManager)appInfoManager;
- (void)updateAppInfoManager:(id)a3 locationManager:(id)a4 motionManagerWrapper:(id)a5 ambientLightMonitor:(id)a6 deviceStateMonitorClass:(Class)a7 contextSourcesInitialized:(BOOL)a8;
- (void)updatePredictionContextStream:(id)a3 biomeStreamsInitialized:(BOOL)a4;
@end

@implementation ATXContextSourcesGuardedData

- (void)updateAppInfoManager:(id)a3 locationManager:(id)a4 motionManagerWrapper:(id)a5 ambientLightMonitor:(id)a6 deviceStateMonitorClass:(Class)a7 contextSourcesInitialized:(BOOL)a8
{
  v14 = (_ATXAppInfoManager *)a3;
  v15 = (ATXLocationManager *)a4;
  v16 = (ATXMotionManagerWrapper *)a5;
  v17 = (ATXAmbientLightMonitor *)a6;
  appInfoManager = self->_appInfoManager;
  self->_appInfoManager = v14;
  v19 = v14;

  locationManager = self->_locationManager;
  self->_locationManager = v15;
  v21 = v15;

  motionManagerWrapper = self->_motionManagerWrapper;
  self->_motionManagerWrapper = v16;
  v23 = v16;

  ambientLightMonitor = self->_ambientLightMonitor;
  self->_ambientLightMonitor = v17;
  v25 = v17;

  objc_storeStrong((id *)&self->_deviceStateMonitorClass, a7);
  self->_contextSourcesInitialized = a8;
}

- (void)updatePredictionContextStream:(id)a3 biomeStreamsInitialized:(BOOL)a4
{
  self->_biomeStreamsInitialized = a4;
}

- (_ATXAppInfoManager)appInfoManager
{
  return self->_appInfoManager;
}

- (ATXLocationManager)locationManager
{
  return self->_locationManager;
}

- (ATXMotionManagerWrapper)motionManagerWrapper
{
  return self->_motionManagerWrapper;
}

- (ATXAmbientLightMonitor)ambientLightMonitor
{
  return self->_ambientLightMonitor;
}

- (Class)deviceStateMonitorClass
{
  return self->_deviceStateMonitorClass;
}

- (BOOL)contextSourcesInitialized
{
  return self->_contextSourcesInitialized;
}

- (ATXBiomePredictionContextStream)predictionContextStream
{
  return self->_predictionContextStream;
}

- (BOOL)biomeStreamsInitialized
{
  return self->_biomeStreamsInitialized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionContextStream, 0);
  objc_storeStrong((id *)&self->_deviceStateMonitorClass, 0);
  objc_storeStrong((id *)&self->_ambientLightMonitor, 0);
  objc_storeStrong((id *)&self->_motionManagerWrapper, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_appInfoManager, 0);
}

@end