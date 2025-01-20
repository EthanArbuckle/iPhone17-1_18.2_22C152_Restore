@interface HKMedicationsBehavior
+ (BOOL)_medicationFutureMigrationsEnabled;
+ (BOOL)hasSupportedAppleWatchPaired;
+ (id)_getActivePairedDevice;
+ (id)_unitTesting_behaviorWithMockPairedDevice:(id)a3;
+ (id)sharedBehavior;
+ (void)resetSharedBehavior;
+ (void)setSharedBehavior:(id)a3;
- (BOOL)asyncMedicationReschedulesEnabled;
- (BOOL)medicationsFutureMigrationsEnabled;
- (HKMedicationsBehavior)init;
- (HKMedicationsCapabilityProviding)mockPairedDevice;
- (id)_initWithFutureMigrationsEnabled:(BOOL)a3 asyncMedicationReschedulesEnabled:(BOOL)a4 mockPairedDevice:(id)a5;
- (void)setAsyncMedicationReschedulesEnabled:(BOOL)a3;
- (void)setMedicationsFutureMigrationsEnabled:(BOOL)a3;
@end

@implementation HKMedicationsBehavior

- (HKMedicationsBehavior)init
{
  BOOL v3 = +[HKMedicationsBehavior _medicationFutureMigrationsEnabled];

  return (HKMedicationsBehavior *)[(HKMedicationsBehavior *)self _initWithFutureMigrationsEnabled:v3 asyncMedicationReschedulesEnabled:1 mockPairedDevice:0];
}

- (id)_initWithFutureMigrationsEnabled:(BOOL)a3 asyncMedicationReschedulesEnabled:(BOOL)a4 mockPairedDevice:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HKMedicationsBehavior;
  v10 = [(HKMedicationsBehavior *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_medicationsFutureMigrationsEnabled = a3;
    v10->_asyncMedicationReschedulesEnabled = a4;
    objc_storeStrong((id *)&v10->_mockPairedDevice, a5);
  }

  return v11;
}

+ (id)sharedBehavior
{
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedMedicationsBehaviorLock);
  if (!sharedBehavior_defaultBehavior)
  {
    v2 = objc_alloc_init(HKMedicationsBehavior);
    BOOL v3 = (void *)sharedBehavior_defaultBehavior;
    sharedBehavior_defaultBehavior = (uint64_t)v2;
  }
  id v4 = (id)_sharedMedicationsBehaviorOverride;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedMedicationsBehaviorLock);
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = (void *)sharedBehavior_defaultBehavior;
  }
  id v6 = v5;

  return v6;
}

+ (void)setSharedBehavior:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedMedicationsBehaviorLock);
  id v4 = (void *)_sharedMedicationsBehaviorOverride;
  _sharedMedicationsBehaviorOverride = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedMedicationsBehaviorLock);
}

+ (void)resetSharedBehavior
{
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedMedicationsBehaviorLock);
  v2 = (void *)_sharedMedicationsBehaviorOverride;
  _sharedMedicationsBehaviorOverride = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedMedicationsBehaviorLock);
}

+ (BOOL)_medicationFutureMigrationsEnabled
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 persistentDomainForName:*MEMORY[0x1E4F2BD20]];

  id v4 = [v3 objectForKey:@"EnableMedicationsDatabaseFutureMigrations"];
  char v5 = [v4 BOOLValue];

  return v5;
}

+ (BOOL)hasSupportedAppleWatchPaired
{
  v2 = [(id)objc_opt_class() _getActivePairedDevice];
  id v3 = v2;
  if (v2)
  {
    if ([v2 supportsMedicationsCapability]) {
      char v4 = 1;
    }
    else {
      char v4 = [v3 supportsMeadowCapability];
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

+ (id)_getActivePairedDevice
{
  v2 = +[HKMedicationsBehavior sharedBehavior];
  id v3 = [v2 mockPairedDevice];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    char v5 = [MEMORY[0x1E4F79EF0] sharedInstance];
    id v4 = [v5 getActivePairedDevice];
  }

  return v4;
}

+ (id)_unitTesting_behaviorWithMockPairedDevice:(id)a3
{
  id v3 = a3;
  id v4 = [[HKMedicationsBehavior alloc] _initWithFutureMigrationsEnabled:+[HKMedicationsBehavior _medicationFutureMigrationsEnabled] asyncMedicationReschedulesEnabled:1 mockPairedDevice:v3];

  return v4;
}

- (BOOL)medicationsFutureMigrationsEnabled
{
  return self->_medicationsFutureMigrationsEnabled;
}

- (void)setMedicationsFutureMigrationsEnabled:(BOOL)a3
{
  self->_medicationsFutureMigrationsEnabled = a3;
}

- (BOOL)asyncMedicationReschedulesEnabled
{
  return self->_asyncMedicationReschedulesEnabled;
}

- (void)setAsyncMedicationReschedulesEnabled:(BOOL)a3
{
  self->_asyncMedicationReschedulesEnabled = a3;
}

- (HKMedicationsCapabilityProviding)mockPairedDevice
{
  return self->_mockPairedDevice;
}

- (void).cxx_destruct
{
}

@end