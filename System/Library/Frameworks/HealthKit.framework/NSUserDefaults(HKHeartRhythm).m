@interface NSUserDefaults(HKHeartRhythm)
+ (id)hk_heartRhythmDefaults;
- (id)hk_demoResultKeys;
- (uint64_t)hk_electrocardiogramFirstRecordingCompleted;
- (uint64_t)hk_electrocardiogramWatchAppInstallHasBeenAllowed;
- (uint64_t)hk_hfeModeEnabled;
- (uint64_t)hk_setDemoResultKeys:()HKHeartRhythm;
- (uint64_t)hk_setElectrocardiogramWatchAppInstallIsAllowed:()HKHeartRhythm;
- (void)hk_setElectrocardiogramFirstRecordingCompleted:()HKHeartRhythm;
@end

@implementation NSUserDefaults(HKHeartRhythm)

+ (id)hk_heartRhythmDefaults
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.private.health.heart-rhythm"];

  return v0;
}

- (id)hk_demoResultKeys
{
  v1 = [a1 arrayForKey:@"DemoResultKeys"];
  v2 = v1;
  if (!v1) {
    v1 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v3 = v1;

  return v3;
}

- (uint64_t)hk_setDemoResultKeys:()HKHeartRhythm
{
  return [a1 setObject:a3 forKey:@"DemoResultKeys"];
}

- (uint64_t)hk_hfeModeEnabled
{
  return [a1 BOOLForKey:@"EnableHFEMode"];
}

- (uint64_t)hk_setElectrocardiogramWatchAppInstallIsAllowed:()HKHeartRhythm
{
  return [a1 setBool:a3 forKey:@"ElectrocardiogramWatchAppInstallIsAllowed"];
}

- (uint64_t)hk_electrocardiogramWatchAppInstallHasBeenAllowed
{
  return [a1 BOOLForKey:@"ElectrocardiogramWatchAppInstallIsAllowed"];
}

- (void)hk_setElectrocardiogramFirstRecordingCompleted:()HKHeartRhythm
{
  if ([a1 BOOLForKey:@"HKElectrocardiogramFirstRecordingCompleted"] != a3)
  {
    [a1 setBool:a3 forKey:@"HKElectrocardiogramFirstRecordingCompleted"];
    id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:@"HKElectrocardiogramFirstRecordingCompleted"];
    HKSynchronizeNanoPreferencesUserDefaults(@"com.apple.private.health.heart-rhythm", v5);
  }
}

- (uint64_t)hk_electrocardiogramFirstRecordingCompleted
{
  return [a1 BOOLForKey:@"HKElectrocardiogramFirstRecordingCompleted"];
}

@end