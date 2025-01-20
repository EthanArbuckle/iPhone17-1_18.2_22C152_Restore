@interface ARGeoTrackingLocationRequestHandler
- (ARGeoTrackingLocationRequestHandler)init;
- (id)locationCompletionHandler;
- (int)waitForAuthorizationStatus;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)requestLocationWithCompletionHandler:(id)a3;
- (void)setLocationCompletionHandler:(id)a3;
- (void)setLocationManager:(id)a3;
@end

@implementation ARGeoTrackingLocationRequestHandler

- (ARGeoTrackingLocationRequestHandler)init
{
  v7.receiver = self;
  v7.super_class = (Class)ARGeoTrackingLocationRequestHandler;
  v2 = [(ARGeoTrackingLocationRequestHandler *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    authorizationCondition = v2->_authorizationCondition;
    v2->_authorizationCondition = (NSCondition *)v3;

    v2->_authorizationStatus = 0;
    id locationCompletionHandler = v2->_locationCompletionHandler;
    v2->_id locationCompletionHandler = 0;
  }
  return v2;
}

- (void)setLocationManager:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_locationManager, v4);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = _ARLogGeneral_21();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    int v14 = 138543618;
    v15 = v10;
    __int16 v16 = 2048;
    v17 = self;
    _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Received location", (uint8_t *)&v14, 0x16u);
  }
  [v7 stopUpdatingLocation];

  v11 = [v6 lastObject];

  id locationCompletionHandler = (void (**)(id, void *, void))self->_locationCompletionHandler;
  if (locationCompletionHandler)
  {
    locationCompletionHandler[2](locationCompletionHandler, v11, 0);
    id v13 = self->_locationCompletionHandler;
    self->_id locationCompletionHandler = 0;
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = _ARLogGeneral_21();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    int v11 = 138543874;
    v12 = v8;
    __int16 v13 = 2048;
    int v14 = self;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Location request handler failed: %@", (uint8_t *)&v11, 0x20u);
  }
  if ([v5 code])
  {
    id locationCompletionHandler = (void (**)(id, void, id))self->_locationCompletionHandler;
    if (locationCompletionHandler)
    {
      locationCompletionHandler[2](locationCompletionHandler, 0, v5);
      id v10 = self->_locationCompletionHandler;
      self->_id locationCompletionHandler = 0;
    }
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  authorizationCondition = self->_authorizationCondition;
  id v5 = a3;
  [(NSCondition *)authorizationCondition lock];
  int v6 = [v5 authorizationStatus];

  self->_authorizationStatus = v6;
  [(NSCondition *)self->_authorizationCondition broadcast];
  [(NSCondition *)self->_authorizationCondition unlock];
  id v7 = _ARLogGeneral_21();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    int v10 = 138543874;
    int v11 = v9;
    __int16 v12 = 2048;
    __int16 v13 = self;
    __int16 v14 = 1024;
    int v15 = v6;
    _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: User has set location authorization status: %d", (uint8_t *)&v10, 0x1Cu);
  }
}

- (int)waitForAuthorizationStatus
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ARLogGeneral_21();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v8 = 138543618;
    v9 = v5;
    __int16 v10 = 2048;
    int v11 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Waiting for location authorization from user", (uint8_t *)&v8, 0x16u);
  }
  [(NSCondition *)self->_authorizationCondition lock];
  while (1)
  {
    int authorizationStatus = self->_authorizationStatus;
    if (authorizationStatus) {
      break;
    }
    [(NSCondition *)self->_authorizationCondition wait];
  }
  [(NSCondition *)self->_authorizationCondition unlock];
  return authorizationStatus;
}

- (void)requestLocationWithCompletionHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _ARLogGeneral_21();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138543618;
    __int16 v10 = v7;
    __int16 v11 = 2048;
    uint64_t v12 = self;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Waiting for location for availability check", (uint8_t *)&v9, 0x16u);
  }
  [(ARGeoTrackingLocationRequestHandler *)self setLocationCompletionHandler:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationManager);
  [WeakRetained startUpdatingLocation];
}

- (id)locationCompletionHandler
{
  return self->_locationCompletionHandler;
}

- (void)setLocationCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_authorizationCondition, 0);
  objc_destroyWeak((id *)&self->_locationManager);
}

@end