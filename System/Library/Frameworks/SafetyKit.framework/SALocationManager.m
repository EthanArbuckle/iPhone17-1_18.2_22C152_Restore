@interface SALocationManager
- (CLLocationManager)locationManager;
- (SALocationManager)init;
- (SALocationManagerProtocol)delegate;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)notifyLocation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)startMonitoringLocation;
- (void)stopMonitoringLocation;
@end

@implementation SALocationManager

- (SALocationManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)SALocationManager;
  v2 = [(SALocationManager *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F00A60]);
    v4 = +[SABundleManager locationBundle];
    v5 = (void *)[v3 initWithEffectiveBundle:v4 delegate:v2 onQueue:MEMORY[0x263EF83A0]];
    [(SALocationManager *)v2 setLocationManager:v5];

    [(CLLocationManager *)v2->_locationManager setDesiredAccuracy:10.0];
  }
  return v2;
}

- (void)notifyLocation:(id)a3
{
  id v4 = a3;
  v5 = [(SALocationManager *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v5 locationManager:self didUpdateLocation:v4];
  }
  else
  {
    v6 = sa_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SALocationManager notifyLocation:](v6);
    }
  }
}

- (void)startMonitoringLocation
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = sa_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    objc_super v7 = "-[SALocationManager startMonitoringLocation]";
    _os_log_impl(&dword_245182000, v3, OS_LOG_TYPE_DEFAULT, "%s, Starting location updates", (uint8_t *)&v6, 0xCu);
  }

  [(CLLocationManager *)self->_locationManager startUpdatingLocation];
  id v4 = [(CLLocationManager *)self->_locationManager location];

  if (v4)
  {
    v5 = [(CLLocationManager *)self->_locationManager location];
    [(SALocationManager *)self notifyLocation:v5];
  }
}

- (void)stopMonitoringLocation
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[SALocationManager stopMonitoringLocation]";
  _os_log_debug_impl(&dword_245182000, log, OS_LOG_TYPE_DEBUG, "%s, Stopping location updates", (uint8_t *)&v1, 0xCu);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  int v6 = sa_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SALocationManager locationManager:didUpdateLocations:](v5, v6);
  }

  objc_super v7 = [v5 firstObject];

  if (v7)
  {
    uint64_t v8 = [v5 firstObject];
    [(SALocationManager *)self notifyLocation:v8];
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  id v5 = sa_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SALocationManager locationManager:didFailWithError:]();
  }
}

- (SALocationManagerProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SALocationManagerProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)notifyLocation:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  v2 = "-[SALocationManager notifyLocation:]";
  _os_log_error_impl(&dword_245182000, log, OS_LOG_TYPE_ERROR, "%{public}s, Unable to deliver location updates", (uint8_t *)&v1, 0xCu);
}

- (void)locationManager:(void *)a1 didUpdateLocations:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 firstObject];
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_245182000, a2, OS_LOG_TYPE_DEBUG, "%s, Location update received, %@", (uint8_t *)v4, 0x16u);
}

- (void)locationManager:didFailWithError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_245182000, v0, OS_LOG_TYPE_ERROR, "%s, Location manager error, %@", (uint8_t *)v1, 0x16u);
}

@end