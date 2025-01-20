@interface HKMedicationsCriticalNotificationsStore
+ (id)sharedInstance;
- (BOOL)containsAtLeastOneOfIdentifiers:(id)a3;
- (BOOL)containsAtLeastOneOfMedications:(id)a3;
- (HKMedicationsCriticalNotificationsStore)init;
- (HKMedicationsCriticalNotificationsStore)initWithUserDefaults:(id)a3;
- (id)_getIdentifiersSetFromMedications:(id)a3;
- (id)_lock_getIdentifiersSet;
- (int64_t)identifiersCount;
- (void)_lock_removeMedication:(id)a3;
- (void)_lock_syncUserDefaultUpdateToNanoPreferences:(id)a3;
- (void)_lock_writeToUserDefaultsWithNewIdentifier:(id)a3;
- (void)addMedications:(id)a3;
- (void)removeAll;
- (void)removeMedication:(id)a3;
- (void)setMedications:(id)a3;
@end

@implementation HKMedicationsCriticalNotificationsStore

- (HKMedicationsCriticalNotificationsStore)initWithUserDefaults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMedicationsCriticalNotificationsStore;
  v6 = [(HKMedicationsCriticalNotificationsStore *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_medicationsUserDefaults, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (HKMedicationsCriticalNotificationsStore)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.private.health.medications"];
  v4 = [(HKMedicationsCriticalNotificationsStore *)self initWithUserDefaults:v3];

  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __57__HKMedicationsCriticalNotificationsStore_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(HKMedicationsCriticalNotificationsStore);

  return MEMORY[0x1F41817F8]();
}

- (void)addMedications:(id)a3
{
  id v6 = [(HKMedicationsCriticalNotificationsStore *)self _getIdentifiersSetFromMedications:a3];
  os_unfair_lock_lock(&self->_lock);
  v4 = [(HKMedicationsCriticalNotificationsStore *)self _lock_getIdentifiersSet];
  id v5 = [v6 setByAddingObjectsFromSet:v4];
  [(HKMedicationsCriticalNotificationsStore *)self _lock_writeToUserDefaultsWithNewIdentifier:v5];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeMedication:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(HKMedicationsCriticalNotificationsStore *)self _lock_removeMedication:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)setMedications:(id)a3
{
  id v4 = [(HKMedicationsCriticalNotificationsStore *)self _getIdentifiersSetFromMedications:a3];
  os_unfair_lock_lock(&self->_lock);
  [(HKMedicationsCriticalNotificationsStore *)self _lock_writeToUserDefaultsWithNewIdentifier:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeAll
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__HKMedicationsCriticalNotificationsStore_removeAll__block_invoke;
  v4[3] = &unk_1E62EAFB0;
  v4[4] = self;
  [(HKMedicationsCriticalNotificationsStore *)self _lock_syncUserDefaultUpdateToNanoPreferences:v4];
  os_unfair_lock_unlock(p_lock);
}

uint64_t __52__HKMedicationsCriticalNotificationsStore_removeAll__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:@"MedicationsCriticalNotificationIdentifiersSet"];
}

- (BOOL)containsAtLeastOneOfIdentifiers:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(HKMedicationsCriticalNotificationsStore *)self _lock_getIdentifiersSet];
  os_unfair_lock_unlock(p_lock);
  if ([v6 count])
  {
    v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    char v8 = [v6 intersectsSet:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)containsAtLeastOneOfMedications:(id)a3
{
  id v4 = objc_msgSend(a3, "hk_map:", &__block_literal_global_282);
  LOBYTE(self) = [(HKMedicationsCriticalNotificationsStore *)self containsAtLeastOneOfIdentifiers:v4];

  return (char)self;
}

id __75__HKMedicationsCriticalNotificationsStore_containsAtLeastOneOfMedications___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 semanticIdentifier];
  v3 = [v2 stringValue];

  return v3;
}

- (int64_t)identifiersCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(HKMedicationsCriticalNotificationsStore *)self _lock_getIdentifiersSet];
  os_unfair_lock_unlock(p_lock);
  int64_t v5 = [v4 count];

  return v5;
}

- (void)_lock_removeMedication:(id)a3
{
  id v8 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v4 = [(HKMedicationsCriticalNotificationsStore *)self _lock_getIdentifiersSet];
  int64_t v5 = (void *)[v4 mutableCopy];

  if ([v5 count])
  {
    id v6 = [v8 semanticIdentifier];
    v7 = [v6 stringValue];
    [v5 removeObject:v7];

    [(HKMedicationsCriticalNotificationsStore *)self _lock_writeToUserDefaultsWithNewIdentifier:v5];
  }
}

- (void)_lock_writeToUserDefaultsWithNewIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__HKMedicationsCriticalNotificationsStore__lock_writeToUserDefaultsWithNewIdentifier___block_invoke;
  v6[3] = &unk_1E62EAFF8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HKMedicationsCriticalNotificationsStore *)self _lock_syncUserDefaultUpdateToNanoPreferences:v6];
}

void __86__HKMedicationsCriticalNotificationsStore__lock_writeToUserDefaultsWithNewIdentifier___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  id v2 = [*(id *)(a1 + 40) allObjects];
  [v1 setObject:v2 forKey:@"MedicationsCriticalNotificationIdentifiersSet"];
}

- (void)_lock_syncUserDefaultUpdateToNanoPreferences:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_assert_owner(p_lock);
  v4[2](v4);

  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"MedicationsFollowUpNotificationsEnabled", @"MedicationsCriticalNotificationIdentifiersSet", 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  HKSynchronizeNanoPreferencesUserDefaults();
}

- (id)_lock_getIdentifiersSet
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = [(NSUserDefaults *)self->_medicationsUserDefaults objectForKey:@"MedicationsCriticalNotificationIdentifiersSet"];
  if (v3) {
    [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  }
  else {
  id v4 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v4;
}

- (id)_getIdentifiersSetFromMedications:(id)a3
{
  return (id)objc_msgSend(a3, "hk_mapToSet:", &__block_literal_global_284);
}

id __77__HKMedicationsCriticalNotificationsStore__getIdentifiersSetFromMedications___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 semanticIdentifier];
  v3 = [v2 stringValue];

  return v3;
}

- (void).cxx_destruct
{
}

@end