@interface FCCAppInstallationUtility
- (BOOL)fitnessAppInstalled;
- (void)fitnessAppInstalled;
@end

@implementation FCCAppInstallationUtility

- (BOOL)fitnessAppInstalled
{
  id v10 = 0;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.Fitness" allowPlaceholder:0 error:&v10];
  id v3 = v10;
  v4 = v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    v8 = [v2 applicationState];
    char v7 = [v8 isInstalled];
  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
      [(FCCAppInstallationUtility *)(uint64_t)v4 fitnessAppInstalled];
    }
    char v7 = 0;
  }

  return v7;
}

- (void)fitnessAppInstalled
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B55C0000, a2, OS_LOG_TYPE_ERROR, "Error creating application record %@", (uint8_t *)&v2, 0xCu);
}

@end