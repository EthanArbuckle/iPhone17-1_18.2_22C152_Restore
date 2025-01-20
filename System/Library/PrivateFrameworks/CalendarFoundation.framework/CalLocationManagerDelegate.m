@interface CalLocationManagerDelegate
- (BOOL)didFinish;
- (CLLocation)currentLocation;
- (CalLocationManagerDelegate)initWithCurrentBundleID:(id)a3 completionBlock:(id)a4;
- (id)completionBlock;
- (void)cancel;
- (void)dealloc;
- (void)didFinishLocationLookupWithLocation:(id)a3 error:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setDidFinish:(BOOL)a3;
- (void)timeout;
@end

@implementation CalLocationManagerDelegate

- (void)setCompletionBlock:(id)a3
{
}

- (void)didFinishLocationLookupWithLocation:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if ([(CalLocationManagerDelegate *)v8 didFinish])
  {
    v9 = +[CalFoundationLogSubsystem locations];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CalLocationManagerDelegate didFinishLocationLookupWithLocation:error:]();
    }
  }
  else
  {
    [(CalLocationManagerDelegate *)v8 setDidFinish:1];
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:v8];
    v10 = [(CalLocationManagerDelegate *)v8 completionBlock];
    ((void (**)(void, id, id))v10)[2](v10, v6, v7);

    v11 = +[CalFoundationLogSubsystem locations];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CalLocationManagerDelegate didFinishLocationLookupWithLocation:error:]();
    }

    [(CLLocationManager *)v8->_manager stopUpdatingLocation];
    [(CLLocationManager *)v8->_manager setDelegate:0];
  }
  objc_sync_exit(v8);
}

- (BOOL)didFinish
{
  return self->_didFinish;
}

- (void)setDidFinish:(BOOL)a3
{
  self->_didFinish = a3;
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)dealloc
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self];
  [(CLLocationManager *)self->_manager stopUpdatingLocation];
  [(CLLocationManager *)self->_manager setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)CalLocationManagerDelegate;
  [(CalLocationManagerDelegate *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBundleID, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong((id *)&self->_currentLocation, 0);
}

- (CalLocationManagerDelegate)initWithCurrentBundleID:(id)a3 completionBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CalLocationManagerDelegate;
  v9 = [(CalLocationManagerDelegate *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_currentBundleID, a3);
    uint64_t v11 = MEMORY[0x192FD8850](v8);
    id completionBlock = v10->_completionBlock;
    v10->_id completionBlock = (id)v11;

    v13 = (void *)MEMORY[0x1E4F14428];
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1E600]) initWithEffectiveBundleIdentifier:v10->_currentBundleID delegate:v10 onQueue:v13];
    manager = v10->_manager;
    v10->_manager = (CLLocationManager *)v14;

    v16 = +[CalFoundationLogSubsystem locations];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[CalLocationManagerDelegate initWithCurrentBundleID:completionBlock:]();
    }

    v17 = +[CalFoundationLogSubsystem locations];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[CalLocationManagerDelegate initWithCurrentBundleID:completionBlock:]();
    }

    [(CLLocationManager *)v10->_manager startUpdatingLocation];
    [(CalLocationManagerDelegate *)v10 performSelector:sel_timeout withObject:0 afterDelay:30.0];
  }

  return v10;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  if ([v5 count])
  {
    id v6 = +[CalFoundationLogSubsystem locations];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CalLocationManagerDelegate locationManager:didUpdateLocations:]();
    }

    id v7 = [v5 lastObject];
    [(CalLocationManagerDelegate *)self didFinishLocationLookupWithLocation:v7 error:0];
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  if ([a3 authorizationStatus] - 1 <= 1)
  {
    v4 = +[CalFoundationLogSubsystem locations];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[CalLocationManagerDelegate locationManagerDidChangeAuthorization:]();
    }

    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:CalLocationErrorDomain code:1 userInfo:0];
    [(CalLocationManagerDelegate *)self didFinishLocationLookupWithLocation:0 error:v5];
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7) {
    goto LABEL_12;
  }
  v9 = [v7 domain];
  if ([v9 isEqualToString:*MEMORY[0x1E4F1E6C8]])
  {
    uint64_t v10 = [v8 code];

    if (v10 == 1 && ![v6 authorizationStatus])
    {
      uint64_t v11 = +[CalFoundationLogSubsystem locations];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[CalLocationManagerDelegate locationManager:didFailWithError:]();
      }

      goto LABEL_12;
    }
  }
  else
  {
  }
  v12 = +[CalFoundationLogSubsystem locations];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[CalLocationManagerDelegate locationManager:didFailWithError:]();
  }

  [(CalLocationManagerDelegate *)self didFinishLocationLookupWithLocation:0 error:v8];
LABEL_12:
}

- (void)timeout
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "Our location lookup timed out.", v2, v3, v4, v5, v6);
}

- (void)cancel
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "Our location lookup was cancelled out.", v2, v3, v4, v5, v6);
}

- (CLLocation)currentLocation
{
  return (CLLocation *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCurrentLocation:(id)a3
{
}

- (void)initWithCurrentBundleID:completionBlock:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "Start updating locations for [%@].", v2, v3, v4, v5, v6);
}

- (void)initWithCurrentBundleID:completionBlock:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "Initializing a location manager for [%@].", v2, v3, v4, v5, v6);
}

- (void)locationManager:didUpdateLocations:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "Our current location was updated by the location manager.", v2, v3, v4, v5, v6);
}

- (void)locationManagerDidChangeAuthorization:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "Our location authorization status was updated by the location manager.", v2, v3, v4, v5, v6);
}

- (void)locationManager:didFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "location manager says it failed because we have no location authorization, but authorization status is still undetermined. Ignoring this error and hoping the user authorizes us. [%@]", v2, v3, v4, v5, v6);
}

- (void)locationManager:didFailWithError:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_190D88000, v0, OS_LOG_TYPE_ERROR, "Our location manager failed with the error [%@]", v1, 0xCu);
}

- (void)didFinishLocationLookupWithLocation:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "Our location lookup was finished.", v2, v3, v4, v5, v6);
}

- (void)didFinishLocationLookupWithLocation:error:.cold.2()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "Stop updating locations for [%@].", v2, v3, v4, v5, v6);
}

@end