@interface _LSPersonaDatabase
+ (id)sharedInstance;
- (id)_getPersonaAttributesRetryingIfNecessary;
- (id)getBundleIDToPersonasWithAttributesMap;
- (id)getPersonalPersonaUniqueString;
- (id)initPrivately;
- (id)personasWithAttributesForBundleIdentifier:(void *)a1;
- (id)personasWithAttributesForPersonaUniqueStrings:(void *)a3 error:;
- (id)personasWithType:(uint64_t)a1;
- (void)_getPersonaAttributesRetryingIfNecessary;
- (void)currentGeneration;
- (void)generationIsCurrent:(void *)result;
- (void)getCachedBundleIDToPersonasWithAttributesMap:(id *)a3 systemPersonaUniqueString:(id *)a4 personalPersonaUniqueString:(id *)a5;
- (void)getUncachedBundleIDToPersonasWithAttributesMap:(id *)a3 systemPersonaUniqueString:(id *)a4 personalPersonaUniqueString:(id *)a5;
- (void)initPrivately;
- (void)refreshFromUserManagementIfNecessary;
@end

@implementation _LSPersonaDatabase

- (id)initPrivately
{
  if ([(id)__LSDefaultsGetSharedInstance() isLightweightSystemServer])
  {
    v3 = _LSDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[_LSPersonaDatabase initPrivately](v3);
    }

    return 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_LSPersonaDatabase;
    v5 = [(_LSPersonaDatabase *)&v9 init];
    v4 = v5;
    if (v5)
    {
      cachedBundleIDToPersonasMap = v5->_cachedBundleIDToPersonasMap;
      *(void *)&v5->_ivarLock._os_unfair_lock_opaque = 0;
      v5->_cachedBundleIDToPersonasMap = 0;

      cachedSystemPersonaUniqueString = v4->_cachedSystemPersonaUniqueString;
      v4->_cachedSystemPersonaUniqueString = 0;

      v4->_userManagementGenerationNumber = 0;
    }
  }
  return v4;
}

+ (id)sharedInstance
{
  self;
  if (+[_LSPersonaDatabase sharedInstance]::onceToken != -1) {
    dispatch_once(&+[_LSPersonaDatabase sharedInstance]::onceToken, &__block_literal_global_86);
  }
  v0 = (void *)+[_LSPersonaDatabase sharedInstance]::sharedInstance;

  return v0;
}

- (id)_getPersonaAttributesRetryingIfNecessary
{
  v2 = 0;
  id v3 = 0;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = (void *)*MEMORY[0x1E4F28798];
  uint64_t v5 = *MEMORY[0x1E4F28228];
  int v6 = 10;
  do
  {

    v7 = [(id)getUMUserManagerClass() sharedManager];
    id v13 = 0;
    v8 = [v7 listAllPersonaAttributesWithError:&v13];
    id v3 = v13;

    if ([v8 count]) {
      break;
    }
    if (v3)
    {
      objc_super v9 = _LSDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v3;
        _os_log_error_impl(&dword_182959000, v9, OS_LOG_TYPE_ERROR, "error getting persona attributes list: %@", buf, 0xCu);
      }
    }
    else
    {
      v10 = _LSDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v8;
        _os_log_error_impl(&dword_182959000, v10, OS_LOG_TYPE_ERROR, "UM returned empty array or nil (%@) but not an error!?", buf, 0xCu);
      }

      uint64_t v14 = v5;
      v15 = @"placeholder for missing error; file a bug";
      objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      _LSMakeNSErrorImpl(v4, 5, (uint64_t)"-[_LSPersonaDatabase _getPersonaAttributesRetryingIfNecessary]", 273, v9);
      id v3 = (id)objc_claimAutoreleasedReturnValue();
    }

    usleep(0x186A0u);
    v2 = v8;
    --v6;
  }
  while (v6);
  if (v8)
  {
    if ([v8 count]) {
      goto LABEL_17;
    }
    v11 = _LSDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      [(_LSPersonaDatabase *)(uint64_t)v3 _getPersonaAttributesRetryingIfNecessary];
    }
  }
  else
  {
    v11 = _LSDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      [(_LSPersonaDatabase *)(uint64_t)v3 _getPersonaAttributesRetryingIfNecessary];
    }
  }

LABEL_17:

  return v8;
}

- (void)getUncachedBundleIDToPersonasWithAttributesMap:(id *)a3 systemPersonaUniqueString:(id *)a4 personalPersonaUniqueString:(id *)a5
{
  v24 = a5;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  int v6 = _LSDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_DEFAULT, "Fetching persona data from usermanager.", buf, 2u);
  }

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(_LSPersonaDatabase *)self _getPersonaAttributesRetryingIfNecessary];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v9)
  {
    id v27 = 0;
    id v29 = 0;
    uint64_t v30 = *(void *)v39;
    do
    {
      uint64_t v10 = 0;
      uint64_t v31 = v9;
      do
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v10;
        v11 = *(void **)(*((void *)&v38 + 1) + 8 * v10);
        v12 = objc_msgSend(v11, "userPersonaUniqueString", v24);
        if (v12)
        {
          if ([v11 isSystemPersona])
          {
            id v13 = v12;

            id v29 = v13;
            uint64_t v14 = 3;
          }
          else if ([v11 isPersonalPersona])
          {
            id v15 = v12;

            id v27 = v15;
            uint64_t v14 = 1;
          }
          else
          {
            int v16 = [v11 isEnterprisePersona];
            uint64_t v14 = 2;
            if (!v16) {
              uint64_t v14 = 0;
            }
          }
          uint64_t v33 = v14;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v17 = [v11 userPersonaBundleIDList];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v35;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v35 != v19) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v21 = *(void *)(*((void *)&v34 + 1) + 8 * i);
                v22 = [v8 objectForKeyedSubscript:v21];
                if (!v22)
                {
                  v22 = objc_opt_new();
                  [v8 setObject:v22 forKeyedSubscript:v21];
                }
                v23 = [v7 objectForKey:v12];
                if (!v23)
                {
                  v23 = -[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:]([_LSPersonaWithAttributes alloc], v33, v12);
                  [v7 setObject:v23 forKey:v12];
                }
                [v22 addObject:v23];
              }
              uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v43 count:16];
            }
            while (v18);
          }
        }
        uint64_t v10 = v32 + 1;
      }
      while (v32 + 1 != v31);
      uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v9);
  }
  else
  {
    id v27 = 0;
    id v29 = 0;
  }

  if (a3) {
    objc_storeStrong(a3, v8);
  }
  if (a4) {
    objc_storeStrong(a4, v29);
  }
  if (v24) {
    objc_storeStrong(v24, v27);
  }
}

- (void)refreshFromUserManagementIfNecessary
{
  id v3 = [(id)getUMUserManagerClass() sharedManager];
  id v10 = 0;
  unint64_t v4 = [v3 personaGenerationIdentifierWithError:&v10];
  id v5 = v10;

  if (self->_userManagementGenerationNumber != v4)
  {
    self->_userManagementGenerationNumber = v4;
    int v6 = _LSDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_DEFAULT, "Persona list did update.", v9, 2u);
    }

    os_unfair_lock_lock(&self->_ivarLock);
    cachedBundleIDToPersonasMap = self->_cachedBundleIDToPersonasMap;
    self->_cachedBundleIDToPersonasMap = 0;

    cachedSystemPersonaUniqueString = self->_cachedSystemPersonaUniqueString;
    self->_cachedSystemPersonaUniqueString = 0;

    os_unfair_lock_unlock(&self->_ivarLock);
  }
}

- (void)getCachedBundleIDToPersonasWithAttributesMap:(id *)a3 systemPersonaUniqueString:(id *)a4 personalPersonaUniqueString:(id *)a5
{
  [(_LSPersonaDatabase *)self refreshFromUserManagementIfNecessary];
  id v13 = 0;
  id obj = 0;
  id v12 = 0;
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_userManagementGenerationNumber
    && (cachedBundleIDToPersonasMap = self->_cachedBundleIDToPersonasMap) != 0)
  {
    id obj = cachedBundleIDToPersonasMap;
    id v13 = self->_cachedSystemPersonaUniqueString;
    id v12 = self->_cachedPersonalPersonaUniqueString;
    p_ivarLock = &self->_ivarLock;
  }
  else
  {
    os_unfair_lock_unlock(&self->_ivarLock);
    os_unfair_lock_lock(&self->_uncachedCalloutLock);
    [(_LSPersonaDatabase *)self getUncachedBundleIDToPersonasWithAttributesMap:&obj systemPersonaUniqueString:&v13 personalPersonaUniqueString:&v12];
    os_unfair_lock_lock(&self->_ivarLock);
    if (self->_userManagementGenerationNumber)
    {
      objc_storeStrong((id *)&self->_cachedBundleIDToPersonasMap, obj);
      objc_storeStrong((id *)&self->_cachedSystemPersonaUniqueString, v13);
      objc_storeStrong((id *)&self->_cachedPersonalPersonaUniqueString, v12);
    }
    os_unfair_lock_unlock(&self->_ivarLock);
    p_ivarLock = &self->_uncachedCalloutLock;
  }
  os_unfair_lock_unlock(p_ivarLock);
  if (a3) {
    objc_storeStrong(a3, obj);
  }
  if (a4) {
    objc_storeStrong(a4, v13);
  }
  id v11 = v12;
  if (a5)
  {
    objc_storeStrong(a5, v12);
    id v11 = v12;
  }
}

- (id)getBundleIDToPersonasWithAttributesMap
{
  [(_LSPersonaDatabase *)self refreshFromUserManagementIfNecessary];
  id v5 = 0;
  [(_LSPersonaDatabase *)self getCachedBundleIDToPersonasWithAttributesMap:&v5 systemPersonaUniqueString:0 personalPersonaUniqueString:0];
  id v3 = v5;

  return v3;
}

- (id)getPersonalPersonaUniqueString
{
  if (a1)
  {
    id v3 = 0;
    [a1 getCachedBundleIDToPersonasWithAttributesMap:0 systemPersonaUniqueString:0 personalPersonaUniqueString:&v3];
    id v1 = v3;
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

- (id)personasWithAttributesForBundleIdentifier:(void *)a1
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    if (([(id)__LSDefaultsGetSharedInstance() isInEducationMode] & 1) != 0
      || ([(id)__LSDefaultsGetSharedInstance() isUsingEphemeralStorage] & 1) != 0)
    {
      unint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      int v6 = [a1 getBundleIDToPersonasWithAttributesMap];
      unint64_t v4 = [v6 objectForKeyedSubscript:v3];

      if (!v4)
      {
        id v7 = -[_LSPersonaDatabase getPersonalPersonaUniqueString](a1);
        if (v7)
        {
          id v8 = -[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:]([_LSPersonaWithAttributes alloc], 1, v7);
          v9[0] = v8;
          unint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
        }
        else
        {
          if (-[_LSPersonaDatabase personasWithAttributesForBundleIdentifier:]::once != -1) {
            dispatch_once(&-[_LSPersonaDatabase personasWithAttributesForBundleIdentifier:]::once, &__block_literal_global_46);
          }
          unint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
        }
      }
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)personasWithAttributesForPersonaUniqueStrings:(void *)a3 error:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v31 = a2;
  if (a1)
  {
    id v5 = [(id)getUMUserManagerClass() sharedManager];
    id v29 = [v5 listAllPersonaWithAttributes];

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v7 = v29;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v38 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if ([v11 userPersonaType] != 4)
          {
            id v12 = [v11 userPersonaUniqueString];
            if (v12)
            {
              id v13 = [v11 userPersonaUniqueString];
              uint64_t v14 = v13;
              if (!v13)
              {
                id v3 = [MEMORY[0x1E4F1CA98] null];
                uint64_t v14 = v3;
              }
              [v6 setObject:v11 forKey:v14];
              if (!v13) {
            }
              }
            else
            {
              id v13 = _LSDefaultLog();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                int v15 = [v11 userPersonaType];
                *(_DWORD *)buf = 67109120;
                int v45 = v15;
                _os_log_error_impl(&dword_182959000, v13, OS_LOG_TYPE_ERROR, "persona with type %d did not have a persona unique string, ignoring!", buf, 8u);
              }
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v8);
    }

    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v31;
    uint64_t v17 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v34;
      while (2)
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v33 + 1) + 8 * j);
          uint64_t v21 = [v6 objectForKey:v20];
          v22 = v21;
          if (!v21)
          {

            v26 = [NSString stringWithFormat:@"no known persona with unique string %@", v20];
            uint64_t v41 = *MEMORY[0x1E4F28228];
            v42 = v26;
            id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
            v25 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 2, (uint64_t)"-[_LSPersonaDatabase personasWithAttributesForPersonaUniqueStrings:error:]", 488, v27);

            id v16 = 0;
            goto LABEL_28;
          }
          uint64_t v23 = LSPersonaTypeForPersonaAttributes(v21);
          v24 = -[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:]([_LSPersonaWithAttributes alloc], v23, v20);
          [v16 addObject:v24];
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
    v25 = 0;
LABEL_28:

    if (a3 && !v16) {
      *a3 = v25;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (void)generationIsCurrent:(void *)result
{
  if (result)
  {
    id v3 = result;
    [result refreshFromUserManagementIfNecessary];
    if (a2) {
      return (void *)(v3[5] == a2);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)currentGeneration
{
  if (result)
  {
    id v1 = result;
    [result refreshFromUserManagementIfNecessary];
    return (void *)v1[5];
  }
  return result;
}

- (id)personasWithType:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    unint64_t v4 = [(id)getUMUserManagerClass() sharedManager];
    id v5 = [v4 listAllPersonaWithAttributes];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (LSPersonaTypeForPersonaAttributes(v10) == a2)
          {
            id v11 = [_LSPersonaWithAttributes alloc];
            id v12 = objc_msgSend(v10, "userPersonaUniqueString", (void)v15);
            id v13 = -[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:](v11, a2, v12);
            [v3 addObject:v13];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPersonalPersonaUniqueString, 0);
  objc_storeStrong((id *)&self->_cachedSystemPersonaUniqueString, 0);

  objc_storeStrong((id *)&self->_cachedBundleIDToPersonasMap, 0);
}

- (void)initPrivately
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_182959000, log, OS_LOG_TYPE_DEBUG, "lightweight system server does not support keybagd; bailing",
    v1,
    2u);
}

- (void)_getPersonaAttributesRetryingIfNecessary
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_182959000, a2, OS_LOG_TYPE_FAULT, "list of persona attributes was of length zero, last error: %@", (uint8_t *)&v2, 0xCu);
}

@end