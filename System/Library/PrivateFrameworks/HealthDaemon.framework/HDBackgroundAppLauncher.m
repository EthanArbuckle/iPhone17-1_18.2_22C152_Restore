@interface HDBackgroundAppLauncher
- (void)requestAppLaunchWithBundleID:(id)a3 updateFrequency:(double)a4;
- (void)requestAssertionInvalidationForBundleID:(id)a3;
@end

@implementation HDBackgroundAppLauncher

- (void)requestAppLaunchWithBundleID:(id)a3 updateFrequency:(double)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a4 >= 60.0) {
    double v6 = a4 * 0.5;
  }
  else {
    double v6 = 30.0;
  }
  v7 = [MEMORY[0x1E4F1C9C8] date];
  v8 = [v7 dateByAddingTimeInterval:v6];
  id v9 = (id)*MEMORY[0x1E4F5FAE0];
  _HKInitializeLogging();
  v10 = *MEMORY[0x1E4F29F00];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v5;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "Requesting to launch Duet for the App's bundleID %{public}@", buf, 0xCu);
  }
  v11 = [NSString stringWithFormat:@"com.apple.healthkit.background-delivery.%@", v5];
  v12 = [MEMORY[0x1E4F5FA28] applicationLaunchActivityWithName:v11 priority:*MEMORY[0x1E4F5FB30] forApplication:v5 withReason:v9 duration:*MEMORY[0x1E4F5FA98] startingAfter:v7 startingBefore:v8];
  [v12 setCancelAfterDeadline:0];
  v13 = [MEMORY[0x1E4F5FA48] complete];
  [v12 setFileProtection:v13];

  v14 = [MEMORY[0x1E4F5FA50] sharedScheduler];
  [v14 submitActivity:v12];
}

- (void)requestAssertionInvalidationForBundleID:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F5FA50];
  id v4 = a3;
  id v5 = [v3 sharedScheduler];
  [v5 endLaunchWithReason:*MEMORY[0x1E4F5FAE0] forApp:v4];
}

@end