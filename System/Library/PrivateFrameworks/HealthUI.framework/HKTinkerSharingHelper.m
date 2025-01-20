@interface HKTinkerSharingHelper
- (BOOL)isChinaSKUDevice;
- (BOOL)networkAccessEnabledForHealth;
- (HKTinkerSharingHelper)init;
- (void)networkAccessEnabledForHealth;
- (void)setNetworkAccessEnabledForHealth:(BOOL)a3;
@end

@implementation HKTinkerSharingHelper

- (HKTinkerSharingHelper)init
{
  v4.receiver = self;
  v4.super_class = (Class)HKTinkerSharingHelper;
  v2 = [(HKTinkerSharingHelper *)&v4 init];
  if (v2) {
    v2->_ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
  }
  return v2;
}

- (BOOL)isChinaSKUDevice
{
  if (isChinaSKUDevice_onceToken != -1) {
    dispatch_once(&isChinaSKUDevice_onceToken, &__block_literal_global_65);
  }
  return isChinaSKUDevice_deviceIsChinaRegion;
}

void __41__HKTinkerSharingHelper_isChinaSKUDevice__block_invoke()
{
  CFStringRef v0 = (const __CFString *)MGGetStringAnswer();
  if (v0)
  {
    CFStringRef v1 = v0;
    isChinaSKUDevice_deviceIsChinaRegion = CFEqual(v0, @"CH");
    CFRelease(v1);
  }
  else
  {
    isChinaSKUDevice_deviceIsChinaRegion = 0;
  }
}

- (BOOL)networkAccessEnabledForHealth
{
  if (_CTServerConnectionCopyCellularUsagePolicy())
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR)) {
      -[HKTinkerSharingHelper networkAccessEnabledForHealth]();
    }
  }
  return 1;
}

- (void)setNetworkAccessEnabledForHealth:(BOOL)a3
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v3 = (const void **)MEMORY[0x1E4F23D18];
  if (!a3) {
    v3 = (const void **)MEMORY[0x1E4F23D20];
  }
  objc_super v4 = *v3;
  uint64_t v5 = *MEMORY[0x1E4F23D10];
  v14[0] = v4;
  uint64_t v6 = *MEMORY[0x1E4F23D30];
  v13[0] = v5;
  v13[1] = v6;
  v7 = objc_msgSend(NSNumber, "numberWithBool:");
  v13[2] = *MEMORY[0x1E4F242B0];
  v14[1] = v7;
  v14[2] = v4;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  LODWORD(v7) = _CTServerConnectionSetCellularUsagePolicy();
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E4F29FA8];
  v10 = *MEMORY[0x1E4F29FA8];
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[HKTinkerSharingHelper setNetworkAccessEnabledForHealth:]();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    v12 = "-[HKTinkerSharingHelper setNetworkAccessEnabledForHealth:]";
    _os_log_impl(&dword_1E0B26000, v9, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %s succeeded", (uint8_t *)&v11, 0xCu);
  }
  CFRelease(v4);
  CFRelease(v4);
}

- (void)networkAccessEnabledForHealth
{
  LODWORD(v2) = 136315650;
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_6(&dword_1E0B26000, v0, v1, "[sharing-setup] %s failed, error: %d domain: (%d)", v2, v3, v4);
}

- (void)setNetworkAccessEnabledForHealth:.cold.1()
{
  LODWORD(v2) = 136315650;
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_6(&dword_1E0B26000, v0, v1, "[sharing-setup] %s failed, error: %d domain: (%d)", v2, v3, v4);
}

@end