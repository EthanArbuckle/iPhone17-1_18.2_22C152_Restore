@interface _HMAccessoryCollectionSettingItemClassManager
+ (NSSet)defaultItemValueClasses;
+ (_HMAccessoryCollectionSettingItemClassManager)sharedManager;
- (BOOL)hasCustomItemValueClassesForKeyPath:(id)a3;
- (_HMAccessoryCollectionSettingItemClassManager)init;
- (id)itemValueClassesForKeyPath:(id)a3;
- (void)removeItemValueClassesForKeyPath:(id)a3;
- (void)setItemValueClasses:(id)a3 forKeyPath:(id)a4;
@end

@implementation _HMAccessoryCollectionSettingItemClassManager

- (void).cxx_destruct
{
}

- (void)removeItemValueClassesForKeyPath:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_classes removeObjectForKey:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setItemValueClasses:(id)a3 forKeyPath:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (!v7)
  {
    v10 = (_Unwind_Exception *)_HMFPreconditionFailure();
    os_unfair_lock_unlock(v4);
    _Unwind_Resume(v10);
  }
  v8 = v7;
  v9 = (void *)[v11 copy];
  os_unfair_lock_lock_with_options();
  if ([v9 count]) {
    [(NSMutableDictionary *)self->_classes setObject:v9 forKey:v8];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)itemValueClassesForKeyPath:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = (_Unwind_Exception *)_HMFPreconditionFailure();
    os_unfair_lock_unlock(v3);
    _Unwind_Resume(v12);
  }
  v6 = v5;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v8 = [(NSMutableDictionary *)self->_classes objectForKey:v6];
  os_unfair_lock_unlock(p_lock);
  if ([v8 count])
  {
    id v9 = v8;
  }
  else
  {
    id v9 = +[_HMAccessoryCollectionSettingItemClassManager defaultItemValueClasses];
  }
  v10 = v9;

  return v10;
}

- (BOOL)hasCustomItemValueClassesForKeyPath:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = [(NSMutableDictionary *)self->_classes objectForKey:v4];
  LOBYTE(self) = v6 != 0;

  os_unfair_lock_unlock(p_lock);
  return (char)self;
}

- (_HMAccessoryCollectionSettingItemClassManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)_HMAccessoryCollectionSettingItemClassManager;
  v2 = [(_HMAccessoryCollectionSettingItemClassManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    classes = v2->_classes;
    v2->_classes = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (_HMAccessoryCollectionSettingItemClassManager)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_477);
  }
  v2 = (void *)sharedManager_sharedManager;

  return (_HMAccessoryCollectionSettingItemClassManager *)v2;
}

+ (NSSet)defaultItemValueClasses
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:3];
  id v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return (NSSet *)v4;
}

@end