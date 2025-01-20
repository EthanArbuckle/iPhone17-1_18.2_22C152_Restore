@interface HKMedicalIDUIUtilities
+ (BOOL)isMessagesInstalled;
@end

@implementation HKMedicalIDUIUtilities

+ (BOOL)isMessagesInstalled
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  int v3 = [v2 applicationIsInstalled:@"com.apple.MobileSMS"];

  _HKInitializeLogging();
  v4 = *MEMORY[0x1E4F29F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1E0B26000, v4, OS_LOG_TYPE_INFO, "[MedicalIDUtilities] messages install state on current device is: %d", (uint8_t *)v6, 8u);
  }
  return v3;
}

@end