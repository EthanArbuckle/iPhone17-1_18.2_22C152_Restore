@interface CSDevicePasscodeRecoveryService
- (BOOL)canStartRecovery;
- (CSDevicePasscodeRecoveryService)init;
- (CSDevicePasscodeRecoveryService)initWithService:(id)a3;
- (void)canStartRecovery;
- (void)startRecoveryInParentVC:(id)a3 completion:(id)a4;
@end

@implementation CSDevicePasscodeRecoveryService

- (CSDevicePasscodeRecoveryService)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F30BB8]);
  v4 = [(CSDevicePasscodeRecoveryService *)self initWithService:v3];

  return v4;
}

- (CSDevicePasscodeRecoveryService)initWithService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSDevicePasscodeRecoveryService;
  v6 = [(CSDevicePasscodeRecoveryService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_service, a3);
  }

  return v7;
}

- (BOOL)canStartRecovery
{
  service = self->_service;
  id v7 = 0;
  char v3 = [(LAPasscodeRecoveryService *)service isRecoveryAvailableWithError:&v7];
  id v4 = v7;
  if ((v3 & 1) == 0)
  {
    id v5 = SBLogDashBoard();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(CSDevicePasscodeRecoveryService *)(uint64_t)v4 canStartRecovery];
    }
  }
  return v3;
}

- (void)startRecoveryInParentVC:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
}

- (void)canStartRecovery
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D839D000, a2, OS_LOG_TYPE_ERROR, "Cannot start passcode recovery (error: %@)", (uint8_t *)&v2, 0xCu);
}

@end