@interface BMDataProtection
+ (BOOL)canOpenFilesForProtectionClass:(unint64_t)a3;
+ (BOOL)canOpenFilesForProtectionClass:(unint64_t)a3 createNewFile:(BOOL)a4;
+ (BOOL)isClassCXUnlocked;
+ (BOOL)losesReadAccessOnLock:(unint64_t)a3;
+ (BOOL)requiresUnlockToOpen:(unint64_t)a3;
+ (id)registerForLockStateChanges:(id)a3;
+ (id)sharedInstance;
+ (int)biomeProtectionClassToOSProtectionClass:(unint64_t)a3;
+ (void)isClassCXUnlocked;
+ (void)unregister:(id)a3;
- (BMDataProtection)init;
- (id)registerForLockStateChanges:(id)a3;
- (void)handleState:(int)a3;
- (void)unregister:(id)a3;
@end

@implementation BMDataProtection

+ (BOOL)canOpenFilesForProtectionClass:(unint64_t)a3
{
  return [a1 canOpenFilesForProtectionClass:a3 createNewFile:0];
}

+ (int)biomeProtectionClassToOSProtectionClass:(unint64_t)a3
{
  if (a3 > 6) {
    return 3;
  }
  else {
    return dword_1B30D3738[a3];
  }
}

+ (BOOL)canOpenFilesForProtectionClass:(unint64_t)a3 createNewFile:(BOOL)a4
{
  char v8 = [MEMORY[0x1E4F93B10] isClassCLocked];
  char v9 = [MEMORY[0x1E4F93B10] isUnlocked];
  BOOL result = 1;
  switch(a3)
  {
    case 0uLL:
      BOOL result = v9;
      break;
    case 1uLL:
    case 2uLL:
      BOOL result = v9 | a4;
      break;
    case 3uLL:
      BOOL result = v8 ^ 1;
      break;
    case 4uLL:
    case 6uLL:
      return result;
    case 5uLL:
      if (v8) {
        goto LABEL_9;
      }
      BOOL result = [a1 isClassCXUnlocked];
      break;
    default:
      v11 = __biome_log_for_category(2);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[BMDataProtection canOpenFilesForProtectionClass:createNewFile:](a2, a3, v11);
      }

LABEL_9:
      BOOL result = 0;
      break;
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_instance_0;
  return v2;
}

uint64_t __34__BMDataProtection_sharedInstance__block_invoke()
{
  sharedInstance_instance_0 = objc_alloc_init(BMDataProtection);
  return MEMORY[0x1F41817F8]();
}

- (BMDataProtection)init
{
  v6.receiver = self;
  v6.super_class = (Class)BMDataProtection;
  v2 = [(BMDataProtection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    callbacks = v2->_callbacks;
    v2->_callbacks = 0;

    v3->_aks = 0;
  }
  return v3;
}

+ (id)registerForLockStateChanges:(id)a3
{
  id v4 = a3;
  v5 = [a1 sharedInstance];
  objc_super v6 = [v5 registerForLockStateChanges:v4];

  return v6;
}

- (id)registerForLockStateChanges:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v6 = (void *)[v4 copy];

  callbacks = self->_callbacks;
  if (!callbacks)
  {
    char v8 = (NSMutableOrderedSet *)objc_opt_new();
    char v9 = self->_callbacks;
    self->_callbacks = v8;

    callbacks = self->_callbacks;
  }
  v10 = (void *)MEMORY[0x1B3EB5AC0](v6);
  [(NSMutableOrderedSet *)callbacks addObject:v10];

  if (!self->_aks) {
    self->_aks = (void *)[MEMORY[0x1E4F93B10] registerForAKSEventsNotifications:&__block_literal_global_5];
  }
  v11 = (void *)MEMORY[0x1B3EB5AC0](v6);
  os_unfair_lock_unlock(p_lock);

  return v11;
}

void __48__BMDataProtection_registerForLockStateChanges___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[BMDataProtection sharedInstance];
  [v3 handleState:a2];
}

- (void)handleState:(int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)[(NSMutableOrderedSet *)self->_callbacks copy];
  os_unfair_lock_unlock(p_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

+ (void)unregister:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedInstance];
  [v5 unregister:v4];
}

- (void)unregister:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  callbacks = self->_callbacks;
  id v5 = (void *)MEMORY[0x1B3EB5AC0](v6);
  [(NSMutableOrderedSet *)callbacks removeObject:v5];

  if (![(NSMutableOrderedSet *)self->_callbacks count] && self->_aks)
  {
    objc_msgSend(MEMORY[0x1E4F93B10], "unregisterForAKSEventsNotifications:");
    self->_aks = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
}

+ (BOOL)requiresUnlockToOpen:(unint64_t)a3
{
  return a3 - 7 < 0xFFFFFFFFFFFFFFFCLL;
}

+ (BOOL)losesReadAccessOnLock:(unint64_t)a3
{
  return (a3 < 7) & (3u >> a3);
}

+ (BOOL)isClassCXUnlocked
{
  int extended_device_state = aks_get_extended_device_state();
  if (extended_device_state)
  {
    int v3 = extended_device_state;
    id v4 = __biome_log_for_category(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[BMDataProtection isClassCXUnlocked];
    }
  }
  return 0;
}

- (void).cxx_destruct
{
}

+ (void)isClassCXUnlocked
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B30A0000, a2, OS_LOG_TYPE_ERROR, "aks_get_extended_device_state failed with error: %d", (uint8_t *)v2, 8u);
}

+ (void)canOpenFilesForProtectionClass:(NSObject *)a3 createNewFile:.cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  int v6 = 134218242;
  uint64_t v7 = a2;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1B30A0000, a3, OS_LOG_TYPE_ERROR, "Invalid protection class (%ld) sent to %@", (uint8_t *)&v6, 0x16u);
}

@end