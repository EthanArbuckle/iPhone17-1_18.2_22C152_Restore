@interface HKHealthChecklistUtilities
+ (id)shared;
- (BOOL)isEmergencySOSAvailable;
- (BOOL)isHealthAppVisibleAndInstalled;
- (BOOL)isHealthChecklistAvailable;
- (BOOL)isMedicalIDAvailable;
@end

@implementation HKHealthChecklistUtilities

+ (id)shared
{
  v2 = objc_alloc_init(HKHealthChecklistUtilities);

  return v2;
}

- (BOOL)isHealthChecklistAvailable
{
  BOOL v3 = [(HKHealthChecklistUtilities *)self isHealthAppVisibleAndInstalled];
  if (v3)
  {
    BOOL v4 = [(HKHealthChecklistUtilities *)self isMedicalIDAvailable];
    LOBYTE(v3) = v4 & [(HKHealthChecklistUtilities *)self isEmergencySOSAvailable];
  }
  return v3;
}

- (BOOL)isHealthAppVisibleAndInstalled
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v3 = [v2 bundleIdentifier];

  if (v3 == @"com.apple.Health")
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    BOOL v4 = +[_HKBehavior sharedBehavior];
    int v5 = [v4 healthAppHiddenOrNotInstalled] ^ 1;
  }
  return v5;
}

- (BOOL)isMedicalIDAvailable
{
  v2 = +[_HKBehavior sharedBehavior];
  char v3 = [v2 isiPad];

  if (v3) {
    return 0;
  }

  return MGGetBoolAnswer();
}

- (BOOL)isEmergencySOSAvailable
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getSOSManagerClass_softClass;
  uint64_t v9 = getSOSManagerClass_softClass;
  if (!getSOSManagerClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getSOSManagerClass_block_invoke;
    v5[3] = &unk_1E58BD760;
    v5[4] = &v6;
    __getSOSManagerClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  return [v3 deviceSupportsSOS];
}

@end