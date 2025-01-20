@interface LACDTOSensorTrustStoreKVSAdapter
- (LACDTOSensorTrustStoreKVSAdapter)initWithKVStore:(id)a3;
- (void)storeSensorTrustState:(id)a3 completion:(id)a4;
@end

@implementation LACDTOSensorTrustStoreKVSAdapter

- (void).cxx_destruct
{
}

- (LACDTOSensorTrustStoreKVSAdapter)initWithKVStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDTOSensorTrustStoreKVSAdapter;
  v6 = [(LACDTOSensorTrustStoreKVSAdapter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_kvStore, a3);
  }

  return v7;
}

- (void)storeSensorTrustState:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if ([a3 isDisapproved])
  {
    v8 = [[LACDTOKVStoreValue alloc] initWithBoolValue:0];
    [(LACDTOKVStoreWriter *)self->_kvStore setValue:v8 forKey:6 completion:v6];
  }
  else
  {
    v7 = LACLogDTOSensor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[LACDTOSensorTrustStoreKVSAdapter storeSensorTrustState:completion:](v7);
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)storeSensorTrustState:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_254F14000, log, OS_LOG_TYPE_DEBUG, "Skipping trust state update because trust can only be regained in SEP", v1, 2u);
}

@end