@interface HDUserDomainConceptEntityRegistry
+ (HDUserDomainConceptEntityRegistry)registryWithDaemon:(id)a3 setSharedInstance:(BOOL)a4;
+ (HDUserDomainConceptEntityRegistry)sharedInstance;
+ (void)_setSharedInstance:(id)a3;
- (Class)userDomainConceptEntityClassForTypeIdentifier:(id)a3;
- (HDDaemon)daemon;
- (HDUserDomainConceptEntityRegistry)initWithDaemon:(id)a3;
- (id)_builtinUserDomainConceptEntityClasses;
- (id)_registeredUserDomainConceptEntityClasses;
- (id)registeredUserDomainConceptEntityClasses;
- (void)_lock_loadUserDomainConceptEntities;
- (void)_registerUserDomainConceptClassesFromProvider:(id)a3 classRegistry:(id)a4;
@end

@implementation HDUserDomainConceptEntityRegistry

- (HDUserDomainConceptEntityRegistry)initWithDaemon:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDUserDomainConceptEntityRegistry;
  v5 = [(HDUserDomainConceptEntityRegistry *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

+ (HDUserDomainConceptEntityRegistry)sharedInstance
{
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_209);
  id v4 = (id)qword_1EBA18C78;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_209);
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, a1, @"HDUserDomainConceptEntityRegistry.m", 52, @"The shared instance of HDUserDomainConceptEntityRegistry is nil. Something went wrong at initialization, and the static variable was never set." object file lineNumber description];
  }

  return (HDUserDomainConceptEntityRegistry *)v4;
}

+ (void)_setSharedInstance:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_209);
  id v4 = (void *)qword_1EBA18C78;
  qword_1EBA18C78 = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_209);
}

+ (HDUserDomainConceptEntityRegistry)registryWithDaemon:(id)a3 setSharedInstance:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [[HDUserDomainConceptEntityRegistry alloc] initWithDaemon:v6];

  if (v4) {
    [a1 _setSharedInstance:v7];
  }

  return v7;
}

- (Class)userDomainConceptEntityClassForTypeIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(HDUserDomainConceptEntityRegistry *)self _registeredUserDomainConceptEntityClasses];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return (Class)v6;
}

- (id)registeredUserDomainConceptEntityClasses
{
  v2 = [(HDUserDomainConceptEntityRegistry *)self _registeredUserDomainConceptEntityClasses];
  id v3 = [v2 allValues];

  return v3;
}

- (id)_registeredUserDomainConceptEntityClasses
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_typeIdentifierToEntityClass = self->_lock_typeIdentifierToEntityClass;
  if (!lock_typeIdentifierToEntityClass)
  {
    [(HDUserDomainConceptEntityRegistry *)self _lock_loadUserDomainConceptEntities];
    lock_typeIdentifierToEntityClass = self->_lock_typeIdentifierToEntityClass;
  }
  v5 = lock_typeIdentifierToEntityClass;
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)_registerUserDomainConceptClassesFromProvider:(id)a3 classRegistry:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 userDomainConceptEntityClasses];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v10 = [v9 allKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v8 objectForKeyedSubscript:v15])
        {
          [MEMORY[0x1E4F28B00] currentHandler];
          v19 = a2;
          v16 = id v20 = v7;
          [v15 description];
          v18 = v17 = self;
          [v16 handleFailureInMethod:v19, v17, @"HDUserDomainConceptEntityRegistry.m", 115, @"Attempting to register an already existing User Domain Concept identifier (%@) is unsupported. Please update the providing class (%@) and make sure the identifier schema is not used in any other plugin.", v18, objc_opt_class() object file lineNumber description];

          self = v17;
          a2 = v19;
          id v7 = v20;
        }
        objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(v9, "objectForKeyedSubscript:", v15), v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
}

- (void)_lock_loadUserDomainConceptEntities
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v4 = [(HDUserDomainConceptEntityRegistry *)self _builtinUserDomainConceptEntityClasses];
  v5 = (void *)[v3 initWithDictionary:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  id v7 = [WeakRetained pluginManager];
  id v8 = [v7 pluginsConformingToProtocol:&unk_1F18A8708];
  v9 = [v8 allValues];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        -[HDUserDomainConceptEntityRegistry _registerUserDomainConceptClassesFromProvider:classRegistry:](self, "_registerUserDomainConceptClassesFromProvider:classRegistry:", *(void *)(*((void *)&v17 + 1) + 8 * v14++), v5, (void)v17);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  v15 = (NSDictionary *)[v5 copy];
  lock_typeIdentifierToEntityClass = self->_lock_typeIdentifierToEntityClass;
  self->_lock_typeIdentifierToEntityClass = v15;
}

- (id)_builtinUserDomainConceptEntityClasses
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F2B690] baseUserDomainConceptIdentifier];
  v7[0] = v2;
  v8[0] = objc_opt_class();
  id v3 = [MEMORY[0x1E4F2B690] medicalUserDomainConceptIdentifier];
  v7[1] = v3;
  v8[1] = objc_opt_class();
  id v4 = [MEMORY[0x1E4F2B690] listUserDomainConceptIdentifier];
  v7[2] = v4;
  v8[2] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);

  return (HDDaemon *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_daemon);

  objc_storeStrong((id *)&self->_lock_typeIdentifierToEntityClass, 0);
}

@end