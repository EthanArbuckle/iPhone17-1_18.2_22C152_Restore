@interface CFXThermalPolicyManager
- (BOOL)recordingPolicy;
- (CFXThermalPolicyManager)init;
- (JFXThermalPolicyManager)policyManager;
- (void)CFX_notifyPolicyChanged;
- (void)cameraFPSForThermalLevel:(int)a3 deviceType:(id)a4 minRate:(int *)a5 maxRate:(int *)a6;
- (void)setPolicyManager:(id)a3;
- (void)setRecordingPolicy:(BOOL)a3;
@end

@implementation CFXThermalPolicyManager

- (void)setRecordingPolicy:(BOOL)a3
{
  if (self->_recordingPolicy != a3)
  {
    BOOL v3 = a3;
    self->_recordingPolicy = a3;
    v5 = [(CFXThermalPolicyManager *)self policyManager];
    [v5 setPolicyType:objc_opt_class() active:v3];

    [(CFXThermalPolicyManager *)self CFX_notifyPolicyChanged];
  }
}

- (CFXThermalPolicyManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)CFXThermalPolicyManager;
  v2 = [(CFXThermalPolicyManager *)&v7 init];
  BOOL v3 = objc_alloc_init(CFXDefaultThermalPolicy);
  v4 = [[JFXThermalPolicyManager alloc] initWithDefaultPolicy:v3];
  policyManager = v2->_policyManager;
  v2->_policyManager = v4;

  return v2;
}

- (void)cameraFPSForThermalLevel:(int)a3 deviceType:(id)a4 minRate:(int *)a5 maxRate:(int *)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  v11 = [(CFXThermalPolicyManager *)self policyManager];
  id v12 = [v11 highestPriorityPolicy];

  [v12 cameraFPSForThermalLevel:v8 deviceType:v10 minRate:a5 maxRate:a6];
}

- (void)CFX_notifyPolicyChanged
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = JFXLog_thermals();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(CFXThermalPolicyManager *)self policyManager];
    v5 = [v4 highestPriorityPolicy];
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_234C41000, v3, OS_LOG_TYPE_DEFAULT, "Thermal Policy Changed:\n\t%@", buf, 0xCu);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__CFXThermalPolicyManager_CFX_notifyPolicyChanged__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __50__CFXThermalPolicyManager_CFX_notifyPolicyChanged__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"JFXThermalPolicyChangedNotification" object:*(void *)(a1 + 32)];
}

- (BOOL)recordingPolicy
{
  return self->_recordingPolicy;
}

- (JFXThermalPolicyManager)policyManager
{
  return self->_policyManager;
}

- (void)setPolicyManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end