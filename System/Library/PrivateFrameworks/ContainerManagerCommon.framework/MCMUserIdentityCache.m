@interface MCMUserIdentityCache
+ (BOOL)personasAreSupported;
+ (id)defaultUserIdentity;
+ (id)globalBundleUserIdentity;
+ (id)globalSystemUserIdentity;
+ (id)userIdentityWithPersonaAttributes:(id)a3;
+ (id)userIdentityWithPersonaAttributes:(id)a3 POSIXUser:(id)a4 forceUnspecific:(BOOL)a5;
+ (id)userIdentityWithPersonaAttributes:(id)a3 forceUnspecific:(BOOL)a4;
- (BOOL)_lock_resync_fromUserPersonaAttributes:(id)a3;
- (BOOL)cacheInvalid;
- (MCMContainerClassIterator)classIterator;
- (MCMUserIdentity)defaultUserIdentity;
- (MCMUserIdentity)lock_userIdentityForPersonalPersona;
- (MCMUserIdentity)lock_userIdentityForUnspecificPersona;
- (MCMUserIdentityCache)init;
- (NSDictionary)lock_bundleToDataSeparatedIdentitiesMap;
- (NSDictionary)lock_personaIDToUserIdentityMap;
- (NSDictionary)lock_personaUniqueStringToUserIdentityMap;
- (NSHashTable)observers;
- (NSMutableDictionary)lock_libraryRepairForUserIdentity;
- (NSMutableDictionary)lock_managedPathRegistryForUserIdentity;
- (NSSet)previousUserIdentities;
- (id)_lock_userIdentitiesForBundleIdentifier:(id)a3;
- (id)_lock_userIdentityForCurrentUserWithPersonaUniqueString:(id)a3;
- (id)allAccessibleUserIdentities;
- (id)globalBundleUserIdentity;
- (id)globalSystemUserIdentity;
- (id)libraryRepairForUserIdentity:(id)a3;
- (id)managedUserPathRegistryForUserIdentity:(id)a3;
- (id)personaUniqueStringForCurrentContext;
- (id)unspecificUserIdentity;
- (id)userIdentitiesForBundleIdentifier:(id)a3;
- (id)userIdentitiesForContainerConfig:(id)a3 originatorUserIdentities:(id)a4;
- (id)userIdentityForClient:(container_client *)a3 error:(id *)a4;
- (id)userIdentityForContainerConfig:(id)a3 originatorUserIdentity:(id)a4;
- (id)userIdentityForCurrentContext;
- (id)userIdentityForCurrentUserWithPersonaUniqueString:(id)a3;
- (id)userIdentityForLegacyMobileUser;
- (id)userIdentityForPersonaUniqueString:(id)a3 POSIXUser:(id)a4;
- (id)userIdentityForPersonalPersona;
- (id)userIdentityForPersonalPersonaWithPOSIXUser:(id)a3;
- (id)userIdentityWithPersonaID:(unsigned int)a3;
- (unint64_t)savedGeneration;
- (void)_lock_flush;
- (void)_lock_flushAndRepopulateWithUserIdentities:(id)a3;
- (void)_lock_resync;
- (void)_notifyObserversOfChangesWithUserIdentities:(id)a3 firstFetch:(BOOL)a4;
- (void)_refreshFromUserManagementIfNecessary;
- (void)addObserver:(id)a3;
- (void)flush;
- (void)flushAndRepopulateWithUserIdentities:(id)a3;
- (void)forEachAccessibleUserIdentitySynchronouslyExecuteBlock:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCacheInvalid:(BOOL)a3;
- (void)setPreviousUserIdentities:(id)a3;
- (void)setSavedGeneration:(unint64_t)a3;
@end

@implementation MCMUserIdentityCache

- (id)libraryRepairForUserIdentity:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(MCMUserIdentityCache *)self defaultUserIdentity];
  }
  os_unfair_lock_lock(&self->_lock);
  v5 = [(NSMutableDictionary *)self->_lock_libraryRepairForUserIdentity objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(&self->_lock);
  if (!v5)
  {
    v6 = [(MCMUserIdentityCache *)self managedUserPathRegistryForUserIdentity:v4];
    v7 = [MCMLibraryRepairForUser alloc];
    v8 = +[MCMFileManager defaultManager];
    v9 = [(MCMUserIdentityCache *)self classIterator];
    v5 = [(MCMLibraryRepairForUser *)v7 initWithManagedUserPathRegistry:v6 fileManager:v8 classIterator:v9];

    os_unfair_lock_lock(&self->_lock);
    [(NSMutableDictionary *)self->_lock_libraryRepairForUserIdentity setObject:v5 forKeyedSubscript:v4];
    os_unfair_lock_unlock(&self->_lock);
    if ([v4 personaType] != 3)
    {
      id v14 = 0;
      BOOL v10 = [(MCMLibraryRepair *)v5 createPathsIfNecessaryWithError:&v14];
      id v11 = v14;
      if (!v10)
      {
        v12 = container_log_handle_for_category();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v16 = v4;
          __int16 v17 = 2114;
          id v18 = v11;
          _os_log_error_impl(&dword_1D7739000, v12, OS_LOG_TYPE_ERROR, "Failed creating working directories for %@: %{public}@", buf, 0x16u);
        }
      }
    }
  }

  return v5;
}

- (id)userIdentityForContainerConfig:(id)a3 originatorUserIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (([v6 personaAndUserSpecific] & 1) == 0)
  {
    if ([v6 usesGlobalBundleUserIdentity])
    {
      uint64_t v9 = [(MCMUserIdentityCache *)self globalBundleUserIdentity];
    }
    else
    {
      if ([v6 usesGlobalSystemUserIdentity]) {
        [(MCMUserIdentityCache *)self globalSystemUserIdentity];
      }
      else {
      uint64_t v9 = [(MCMUserIdentityCache *)self defaultUserIdentity];
      }
    }
    v8 = (void *)v9;
  }
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(MCMUserIdentityCache *)self defaultUserIdentity];
  }
  id v11 = v10;

  return v11;
}

- (id)userIdentitiesForBundleIdentifier:(id)a3
{
  id v4 = a3;
  [(MCMUserIdentityCache *)self _refreshFromUserManagementIfNecessary];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(MCMUserIdentityCache *)self _lock_userIdentitiesForBundleIdentifier:v4];

  os_unfair_lock_unlock(p_lock);
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CAD0] set];
  }
  v8 = v7;

  return v8;
}

- (id)_lock_userIdentitiesForBundleIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  id v6 = [(MCMUserIdentityCache *)self lock_bundleToDataSeparatedIdentitiesMap];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    v8 = [(MCMUserIdentityCache *)self lock_userIdentityForPersonalPersona];
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    if (v8)
    {
      id v10 = [(MCMUserIdentityCache *)self lock_userIdentityForPersonalPersona];
      id v7 = [v9 setWithObject:v10];
    }
    else
    {
      id v7 = [MEMORY[0x1E4F1CAD0] set];
    }
  }

  return v7;
}

- (id)userIdentityForCurrentUserWithPersonaUniqueString:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MCMUserIdentityCache *)self _refreshFromUserManagementIfNecessary];
  if (![(id)objc_opt_class() personasAreSupported])
  {
    uint64_t v9 = [(MCMUserIdentityCache *)self userIdentityForPersonalPersona];
LABEL_9:
    id v7 = (void *)v9;
    goto LABEL_10;
  }
  if (!v4)
  {
    uint64_t v9 = [(MCMUserIdentityCache *)self unspecificUserIdentity];
    goto LABEL_9;
  }
  id v5 = [NSString stringWithUTF8String:*MEMORY[0x1E4F14060]];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = [(MCMUserIdentityCache *)self userIdentityForPersonalPersona];
    v8 = container_log_handle_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v12 = [v7 debugDescription];
      int v13 = 138412290;
      id v14 = v12;
      _os_log_debug_impl(&dword_1D7739000, v8, OS_LOG_TYPE_DEBUG, "Sentinel persona, using: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v7 = [(MCMUserIdentityCache *)self _lock_userIdentityForCurrentUserWithPersonaUniqueString:v4];
    os_unfair_lock_unlock(p_lock);
  }
LABEL_10:

  return v7;
}

- (id)userIdentityForPersonaUniqueString:(id)a3 POSIXUser:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(MCMUserIdentityCache *)self _refreshFromUserManagementIfNecessary];
  if ([v7 isRoleUser])
  {
    id v8 = containermanager_copy_global_configuration();
    uint64_t v9 = [v8 defaultUser];

    id v7 = (id)v9;
  }
  if (![(id)objc_opt_class() personasAreSupported])
  {
    v12 = [(MCMUserIdentityCache *)self userIdentityForPersonalPersonaWithPOSIXUser:v7];
    goto LABEL_16;
  }
  if (!v6)
  {
    v12 = [(MCMUserIdentityCache *)self unspecificUserIdentity];
    if (!v12) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  id v10 = [NSString stringWithUTF8String:*MEMORY[0x1E4F14060]];
  int v11 = [v6 isEqualToString:v10];

  if (!v11)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v12 = [(MCMUserIdentityCache *)self _lock_userIdentityForCurrentUserWithPersonaUniqueString:v6];
    os_unfair_lock_unlock(p_lock);
    if (!v12) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  v12 = [(MCMUserIdentityCache *)self userIdentityForPersonalPersona];
  int v13 = container_log_handle_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = [v12 debugDescription];
    int v20 = 138412290;
    v21 = v19;
    _os_log_debug_impl(&dword_1D7739000, v13, OS_LOG_TYPE_DEBUG, "Sentinel persona, using: %@", (uint8_t *)&v20, 0xCu);
  }
  if (v12)
  {
LABEL_14:
    uint64_t v15 = [v12 posixUser];
    char v16 = [v15 isEqual:v7];

    if ((v16 & 1) == 0)
    {
      uint64_t v17 = [v12 userIdentityWithPOSIXUser:v7];

      v12 = (void *)v17;
    }
  }
LABEL_16:

  return v12;
}

- (id)userIdentityForPersonalPersonaWithPOSIXUser:(id)a3
{
  id v4 = a3;
  [(MCMUserIdentityCache *)self _refreshFromUserManagementIfNecessary];
  if ([v4 isRoleUser])
  {
    id v5 = containermanager_copy_global_configuration();
    uint64_t v6 = [v5 defaultUser];

    id v4 = (id)v6;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v8 = [(MCMUserIdentityCache *)self lock_userIdentityForPersonalPersona];
  os_unfair_lock_unlock(p_lock);
  uint64_t v9 = [v8 posixUser];
  char v10 = [v9 isEqual:v4];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [v8 userIdentityWithPOSIXUser:v4];

    id v8 = (void *)v11;
  }

  return v8;
}

- (MCMUserIdentity)lock_userIdentityForPersonalPersona
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_cacheInvalid) {
    [(MCMUserIdentityCache *)self _lock_resync];
  }
  lock_userIdentityForPersonalPersona = self->_lock_userIdentityForPersonalPersona;

  return lock_userIdentityForPersonalPersona;
}

- (id)_lock_userIdentityForCurrentUserWithPersonaUniqueString:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v4)
  {
    id v5 = [(MCMUserIdentityCache *)self lock_personaUniqueStringToUserIdentityMap];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];

    id v7 = container_log_handle_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = [v6 shortDescription];
      int v13 = 138412546;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_debug_impl(&dword_1D7739000, v7, OS_LOG_TYPE_DEBUG, "Found %@ for %@", (uint8_t *)&v13, 0x16u);
    }
    if (!v6)
    {
      [(MCMUserIdentityCache *)self _lock_flush];
      id v8 = [(MCMUserIdentityCache *)self lock_personaUniqueStringToUserIdentityMap];
      uint64_t v6 = [v8 objectForKeyedSubscript:v4];

      uint64_t v9 = container_log_handle_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v12 = [v6 shortDescription];
        int v13 = 138412546;
        id v14 = v12;
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_debug_impl(&dword_1D7739000, v9, OS_LOG_TYPE_DEBUG, "After refresh, found %@ for %@", (uint8_t *)&v13, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSDictionary)lock_personaUniqueStringToUserIdentityMap
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_cacheInvalid) {
    [(MCMUserIdentityCache *)self _lock_resync];
  }
  lock_personaUniqueStringToUserIdentityMap = self->_lock_personaUniqueStringToUserIdentityMap;

  return lock_personaUniqueStringToUserIdentityMap;
}

- (NSDictionary)lock_bundleToDataSeparatedIdentitiesMap
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_cacheInvalid) {
    [(MCMUserIdentityCache *)self _lock_resync];
  }
  lock_bundleToDataSeparatedIdentitiesMap = self->_lock_bundleToDataSeparatedIdentitiesMap;

  return lock_bundleToDataSeparatedIdentitiesMap;
}

- (id)userIdentityForClient:(container_client *)a3 error:(id *)a4
{
  [(MCMUserIdentityCache *)self _refreshFromUserManagementIfNecessary];
  persona_unique_string = (void *)container_client_get_persona_unique_string();
  uint64_t euid = container_client_get_euid();
  id v8 = containermanager_copy_global_configuration();
  uint64_t v9 = [v8 defaultUser];

  id v10 = containermanager_copy_global_configuration();
  int v11 = [v10 userContainerMode];

  if (v11 == 2)
  {
    uint64_t v12 = +[MCMPOSIXUser posixUserWithUID:euid];

    uint64_t v9 = (void *)v12;
  }
  if (persona_unique_string)
  {
    persona_unique_string = [NSString stringWithUTF8String:persona_unique_string];
  }
  uint64_t v13 = [(MCMUserIdentityCache *)self userIdentityForPersonaUniqueString:persona_unique_string POSIXUser:v9];
  id v14 = (void *)v13;
  if (a4 && !v13) {
    *a4 = 0;
  }

  return v14;
}

- (id)personaUniqueStringForCurrentContext
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() personasAreSupported] && objc_opt_class())
  {
    v2 = [MEMORY[0x1E4FB36F0] sharedManager];
    v3 = [v2 currentPersona];

    id v4 = [v3 userPersonaUniqueString];
    if (!v4)
    {
      id v5 = container_log_handle_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_1D7739000, v5, OS_LOG_TYPE_DEFAULT, "Could not fetch persona unique string", v8, 2u);
      }
    }
  }
  else
  {
    id v4 = 0;
  }
  if (personaUniqueStringForCurrentContext_onceToken != -1)
  {
    dispatch_once(&personaUniqueStringForCurrentContext_onceToken, &__block_literal_global_13);
    if (v4) {
      goto LABEL_11;
    }
LABEL_15:
    id v6 = 0;
    goto LABEL_16;
  }
  if (!v4) {
    goto LABEL_15;
  }
LABEL_11:
  id v6 = [(id)personaUniqueStringForCurrentContext_dedupCache objectForKey:v4];
  if (!v6)
  {
    [(id)personaUniqueStringForCurrentContext_dedupCache setObject:v4 forKey:v4];
    id v6 = v4;
  }

LABEL_16:

  return v6;
}

- (void)_refreshFromUserManagementIfNecessary
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() personasAreSupported])
  {
    v3 = [MEMORY[0x1E4FB36F0] sharedManager];
    uint64_t v9 = 0;
    unint64_t v4 = [v3 personaGenerationIdentifierWithError:&v9];

    if (v4 && v4 != self->_savedGeneration)
    {
      self->_savedGeneration = v4;
      id v5 = container_log_handle_for_category();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        [(MCMUserIdentityCache *)self flush];
        return;
      }
      *(_DWORD *)buf = 134217984;
      unint64_t v11 = v4;
      id v6 = "Flushing cache because UM persona list has updated. (generation %llu)";
      id v7 = v5;
      uint32_t v8 = 12;
    }
    else
    {
      if (self->_fetchedFromUM) {
        return;
      }
      id v5 = container_log_handle_for_category();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      *(_WORD *)buf = 0;
      id v6 = "Resync cache because UM persona list has not yet been fetched successfully.";
      id v7 = v5;
      uint32_t v8 = 2;
    }
    _os_log_impl(&dword_1D7739000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    goto LABEL_10;
  }
}

+ (BOOL)personasAreSupported
{
  if (MCMPersonasAreSupported_onceToken != -1) {
    dispatch_once(&MCMPersonasAreSupported_onceToken, &__block_literal_global_8662);
  }
  if (!MCMPersonasAreSupported_staticPersonasSupported) {
    return 0;
  }
  id v2 = containermanager_copy_global_configuration();
  BOOL v3 = [v2 dispositionForContainerClass:2] == 1;

  return v3;
}

- (id)userIdentityForPersonalPersona
{
  id v3 = containermanager_copy_global_configuration();
  unint64_t v4 = [v3 defaultUser];
  id v5 = [(MCMUserIdentityCache *)self userIdentityForPersonalPersonaWithPOSIXUser:v4];

  return v5;
}

- (id)globalSystemUserIdentity
{
  id v2 = objc_opt_class();

  return (id)[v2 globalSystemUserIdentity];
}

+ (id)globalSystemUserIdentity
{
  if (globalSystemUserIdentity_onceToken != -1) {
    dispatch_once(&globalSystemUserIdentity_onceToken, &__block_literal_global_11);
  }
  id v2 = (void *)globalSystemUserIdentity_userIdentity;

  return v2;
}

- (id)userIdentityWithPersonaID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(MCMUserIdentityCache *)self _refreshFromUserManagementIfNecessary];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(MCMUserIdentityCache *)self lock_personaIDToUserIdentityMap];
  id v7 = [NSNumber numberWithUnsignedInt:v3];
  uint32_t v8 = [v6 objectForKeyedSubscript:v7];

  uint64_t v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v14 = [v8 shortDescription];
    int v16 = 138412546;
    uint64_t v17 = v14;
    __int16 v18 = 1024;
    int v19 = v3;
    _os_log_debug_impl(&dword_1D7739000, v9, OS_LOG_TYPE_DEBUG, "Found %@ for ID: %d", (uint8_t *)&v16, 0x12u);
  }
  if (!v8)
  {
    [(MCMUserIdentityCache *)self _lock_flush];
    id v10 = [(MCMUserIdentityCache *)self lock_personaIDToUserIdentityMap];
    unint64_t v11 = [NSNumber numberWithUnsignedInt:v3];
    uint32_t v8 = [v10 objectForKeyedSubscript:v11];

    uint64_t v12 = container_log_handle_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __int16 v15 = [v8 shortDescription];
      int v16 = 138412546;
      uint64_t v17 = v15;
      __int16 v18 = 1024;
      int v19 = v3;
      _os_log_debug_impl(&dword_1D7739000, v12, OS_LOG_TYPE_DEBUG, "After refresh, found %@ for ID: %d", (uint8_t *)&v16, 0x12u);
    }
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (NSDictionary)lock_personaIDToUserIdentityMap
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_cacheInvalid) {
    [(MCMUserIdentityCache *)self _lock_resync];
  }
  lock_personaIDToUserIdentityMap = self->_lock_personaIDToUserIdentityMap;

  return lock_personaIDToUserIdentityMap;
}

- (id)allAccessibleUserIdentities
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(MCMUserIdentityCache *)self _refreshFromUserManagementIfNecessary];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  if ([(id)objc_opt_class() personasAreSupported])
  {
    os_unfair_lock_lock(&self->_lock);
    unint64_t v4 = [(MCMUserIdentityCache *)self lock_personaUniqueStringToUserIdentityMap];
    id v5 = [v4 allValues];

    os_unfair_lock_unlock(&self->_lock);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          unint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (([v11 isNoSpecificPersona] & 1) == 0) {
            [v3 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v20 count:16];
      }
      while (v8);
    }

    if (![v3 count])
    {
      uint64_t v12 = container_log_handle_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v16 = 138412546;
        uint64_t v17 = self;
        __int16 v18 = 2112;
        int v19 = v3;
        _os_log_error_impl(&dword_1D7739000, v12, OS_LOG_TYPE_ERROR, "Expected to find at least one persona; self = %@, personaAttributeList = %@",
          (uint8_t *)&v16,
          0x16u);
      }

      uint64_t v13 = [(MCMUserIdentityCache *)self defaultUserIdentity];
      [v3 addObject:v13];
    }
  }
  else
  {
    id v14 = [(MCMUserIdentityCache *)self defaultUserIdentity];
    [v3 addObject:v14];
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_defaultUserIdentity, 0);
  objc_storeStrong((id *)&self->_classIterator, 0);
  objc_storeStrong((id *)&self->_previousUserIdentities, 0);
  objc_storeStrong((id *)&self->_lock_libraryRepairForUserIdentity, 0);
  objc_storeStrong((id *)&self->_lock_managedPathRegistryForUserIdentity, 0);
  objc_storeStrong((id *)&self->_lock_userIdentityForUnspecificPersona, 0);
  objc_storeStrong((id *)&self->_lock_userIdentityForPersonalPersona, 0);
  objc_storeStrong((id *)&self->_lock_personaIDToUserIdentityMap, 0);
  objc_storeStrong((id *)&self->_lock_personaUniqueStringToUserIdentityMap, 0);
  objc_storeStrong((id *)&self->_lock_bundleToDataSeparatedIdentitiesMap, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_flushQueue, 0);
}

- (void)setSavedGeneration:(unint64_t)a3
{
  self->_savedGeneration = a3;
}

- (unint64_t)savedGeneration
{
  return self->_savedGeneration;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setCacheInvalid:(BOOL)a3
{
  self->_cacheInvalid = a3;
}

- (BOOL)cacheInvalid
{
  return self->_cacheInvalid;
}

- (MCMUserIdentity)defaultUserIdentity
{
  return self->_defaultUserIdentity;
}

- (MCMContainerClassIterator)classIterator
{
  return self->_classIterator;
}

- (void)setPreviousUserIdentities:(id)a3
{
  p_previousUserIdentities = &self->_previousUserIdentities;

  objc_storeStrong((id *)p_previousUserIdentities, a3);
}

- (NSSet)previousUserIdentities
{
  return self->_previousUserIdentities;
}

- (NSMutableDictionary)lock_libraryRepairForUserIdentity
{
  return self->_lock_libraryRepairForUserIdentity;
}

- (NSMutableDictionary)lock_managedPathRegistryForUserIdentity
{
  return self->_lock_managedPathRegistryForUserIdentity;
}

- (void)_notifyObserversOfChangesWithUserIdentities:(id)a3 firstFetch:(BOOL)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  context = (void *)MEMORY[0x1D9478DF0]();
  id v6 = [(MCMUserIdentityCache *)self observers];
  objc_sync_enter(v6);
  uint64_t v7 = [(MCMUserIdentityCache *)self observers];
  uint64_t v8 = [v7 allObjects];

  objc_sync_exit(v6);
  v40 = (void *)[v36 mutableCopy];
  uint64_t v9 = [(MCMUserIdentityCache *)self previousUserIdentities];
  [v40 minusSet:v9];

  id v10 = [(MCMUserIdentityCache *)self previousUserIdentities];
  uint64_t v11 = [v10 mutableCopy];

  v39 = (void *)v11;
  uint64_t v12 = (void *)v11;
  id v13 = v36;
  [v12 minusSet:v36];
  if (!a4)
  {
    id v14 = [(MCMUserIdentityCache *)self previousUserIdentities];
    if (![v14 count])
    {
      id v13 = v36;
      uint64_t v15 = [v36 count];

      if (!v15) {
        goto LABEL_6;
      }
      id v14 = [(MCMUserIdentityCache *)self defaultUserIdentity];
      [v39 addObject:v14];
    }

    id v13 = v36;
  }
LABEL_6:
  [(MCMUserIdentityCache *)self setPreviousUserIdentities:v13];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  obuint64_t j = v8;
  uint64_t v41 = [obj countByEnumeratingWithState:&v60 objects:v59 count:16];
  if (v41)
  {
    uint64_t v38 = *(void *)v61;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v61 != v38)
        {
          uint64_t v17 = v16;
          objc_enumerationMutation(obj);
          uint64_t v16 = v17;
        }
        uint64_t v42 = v16;
        __int16 v18 = *(void **)(*((void *)&v60 + 1) + 8 * v16);
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v19 = v39;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v55 objects:v54 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v56;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v56 != v21) {
                objc_enumerationMutation(v19);
              }
              uint64_t v23 = *(void *)(*((void *)&v55 + 1) + 8 * i);
              long long v24 = container_log_handle_for_category();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v25 = (objc_class *)objc_opt_class();
                v26 = NSStringFromClass(v25);
                *(_DWORD *)buf = 134218498;
                v49 = v18;
                __int16 v50 = 2112;
                v51 = v26;
                __int16 v52 = 2112;
                uint64_t v53 = v23;
                _os_log_impl(&dword_1D7739000, v24, OS_LOG_TYPE_DEFAULT, "Notifying observer <0x%p; %@> about an invalid user identity: %@",
                  buf,
                  0x20u);
              }
              [v18 userIdentityCache:self didInvalidateUserIdentity:v23];
            }
            uint64_t v20 = [v19 countByEnumeratingWithState:&v55 objects:v54 count:16];
          }
          while (v20);
        }

        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v27 = v40;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v44 objects:v43 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v45 != v29) {
                objc_enumerationMutation(v27);
              }
              uint64_t v31 = *(void *)(*((void *)&v44 + 1) + 8 * j);
              v32 = container_log_handle_for_category();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                v33 = (objc_class *)objc_opt_class();
                v34 = NSStringFromClass(v33);
                *(_DWORD *)buf = 134218498;
                v49 = v18;
                __int16 v50 = 2112;
                v51 = v34;
                __int16 v52 = 2112;
                uint64_t v53 = v31;
                _os_log_impl(&dword_1D7739000, v32, OS_LOG_TYPE_DEFAULT, "Notifying observer <0x%p; %@> about a new user identity: %@",
                  buf,
                  0x20u);
              }
              [v18 userIdentityCache:self didAddUserIdentity:v31];
            }
            uint64_t v28 = [v27 countByEnumeratingWithState:&v44 objects:v43 count:16];
          }
          while (v28);
        }

        uint64_t v16 = v42 + 1;
      }
      while (v42 + 1 != v41);
      uint64_t v41 = [obj countByEnumeratingWithState:&v60 objects:v59 count:16];
    }
    while (v41);
  }
}

- (BOOL)_lock_resync_fromUserPersonaAttributes:(id)a3
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v105 = self;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v103 = MEMORY[0x1D9478DF0]();
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v109 = [MEMORY[0x1E4F1CA80] set];
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  v112 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  obuint64_t j = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v146 objects:v145 count:16];
  if (!v7) {
    goto LABEL_11;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v147;
  v108 = v6;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v147 != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void **)(*((void *)&v146 + 1) + 8 * i);
      uint64_t v12 = container_log_handle_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v13 = [v11 isUniversalPersona];
        int v14 = [v11 isSystemPersona];
        int v15 = [v11 isPersonalPersona];
        int v16 = [v11 isDataSeparatedPersona];
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v144 = v13;
        *(_WORD *)&v144[4] = 1024;
        *(_DWORD *)&v144[6] = v14;
        *(_WORD *)&v144[10] = 1024;
        *(_DWORD *)&v144[12] = v15;
        id v6 = v108;
        *(_WORD *)&v144[16] = 1024;
        *(_DWORD *)&v144[18] = v16;
        *(_WORD *)&v144[22] = 2112;
        *(void *)&v144[24] = v11;
        _os_log_debug_impl(&dword_1D7739000, v12, OS_LOG_TYPE_DEBUG, "[Personal] Looking at universal=%d system=%d personal=%d ds=%d attributes: %@", buf, 0x24u);
      }

      if ([v11 isPersonalPersona])
      {
        uint64_t v21 = [v11 userPersonaUniqueString];
        if (v21)
        {
          long long v22 = (void *)v21;
          uint64_t v17 = [(id)objc_opt_class() userIdentityWithPersonaAttributes:v11];
          os_log_t log = [(id)objc_opt_class() userIdentityWithPersonaAttributes:v11 forceUnspecific:1];
          uint64_t v23 = [v6 objectForKeyedSubscript:v22];

          if (v23)
          {
            long long v24 = container_log_handle_for_category();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)v144 = v22;
              *(_WORD *)&v144[8] = 2112;
              *(void *)&v144[10] = v11;
              _os_log_fault_impl(&dword_1D7739000, v24, OS_LOG_TYPE_FAULT, "Persona with duplicate unique string [%@]: %@", buf, 0x16u);
            }
          }
          [v6 setObject:v17 forKeyedSubscript:v22];
          uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "userPersona_id"));
          [v112 setObject:v17 forKeyedSubscript:v25];

          v26 = container_log_handle_for_category();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)v144 = v11;
            *(_WORD *)&v144[8] = 2112;
            *(void *)&v144[10] = v17;
            *(_WORD *)&v144[18] = 2112;
            *(void *)&v144[20] = log;
            _os_log_impl(&dword_1D7739000, v26, OS_LOG_TYPE_DEFAULT, "Found personal persona %@: created personal %@, unspecific %@", buf, 0x20u);
          }

          if (!v17 || !log) {
            goto LABEL_12;
          }
          long long v142 = 0u;
          long long v141 = 0u;
          long long v140 = 0u;
          long long v139 = 0u;
          id v116 = obj;
          uint64_t v27 = [v116 countByEnumeratingWithState:&v139 objects:v138 count:16];
          v113 = v17;
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v140;
            do
            {
              for (uint64_t j = 0; j != v28; ++j)
              {
                if (*(void *)v140 != v29) {
                  objc_enumerationMutation(v116);
                }
                uint64_t v31 = *(void **)(*((void *)&v139 + 1) + 8 * j);
                v32 = container_log_handle_for_category();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  int v41 = [v31 isUniversalPersona];
                  int v42 = [v31 isSystemPersona];
                  int v43 = [v31 isPersonalPersona];
                  int v44 = [v31 isDataSeparatedPersona];
                  *(_DWORD *)buf = 67110146;
                  *(_DWORD *)v144 = v41;
                  *(_WORD *)&v144[4] = 1024;
                  *(_DWORD *)&v144[6] = v42;
                  id v6 = v108;
                  *(_WORD *)&v144[10] = 1024;
                  *(_DWORD *)&v144[12] = v43;
                  uint64_t v17 = v113;
                  *(_WORD *)&v144[16] = 1024;
                  *(_DWORD *)&v144[18] = v44;
                  *(_WORD *)&v144[22] = 2112;
                  *(void *)&v144[24] = v31;
                  _os_log_debug_impl(&dword_1D7739000, v32, OS_LOG_TYPE_DEBUG, "[Multi] Looking at universal=%d system=%d personal=%d ds=%d attributes: %@", buf, 0x24u);
                }

                if (([v31 isPersonalPersona] & 1) == 0
                  && ([v31 isDataSeparatedPersona] & 1) == 0)
                {
                  v33 = [v31 userPersonaBundleIDList];
                  v34 = container_log_handle_for_category();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                  {
                    int v35 = objc_msgSend(v31, "userPersona_id");
                    *(_DWORD *)buf = 67109634;
                    *(_DWORD *)v144 = v35;
                    *(_WORD *)&v144[4] = 2112;
                    *(void *)&v144[6] = v31;
                    *(_WORD *)&v144[14] = 2112;
                    *(void *)&v144[16] = v33;
                    _os_log_impl(&dword_1D7739000, v34, OS_LOG_TYPE_DEFAULT, "Fetched bundle ID list for (%d) %@: %@", buf, 0x1Cu);
                  }

                  if (v33 && [v33 count])
                  {
                    id v36 = [MEMORY[0x1E4F1CAD0] setWithArray:v33];
                    [v109 unionSet:v36];
                  }
                  v37 = [v31 userPersonaUniqueString];
                  if (v37)
                  {
                    uint64_t v38 = [v6 objectForKeyedSubscript:v37];

                    if (v38)
                    {
                      v39 = container_log_handle_for_category();
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        *(void *)v144 = v37;
                        *(_WORD *)&v144[8] = 2112;
                        *(void *)&v144[10] = v31;
                        _os_log_fault_impl(&dword_1D7739000, v39, OS_LOG_TYPE_FAULT, "Persona with duplicate unique string [%@]: %@", buf, 0x16u);
                      }
                    }
                    [v6 setObject:log forKeyedSubscript:v37];
                  }
                  v40 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v31, "userPersona_id"));
                  [v112 setObject:log forKeyedSubscript:v40];

                  uint64_t v17 = v113;
                }
              }
              uint64_t v28 = [v116 countByEnumeratingWithState:&v139 objects:v138 count:16];
            }
            while (v28);
          }

          long long v136 = 0u;
          long long v137 = 0u;
          long long v134 = 0u;
          long long v135 = 0u;
          id v111 = v116;
          uint64_t v45 = [v111 countByEnumeratingWithState:&v134 objects:v133 count:16];
          if (v45)
          {
            uint64_t v47 = v45;
            uint64_t v48 = *(void *)v135;
            *(void *)&long long v46 = 138412290;
            long long v102 = v46;
            uint64_t v106 = *(void *)v135;
            do
            {
              uint64_t v49 = 0;
              uint64_t v107 = v47;
              do
              {
                if (*(void *)v135 != v48) {
                  objc_enumerationMutation(v111);
                }
                __int16 v50 = *(void **)(*((void *)&v134 + 1) + 8 * v49);
                if (objc_msgSend(v50, "isDataSeparatedPersona", v102))
                {
                  v51 = container_log_handle_for_category();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                  {
                    int v81 = [v50 isUniversalPersona];
                    int v82 = [v50 isSystemPersona];
                    int v83 = [v50 isPersonalPersona];
                    int v84 = [v50 isDataSeparatedPersona];
                    *(_DWORD *)buf = 67110146;
                    *(_DWORD *)v144 = v81;
                    *(_WORD *)&v144[4] = 1024;
                    *(_DWORD *)&v144[6] = v82;
                    uint64_t v48 = v106;
                    uint64_t v47 = v107;
                    *(_WORD *)&v144[10] = 1024;
                    *(_DWORD *)&v144[12] = v83;
                    *(_WORD *)&v144[16] = 1024;
                    *(_DWORD *)&v144[18] = v84;
                    *(_WORD *)&v144[22] = 2112;
                    *(void *)&v144[24] = v50;
                    _os_log_debug_impl(&dword_1D7739000, v51, OS_LOG_TYPE_DEBUG, "[DS] Looking at universal=%d system=%d personal=%d ds=%d attributes: %@", buf, 0x24u);
                  }

                  __int16 v52 = [v50 userPersonaUniqueString];
                  if (v52)
                  {
                    uint64_t v53 = [(id)objc_opt_class() userIdentityWithPersonaAttributes:v50];
                    v54 = container_log_handle_for_category();
                    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(void *)v144 = v52;
                      *(_WORD *)&v144[8] = 2112;
                      *(void *)&v144[10] = v53;
                      _os_log_impl(&dword_1D7739000, v54, OS_LOG_TYPE_DEFAULT, "Creating user identity for %@: %@", buf, 0x16u);
                    }

                    long long v55 = [v6 objectForKeyedSubscript:v52];

                    if (v55)
                    {
                      long long v56 = container_log_handle_for_category();
                      if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        *(void *)v144 = v52;
                        *(_WORD *)&v144[8] = 2112;
                        *(void *)&v144[10] = v50;
                        _os_log_fault_impl(&dword_1D7739000, v56, OS_LOG_TYPE_FAULT, "Persona with duplicate unique string [%@]: %@", buf, 0x16u);
                      }
                    }
                    [v6 setObject:v53 forKeyedSubscript:v52];
                    long long v57 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v50, "userPersona_id"));
                    [v112 setObject:v53 forKeyedSubscript:v57];

                    long long v58 = [v50 sandboxExtensionForPersonaLayoutPath];
                    v115 = v58;
                    if (v58)
                    {
                      [v58 UTF8String];
                      uint64_t v59 = sandbox_extension_consume();
                      if (v59 < 0)
                      {
                        uint64_t v60 = *__error();
                        long long v61 = container_log_handle_for_category();
                        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                        {
                          int v62 = *__error();
                          *(_DWORD *)buf = 67109120;
                          *(_DWORD *)v144 = v62;
                          _os_log_impl(&dword_1D7739000, v61, OS_LOG_TYPE_DEFAULT, "Error %d consuming sandbox extension", buf, 8u);
                        }
                        uint64_t v59 = -v60;
                      }
                      [v53 setExtensionHandle:v59];
                    }
                    else
                    {
                      long long v63 = container_log_handle_for_category();
                      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                      {
                        uint64_t v64 = [v50 personaLayoutPathURL];
                        *(_DWORD *)buf = 138543618;
                        *(void *)v144 = v52;
                        *(_WORD *)&v144[8] = 2114;
                        *(void *)&v144[10] = v64;
                        _os_log_impl(&dword_1D7739000, v63, OS_LOG_TYPE_DEFAULT, "Error fetching sandbox extension for persona %{public}@, path %{public}@", buf, 0x16u);
                      }
                    }
                    id v117 = v52;
                    v65 = [v50 userPersonaBundleIDList];
                    v66 = container_log_handle_for_category();
                    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(void *)v144 = v50;
                      *(_WORD *)&v144[8] = 2112;
                      *(void *)&v144[10] = v65;
                      _os_log_impl(&dword_1D7739000, v66, OS_LOG_TYPE_DEFAULT, "Fetched bundle ID list for data separated persona %@: %@", buf, 0x16u);
                    }

                    v114 = v65;
                    if (v65 && [v65 count])
                    {
                      long long v131 = 0u;
                      long long v132 = 0u;
                      long long v129 = 0u;
                      long long v130 = 0u;
                      id v67 = v65;
                      uint64_t v68 = [v67 countByEnumeratingWithState:&v129 objects:v128 count:16];
                      if (v68)
                      {
                        uint64_t v69 = v68;
                        uint64_t v70 = *(void *)v130;
                        do
                        {
                          for (uint64_t k = 0; k != v69; ++k)
                          {
                            if (*(void *)v130 != v70) {
                              objc_enumerationMutation(v67);
                            }
                            uint64_t v72 = *(void *)(*((void *)&v129 + 1) + 8 * k);
                            v73 = [v5 objectForKeyedSubscript:v72];
                            if (!v73)
                            {
                              v73 = [MEMORY[0x1E4F1CA80] set];
                              [v5 setObject:v73 forKeyedSubscript:v72];
                            }
                            [v73 addObject:v53];
                          }
                          uint64_t v69 = [v67 countByEnumeratingWithState:&v129 objects:v128 count:16];
                        }
                        while (v69);
                      }
                    }
                    long long v126 = 0u;
                    long long v127 = 0u;
                    long long v124 = 0u;
                    long long v125 = 0u;
                    id v74 = v109;
                    uint64_t v75 = [v74 countByEnumeratingWithState:&v124 objects:v123 count:16];
                    if (v75)
                    {
                      uint64_t v76 = v75;
                      uint64_t v77 = *(void *)v125;
                      do
                      {
                        for (uint64_t m = 0; m != v76; ++m)
                        {
                          if (*(void *)v125 != v77) {
                            objc_enumerationMutation(v74);
                          }
                          uint64_t v79 = *(void *)(*((void *)&v124 + 1) + 8 * m);
                          v80 = [v5 objectForKeyedSubscript:v79];
                          if (!v80)
                          {
                            v80 = [MEMORY[0x1E4F1CA80] set];
                            [v5 setObject:v80 forKeyedSubscript:v79];
                          }
                          [v80 addObject:v53];
                        }
                        uint64_t v76 = [v74 countByEnumeratingWithState:&v124 objects:v123 count:16];
                      }
                      while (v76);
                    }

                    uint64_t v47 = v107;
                    id v6 = v108;
                    uint64_t v17 = v113;
                    uint64_t v48 = v106;
                    __int16 v52 = v117;
                  }
                  else
                  {
                    uint64_t v53 = container_log_handle_for_category();
                    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = v102;
                      *(void *)v144 = v50;
                      _os_log_fault_impl(&dword_1D7739000, v53, OS_LOG_TYPE_FAULT, "Invalid persona unique string for %@", buf, 0xCu);
                    }
                  }
                }
                ++v49;
              }
              while (v49 != v47);
              uint64_t v47 = [v111 countByEnumeratingWithState:&v134 objects:v133 count:16];
            }
            while (v47);
          }

          long long v121 = 0u;
          long long v122 = 0u;
          long long v119 = 0u;
          long long v120 = 0u;
          id v85 = v109;
          uint64_t v86 = [v85 countByEnumeratingWithState:&v119 objects:v118 count:16];
          if (v86)
          {
            uint64_t v87 = v86;
            uint64_t v88 = *(void *)v120;
            do
            {
              for (uint64_t n = 0; n != v87; ++n)
              {
                if (*(void *)v120 != v88) {
                  objc_enumerationMutation(v85);
                }
                uint64_t v90 = *(void *)(*((void *)&v119 + 1) + 8 * n);
                v91 = [v5 objectForKeyedSubscript:v90];
                if (!v91)
                {
                  v91 = [MEMORY[0x1E4F1CA80] set];
                  [v5 setObject:v91 forKeyedSubscript:v90];
                }
                [v91 addObject:v17];
              }
              uint64_t v87 = [v85 countByEnumeratingWithState:&v119 objects:v118 count:16];
            }
            while (v87);
          }

          uint64_t v92 = [v5 copy];
          lock_bundleToDataSeparatedIdentitiesMap = v105->_lock_bundleToDataSeparatedIdentitiesMap;
          v105->_lock_bundleToDataSeparatedIdentitiesMap = (NSDictionary *)v92;

          uint64_t v94 = [v6 copy];
          lock_personaUniqueStringToUserIdentityMap = v105->_lock_personaUniqueStringToUserIdentityMap;
          v105->_lock_personaUniqueStringToUserIdentityMap = (NSDictionary *)v94;

          uint64_t v96 = [v112 copy];
          lock_personaIDToUserIdentityMap = v105->_lock_personaIDToUserIdentityMap;
          v105->_lock_personaIDToUserIdentityMap = (NSDictionary *)v96;

          objc_storeStrong((id *)&v105->_lock_userIdentityForPersonalPersona, v17);
          lock_userIdentityForUnspecificPersona = v105->_lock_userIdentityForUnspecificPersona;
          v105->_lock_userIdentityForUnspecificPersona = (MCMUserIdentity *)log;
          os_log_t log = log;

          v99 = container_log_handle_for_category();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
          {
            v101 = v105->_lock_personaUniqueStringToUserIdentityMap;
            *(_DWORD *)buf = 138412290;
            *(void *)v144 = v101;
            _os_log_debug_impl(&dword_1D7739000, v99, OS_LOG_TYPE_DEBUG, "User identities locked in: %@", buf, 0xCu);
          }

          BOOL v20 = 1;
        }
        else
        {
          container_log_handle_for_category();
          os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v144 = v11;
            _os_log_fault_impl(&dword_1D7739000, log, OS_LOG_TYPE_FAULT, "Invalid persona unique string for personal %@", buf, 0xCu);
          }
          BOOL v20 = 0;
          uint64_t v17 = obj;
        }
        id v19 = (void *)v103;
        goto LABEL_116;
      }
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v146 objects:v145 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_11:

  os_log_t log = 0;
  uint64_t v17 = 0;
LABEL_12:
  __int16 v18 = container_log_handle_for_category();
  id v19 = (void *)v103;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v144 = obj;
    _os_log_fault_impl(&dword_1D7739000, v18, OS_LOG_TYPE_FAULT, "Expected to find a personal persona in %@", buf, 0xCu);
  }

  BOOL v20 = 0;
LABEL_116:

  return v20;
}

- (void)_lock_flushAndRepopulateWithUserIdentities:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34 = self;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    id v10 = 0;
    uint64_t v11 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(obj);
        }
        int v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isDataSeparated", v34) & 1) == 0 && (objc_msgSend(v13, "isNoSpecificPersona") & 1) == 0)
        {
          int v14 = v13;

          id v10 = v14;
        }
        if ([v13 isNoSpecificPersona])
        {
          int v15 = v13;

          uint64_t v9 = v15;
        }
        int v16 = [v13 personaUniqueString];

        if (v16)
        {
          uint64_t v17 = [v13 personaUniqueString];
          [v5 setObject:v13 forKeyedSubscript:v17];
        }
        __int16 v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v13, "kernelPersonaID"));
        [v6 setObject:v13 forKeyedSubscript:v18];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v36 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = 0;
  }

  id v19 = v34;
  [(id)objc_opt_class() personasAreSupported];
  if (v10)
  {
    if (!v9) {
      goto LABEL_22;
    }
  }
  else
  {
    id v10 = v9;
    uint64_t v9 = v10;
    if (!v10)
    {
      id v10 = [(MCMUserIdentityCache *)v34 defaultUserIdentity];
LABEL_22:
      BOOL v20 = [MCMUserIdentity alloc];
      uint64_t v21 = [(MCMUserIdentity *)v10 posixUser];
      long long v22 = [(MCMUserIdentity *)v10 homeDirectoryURL];
      uint64_t v23 = [(MCMUserIdentity *)v10 personaUniqueString];
      uint64_t v9 = [(MCMUserIdentity *)v20 initWithPOSIXUser:v21 homeDirectoryURL:v22 personaUniqueString:v23 personaType:2 kernelPersonaID:[(MCMUserIdentity *)v10 kernelPersonaID]];
    }
  }
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionary", v34);
  lock_bundleToDataSeparatedIdentitiesMap = v19->_lock_bundleToDataSeparatedIdentitiesMap;
  v19->_lock_bundleToDataSeparatedIdentitiesMap = (NSDictionary *)v24;

  uint64_t v26 = [v5 copy];
  lock_personaUniqueStringToUserIdentityMap = v19->_lock_personaUniqueStringToUserIdentityMap;
  v19->_lock_personaUniqueStringToUserIdentityMap = (NSDictionary *)v26;

  uint64_t v28 = [v6 copy];
  lock_personaIDToUserIdentityMap = v19->_lock_personaIDToUserIdentityMap;
  v19->_lock_personaIDToUserIdentityMap = (NSDictionary *)v28;

  lock_userIdentityForPersonalPersona = v19->_lock_userIdentityForPersonalPersona;
  v19->_lock_userIdentityForPersonalPersona = v10;
  uint64_t v31 = v10;

  lock_userIdentityForUnspecificPersona = v19->_lock_userIdentityForUnspecificPersona;
  v19->_lock_userIdentityForUnspecificPersona = v9;
  v33 = v9;

  v19->_cacheInvalid = 0;
}

- (void)_lock_flush
{
  os_unfair_lock_assert_owner(&self->_lock);
  self->_cacheInvalid = 1;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionary];
  lock_bundleToDataSeparatedIdentitiesMap = self->_lock_bundleToDataSeparatedIdentitiesMap;
  self->_lock_bundleToDataSeparatedIdentitiesMap = v3;

  id v5 = [MEMORY[0x1E4F1C9E8] dictionary];
  lock_personaUniqueStringToUserIdentityMap = self->_lock_personaUniqueStringToUserIdentityMap;
  self->_lock_personaUniqueStringToUserIdentityMap = v5;

  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionary];
  lock_personaIDToUserIdentityMap = self->_lock_personaIDToUserIdentityMap;
  self->_lock_personaIDToUserIdentityMap = v7;

  uint64_t v9 = [(MCMUserIdentityCache *)self defaultUserIdentity];
  lock_userIdentityForPersonalPersona = self->_lock_userIdentityForPersonalPersona;
  self->_lock_userIdentityForPersonalPersona = v9;

  uint64_t v11 = [(MCMUserIdentityCache *)self defaultUserIdentity];
  lock_userIdentityForUnspecificPersona = self->_lock_userIdentityForUnspecificPersona;
  self->_lock_userIdentityForUnspecificPersona = v11;

  int v13 = [MEMORY[0x1E4F1CA60] dictionary];
  lock_managedPathRegistryForUserIdentity = self->_lock_managedPathRegistryForUserIdentity;
  self->_lock_managedPathRegistryForUserIdentity = v13;

  self->_lock_libraryRepairForUserIdentity = [MEMORY[0x1E4F1CA60] dictionary];

  MEMORY[0x1F41817F8]();
}

- (void)_lock_resync
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v3 = (void *)MEMORY[0x1D9478DF0]();
  if ([(id)objc_opt_class() personasAreSupported] && objc_opt_class())
  {
    double Current = CFAbsoluteTimeGetCurrent();
    id v5 = +[MCMTestLocks sharedInstance];
    if ([v5 countOfLock:13] < 1)
    {
      uint64_t v8 = [MEMORY[0x1E4FB36F0] sharedManager];
      id v21 = 0;
      uint64_t v7 = [v8 listAllPersonaAttributesWithError:&v21];
      id v6 = v21;
    }
    else
    {
      [v5 releaseLock:13];
      id v6 = 0;
      uint64_t v7 = 0;
    }
    double v9 = CFAbsoluteTimeGetCurrent();
    id v10 = container_log_handle_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      *(double *)&uint8_t buf[4] = v9 - Current;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v23 = v7;
      _os_log_impl(&dword_1D7739000, v10, OS_LOG_TYPE_DEFAULT, "listAllPersonaAttributes (%f s): error = %{public}@, attributes = %{public}@", buf, 0x20u);
    }

    if (v7 && [v7 count])
    {
      self->_fetchedFromUM = [(MCMUserIdentityCache *)self _lock_resync_fromUserPersonaAttributes:v7];
      uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v12 = [(NSDictionary *)self->_lock_personaUniqueStringToUserIdentityMap allValues];
      int v13 = [v11 setWithArray:v12];

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      uint64_t v23 = __Block_byref_object_copy__10782;
      uint64_t v24 = __Block_byref_object_dispose__10783;
      id v25 = (id)os_transaction_create();
      BOOL firstFetch = self->_firstFetch;
      flushQueue = self->_flushQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__MCMUserIdentityCache__lock_resync__block_invoke;
      block[3] = &unk_1E6A80308;
      id v18 = v13;
      id v19 = buf;
      block[4] = self;
      BOOL v20 = firstFetch;
      id v16 = v13;
      dispatch_async(flushQueue, block);

      _Block_object_dispose(buf, 8);
    }
    self->_BOOL firstFetch = 0;
  }
  self->_cacheInvalid = 0;
}

void __36__MCMUserIdentityCache__lock_resync__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _notifyObserversOfChangesWithUserIdentities:*(void *)(a1 + 40) firstFetch:*(unsigned __int8 *)(a1 + 56)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (MCMUserIdentity)lock_userIdentityForUnspecificPersona
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_cacheInvalid) {
    [(MCMUserIdentityCache *)self _lock_resync];
  }
  lock_userIdentityForUnspecificPersona = self->_lock_userIdentityForUnspecificPersona;

  return lock_userIdentityForUnspecificPersona;
}

- (id)managedUserPathRegistryForUserIdentity:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(MCMUserIdentityCache *)self defaultUserIdentity];
  }
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(NSMutableDictionary *)self->_lock_managedPathRegistryForUserIdentity objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(&self->_lock);
  if (!v5)
  {
    id v6 = [MCMManagedUserPathRegistry alloc];
    id v7 = containermanager_copy_global_configuration();
    uint64_t v8 = [v7 currentUser];
    id v5 = [(MCMManagedUserPathRegistry *)v6 initWithUserIdentity:v4 daemonUser:v8];

    os_unfair_lock_lock(&self->_lock);
    [(NSMutableDictionary *)self->_lock_managedPathRegistryForUserIdentity setObject:v5 forKeyedSubscript:v4];
    os_unfair_lock_unlock(&self->_lock);
  }

  return v5;
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  id v4 = [(MCMUserIdentityCache *)self observers];
  objc_sync_enter(v4);
  id v5 = [(MCMUserIdentityCache *)self observers];
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (void)addObserver:(id)a3
{
  id v6 = a3;
  id v4 = [(MCMUserIdentityCache *)self observers];
  objc_sync_enter(v4);
  id v5 = [(MCMUserIdentityCache *)self observers];
  [v5 addObject:v6];

  objc_sync_exit(v4);
}

- (void)flushAndRepopulateWithUserIdentities:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(MCMUserIdentityCache *)self _lock_flushAndRepopulateWithUserIdentities:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)userIdentityForLegacyMobileUser
{
  return [(MCMUserIdentityCache *)self defaultUserIdentity];
}

- (id)userIdentityForCurrentContext
{
  uint64_t v3 = [(MCMUserIdentityCache *)self personaUniqueStringForCurrentContext];
  id v4 = containermanager_copy_global_configuration();
  id v5 = [v4 defaultUser];
  id v6 = [(MCMUserIdentityCache *)self userIdentityForPersonaUniqueString:v3 POSIXUser:v5];

  return v6;
}

uint64_t __60__MCMUserIdentityCache_personaUniqueStringForCurrentContext__block_invoke()
{
  personaUniqueStringForCurrentContext_dedupCache = [[MCMLRUCache alloc] initWithName:@"personaUniqueStrings" maxCount:10];

  return MEMORY[0x1F41817F8]();
}

- (id)globalBundleUserIdentity
{
  uint64_t v2 = objc_opt_class();

  return (id)[v2 globalBundleUserIdentity];
}

- (id)userIdentitiesForContainerConfig:(id)a3 originatorUserIdentities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (([v6 personaAndUserSpecific] & 1) == 0)
  {
    double v9 = [(MCMUserIdentityCache *)self userIdentityForContainerConfig:v6 originatorUserIdentity:0];
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
  }
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = [(MCMUserIdentityCache *)self defaultUserIdentity];
    id v10 = [v11 setWithObject:v12];
  }

  return v10;
}

- (void)forEachAccessibleUserIdentitySynchronouslyExecuteBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  id v5 = [(MCMUserIdentityCache *)self allAccessibleUserIdentities];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v7);
  }
}

- (void)flush
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(MCMUserIdentityCache *)self _lock_flush];
  [(MCMUserIdentityCache *)self _lock_resync];

  os_unfair_lock_unlock(p_lock);
}

- (id)unspecificUserIdentity
{
  [(MCMUserIdentityCache *)self _refreshFromUserManagementIfNecessary];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(MCMUserIdentityCache *)self lock_userIdentityForUnspecificPersona];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (MCMUserIdentityCache)init
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)MCMUserIdentityCache;
  uint64_t v2 = [(MCMUserIdentityCache *)&v17 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    listener = v3->_listener;
    v3->_listener = 0;

    uint64_t v7 = [MEMORY[0x1E4F1CAD0] set];
    previousUserIdentities = v3->_previousUserIdentities;
    v3->_previousUserIdentities = (NSSet *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.containermanagerd.MCMUserIdentityCache.flushQueue", 0);
    flushQueue = v3->_flushQueue;
    v3->_flushQueue = (OS_dispatch_queue *)v9;

    id v11 = containermanager_copy_global_configuration();
    uint64_t v12 = [v11 classIterator];
    classIterator = v3->_classIterator;
    v3->_classIterator = (MCMContainerClassIterator *)v12;

    *(_WORD *)&v3->_fetchedFromUM = 256;
    uint64_t v14 = objc_opt_new();
    defaultUserIdentity = v3->_defaultUserIdentity;
    v3->_defaultUserIdentity = (MCMUserIdentity *)v14;

    os_unfair_lock_lock(&v3->_lock);
    [(MCMUserIdentityCache *)v3 _lock_flush];
    os_unfair_lock_unlock(&v3->_lock);
  }
  return v3;
}

+ (id)userIdentityWithPersonaAttributes:(id)a3 POSIXUser:(id)a4 forceUnspecific:(BOOL)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 UID];
  id v10 = [v7 userPersonaUniqueString];
  if (!v7
    || (uint64_t v9 = objc_msgSend(v7, "userPersona_id"), !objc_msgSend(v7, "isDataSeparatedPersona"))
    || ([v7 personaLayoutPathURL], (id v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v11 = [v8 homeDirectoryURL];
  }
  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_14);
  }
  if (!MCMRequirePersona_result)
  {
    if (!a5
      && (([v7 isPersonalPersona] & 1) != 0 || objc_msgSend(v7, "isDataSeparatedPersona")))
    {
      if (([v7 isPersonalPersona] & 1) == 0)
      {
        uint64_t v12 = [v7 isDataSeparatedPersona];
        goto LABEL_20;
      }
LABEL_16:
      uint64_t v12 = 0;
      goto LABEL_20;
    }
LABEL_19:
    uint64_t v12 = 2;
    goto LABEL_20;
  }
  if (a5) {
    goto LABEL_19;
  }
  if ([v7 isPersonalPersona]) {
    goto LABEL_16;
  }
  if ([v7 isDataSeparatedPersona])
  {
    uint64_t v12 = 1;
    goto LABEL_20;
  }
  if ([v7 isSystemPersona] & 1) != 0 || (objc_msgSend(v7, "isDefaultPersona")) {
    goto LABEL_19;
  }
  uint64_t v15 = container_log_handle_for_category();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134218242;
    uint64_t v17 = [v7 userPersonaType];
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_1D7739000, v15, OS_LOG_TYPE_DEFAULT, "Persona of unknown type %ld being treated as Unspecific: %{public}@", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v12 = 3;
LABEL_20:
  long long v13 = [[MCMUserIdentity alloc] initWithPOSIXUser:v8 homeDirectoryURL:v11 personaUniqueString:v10 personaType:v12 kernelPersonaID:v9];

  return v13;
}

+ (id)userIdentityWithPersonaAttributes:(id)a3 forceUnspecific:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = containermanager_copy_global_configuration();
  id v8 = [v7 defaultUser];
  uint64_t v9 = [a1 userIdentityWithPersonaAttributes:v6 POSIXUser:v8 forceUnspecific:v4];

  return v9;
}

+ (id)userIdentityWithPersonaAttributes:(id)a3
{
  return (id)[a1 userIdentityWithPersonaAttributes:a3 forceUnspecific:0];
}

void __48__MCMUserIdentityCache_globalSystemUserIdentity__block_invoke()
{
  id v0 = containermanager_copy_global_configuration();
  id v5 = [v0 systemContainerOwner];

  v1 = [MCMUserIdentity alloc];
  uint64_t v2 = [v5 homeDirectoryURL];
  uint64_t v3 = -[MCMUserIdentity initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:](v1, "initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:", v5, v2, 0, 3, [v5 UID]);
  BOOL v4 = (void *)globalSystemUserIdentity_userIdentity;
  globalSystemUserIdentity_userIdentity = v3;
}

+ (id)globalBundleUserIdentity
{
  if (globalBundleUserIdentity_onceToken != -1) {
    dispatch_once(&globalBundleUserIdentity_onceToken, &__block_literal_global_10821);
  }
  uint64_t v2 = (void *)globalBundleUserIdentity_userIdentity;

  return v2;
}

void __48__MCMUserIdentityCache_globalBundleUserIdentity__block_invoke()
{
  id v0 = containermanager_copy_global_configuration();
  id v5 = [v0 bundleContainerOwner];

  v1 = [MCMUserIdentity alloc];
  uint64_t v2 = [v5 homeDirectoryURL];
  uint64_t v3 = -[MCMUserIdentity initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:](v1, "initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:", v5, v2, 0, 3, [v5 UID]);
  BOOL v4 = (void *)globalBundleUserIdentity_userIdentity;
  globalBundleUserIdentity_userIdentity = v3;
}

+ (id)defaultUserIdentity
{
  uint64_t v2 = +[MCMUserIdentitySharedCache sharedInstance];
  uint64_t v3 = [v2 defaultUserIdentity];

  return v3;
}

@end