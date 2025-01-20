@interface CHSensorData
- (CHSensorData)init;
- (void)aggregatedMotionAndAppLaunchDataFromDate:(id)a3 toDate:(id)a4 completion:(id)a5;
- (void)embeddingVectorForBundleId:(id)a3 completion:(id)a4;
@end

@implementation CHSensorData

- (void).cxx_destruct
{
}

- (void)embeddingVectorForBundleId:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = ch_sensor_data_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_24A47C000, v8, OS_LOG_TYPE_DEFAULT, "CHSensorData embeddingVectorForBundleId api called", v9, 2u);
  }

  [(CHSensorDataProtocol *)self->_xpcClient embeddingVectorForBundleId:v7 completion:v6];
}

- (void)aggregatedMotionAndAppLaunchDataFromDate:(id)a3 toDate:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = ch_sensor_data_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_24A47C000, v11, OS_LOG_TYPE_DEFAULT, "CHSensorData aggregatedMotionAndAppLaunchData api called", v12, 2u);
  }

  [(CHSensorDataProtocol *)self->_xpcClient aggregatedMotionAndAppLaunchDataFromDate:v10 toDate:v9 completion:v8];
}

- (CHSensorData)init
{
  v6.receiver = self;
  v6.super_class = (Class)CHSensorData;
  v2 = [(CHSensorData *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CHSensorDataClient);
    xpcClient = v2->_xpcClient;
    v2->_xpcClient = (CHSensorDataProtocol *)v3;
  }
  return v2;
}

@end