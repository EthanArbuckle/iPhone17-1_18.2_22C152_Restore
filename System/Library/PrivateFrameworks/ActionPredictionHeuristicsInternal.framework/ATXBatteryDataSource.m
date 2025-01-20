@interface ATXBatteryDataSource
- (ATXBatteryDataSource)initWithDevice:(id)a3;
- (void)batteryInformationWithCallback:(id)a3;
@end

@implementation ATXBatteryDataSource

- (ATXBatteryDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXBatteryDataSource;
  v6 = [(ATXBatteryDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void)batteryInformationWithCallback:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(id, void, void *))a3;
  IOPSCopyPowerSourcesByTypePrecise();
  v4 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[ATXBatteryDataSource batteryInformationWithCallback:](v4);
  }

  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:4 userInfo:0];
  v3[2](v3, 0, v5);
}

- (void).cxx_destruct
{
}

- (void)batteryInformationWithCallback:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0F43000, log, OS_LOG_TYPE_FAULT, "ATXBatteryDataSource: Failed to obtain power sources list", v1, 2u);
}

- (void)batteryInformationWithCallback:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0F43000, log, OS_LOG_TYPE_FAULT, "ATXBatteryDataSource: Failed to obtain power sources info", v1, 2u);
}

@end