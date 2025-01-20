@interface ATXAVRoutingSessionHelper
- (ATXAVRouteInfo)predictedRouteInfo;
- (ATXAVRoutingSessionHelper)init;
- (ATXAVRoutingSessionHelper)initWithAcceptThreshold:(float)a3 avRoutingSessionManager:(id)a4;
- (float)acceptThreshod;
- (id)_atxAVRouteInfoWithRoute:(id)a3;
- (id)_filterTopRouteFromRoutes:(id)a3 withAcceptThreshold:(float)a4;
- (id)_predictedRouteInfoWithAcceptThreshold:(float)a3 prefersLikelyDestinationsOverCurrentRoutingSession:(BOOL)a4;
- (id)_predictedRouteWithAcceptThreshold:(float)a3;
- (id)_selectedOrPendingRoute;
- (void)_selectedOrPendingRoute;
@end

@implementation ATXAVRoutingSessionHelper

- (ATXAVRoutingSessionHelper)init
{
  return [(ATXAVRoutingSessionHelper *)self initWithAcceptThreshold:0 avRoutingSessionManager:0.0];
}

- (ATXAVRoutingSessionHelper)initWithAcceptThreshold:(float)a3 avRoutingSessionManager:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXAVRoutingSessionHelper;
  v7 = [(ATXAVRoutingSessionHelper *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_threshold = a3;
    if (v6)
    {
      v9 = (AVRoutingSessionManager *)v6;
    }
    else
    {
      v9 = [ATXAVFoundationRoutingSessionManager() longFormVideoRoutingSessionManager];
    }
    avRoutingSessionManager = v8->_avRoutingSessionManager;
    v8->_avRoutingSessionManager = v9;
  }
  return v8;
}

- (ATXAVRouteInfo)predictedRouteInfo
{
  internalPredictedRouteInfo = self->_internalPredictedRouteInfo;
  if (!internalPredictedRouteInfo)
  {
    float threshold = self->_threshold;
    uint64_t v5 = [(AVRoutingSessionManager *)self->_avRoutingSessionManager prefersLikelyDestinationsOverCurrentRoutingSession];
    *(float *)&double v6 = threshold;
    v7 = [(ATXAVRoutingSessionHelper *)self _predictedRouteInfoWithAcceptThreshold:v5 prefersLikelyDestinationsOverCurrentRoutingSession:v6];
    v8 = self->_internalPredictedRouteInfo;
    self->_internalPredictedRouteInfo = v7;

    internalPredictedRouteInfo = self->_internalPredictedRouteInfo;
  }

  return internalPredictedRouteInfo;
}

- (float)acceptThreshod
{
  return self->_threshold;
}

- (id)_predictedRouteInfoWithAcceptThreshold:(float)a3 prefersLikelyDestinationsOverCurrentRoutingSession:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = __atxlog_handle_default();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ATXAVRoutingSessionHelper _predictedRouteInfoWithAcceptThreshold:prefersLikelyDestinationsOverCurrentRoutingSession:](v4, v7);
  }

  if (v4)
  {
    *(float *)&double v8 = a3;
    v9 = [(ATXAVRoutingSessionHelper *)self _predictedRouteWithAcceptThreshold:v8];
    if (v9) {
      goto LABEL_9;
    }
    uint64_t v10 = [(ATXAVRoutingSessionHelper *)self _selectedOrPendingRoute];
  }
  else
  {
    v9 = [(ATXAVRoutingSessionHelper *)self _selectedOrPendingRoute];
    if (v9) {
      goto LABEL_9;
    }
    *(float *)&double v11 = a3;
    uint64_t v10 = [(ATXAVRoutingSessionHelper *)self _predictedRouteWithAcceptThreshold:v11];
  }
  v9 = (void *)v10;
LABEL_9:
  objc_super v12 = [(ATXAVRoutingSessionHelper *)self _atxAVRouteInfoWithRoute:v9];

  return v12;
}

- (id)_predictedRouteWithAcceptThreshold:(float)a3
{
  uint64_t v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ATXAVRoutingSessionHelper _predictedRouteWithAcceptThreshold:](v5, a3);
  }

  double v6 = [(AVRoutingSessionManager *)self->_avRoutingSessionManager allLikelyDestinations];
  *(float *)&double v7 = a3;
  double v8 = [(ATXAVRoutingSessionHelper *)self _filterTopRouteFromRoutes:v6 withAcceptThreshold:v7];

  return v8;
}

- (id)_selectedOrPendingRoute
{
  v2 = [(AVRoutingSessionManager *)self->_avRoutingSessionManager currentRoutingSession];
  v3 = v2;
  if (v2)
  {
    BOOL v4 = [v2 destination];

    if (v4)
    {
      uint64_t v5 = __atxlog_handle_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        [(ATXAVRoutingSessionHelper *)v3 _selectedOrPendingRoute];
      }

      BOOL v4 = [v3 destination];
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_filterTopRouteFromRoutes:(id)a3 withAcceptThreshold:(float)a4
{
  id v5 = a3;
  double v6 = v5;
  if (v5 && [v5 count])
  {
    double v7 = [v6 objectAtIndexedSubscript:0];
    [v7 probability];
    id v8 = 0;
    if (v9 > a4) {
      id v8 = v7;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_atxAVRouteInfoWithRoute:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (!v3)
  {
    id v8 = 0;
    goto LABEL_14;
  }
  id v5 = [v3 outputDeviceDescriptions];
  if ([v5 count])
  {
    double v6 = [v5 objectAtIndexedSubscript:0];
    ATXAVFoundationOutputDevice();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v8 = 0;
    if (isKindOfClass)
    {
      float v9 = [v5 objectAtIndexedSubscript:0];
      uint64_t v10 = [v9 name];

      double v11 = [v5 objectAtIndexedSubscript:0];
      objc_super v12 = [v11 deviceID];

      if (!v10) {
        goto LABEL_11;
      }
      id v8 = 0;
      if (![v10 length] || !v12) {
        goto LABEL_12;
      }
      if ([v12 length]) {
        id v8 = -[ATXAVRouteInfo initWithDeviceName:deviceID:isExternalRoute:]([ATXAVRouteInfo alloc], "initWithDeviceName:deviceID:isExternalRoute:", v10, v12, [v4 providesExternalVideoPlayback]);
      }
      else {
LABEL_11:
      }
        id v8 = 0;
LABEL_12:
    }
  }
  else
  {
    id v8 = 0;
  }

LABEL_14:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalPredictedRouteInfo, 0);

  objc_storeStrong((id *)&self->_avRoutingSessionManager, 0);
}

- (void)_predictedRouteInfoWithAcceptThreshold:(char)a1 prefersLikelyDestinationsOverCurrentRoutingSession:(NSObject *)a2 .cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1A790D000, a2, OS_LOG_TYPE_DEBUG, "Prefer predicted route over current seesion route: %{BOOL}d", (uint8_t *)v2, 8u);
}

- (void)_predictedRouteWithAcceptThreshold:(os_log_t)log .cold.1(os_log_t log, float a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_1A790D000, log, OS_LOG_TYPE_DEBUG, "Find predicted route with accept threshold: %fd", (uint8_t *)&v2, 0xCu);
}

- (void)_selectedOrPendingRoute
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v3 = [a1 destination];
  uint64_t v4 = [v3 outputDeviceDescriptions];
  int v5 = 138412290;
  double v6 = v4;
  _os_log_debug_impl(&dword_1A790D000, a2, OS_LOG_TYPE_DEBUG, "Found selected / pending route: %@", (uint8_t *)&v5, 0xCu);
}

@end