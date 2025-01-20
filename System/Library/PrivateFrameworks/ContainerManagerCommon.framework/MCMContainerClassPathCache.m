@interface MCMContainerClassPathCache
- (MCMContainerClassPathCache)initWithUserIdentityCache:(id)a3;
- (MCMUserIdentityCache)userIdentityCache;
- (id)_lock_containerClassPathForUserIdentity:(id)a3 containerConfig:(id)a4 typeClass:(Class)a5;
- (id)containerClassPathForContainerIdentity:(id)a3 typeClass:(Class)a4;
- (id)containerClassPathForUserIdentity:(id)a3 containerConfig:(id)a4 typeClass:(Class)a5;
- (id)containerClassPathWithURL:(id)a3 reference:(id)a4;
- (id)referenceForPOSIXUser:(id)a3;
- (void)_lock_flush;
- (void)flush;
- (void)userIdentityCache:(id)a3 didAddUserIdentity:(id)a4;
- (void)userIdentityCache:(id)a3 didInvalidateUserIdentity:(id)a4;
@end

@implementation MCMContainerClassPathCache

- (id)containerClassPathForUserIdentity:(id)a3 containerConfig:(id)a4 typeClass:(Class)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(MCMContainerClassPathCache *)self userIdentityCache];
  v11 = [v10 userIdentityForContainerConfig:v8 originatorUserIdentity:v9];

  os_unfair_lock_lock(&self->_lookupLock);
  v12 = [(MCMContainerClassPathCache *)self _lock_containerClassPathForUserIdentity:v11 containerConfig:v8 typeClass:a5];

  os_unfair_lock_unlock(&self->_lookupLock);

  return v12;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (id)_lock_containerClassPathForUserIdentity:(id)a3 containerConfig:(id)a4 typeClass:(Class)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_assert_owner(&self->_lookupLock);
  uint64_t v10 = [v9 containerClass];

  NSStringFromClass(a5);
  v11 = (char *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v12 = [(NSMutableDictionary *)self->_lookup objectForKeyedSubscript:v11];
    if (!v12)
    {
      v13 = (void *)MEMORY[0x1E4F1CA60];
      v14 = +[MCMContainerClassPath containerPathTypeClasses];
      v12 = objc_msgSend(v13, "dictionaryWithCapacity:", objc_msgSend(v14, "count"));

      [(NSMutableDictionary *)self->_lookup setObject:v12 forKeyedSubscript:v11];
    }
    v15 = [v12 objectForKeyedSubscript:v8];
    if (!v15)
    {
      v15 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:15];
      [v12 setObject:v15 forKeyedSubscript:v8];
    }
    v16 = [NSNumber numberWithUnsignedLongLong:v10];
    v17 = [v15 objectForKeyedSubscript:v16];

    if (!v17)
    {
      v17 = [(objc_class *)a5 containerPathForUserIdentity:v8 containerClass:v10];
      v18 = container_log_handle_for_category();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        int v23 = 138413058;
        v24 = v11;
        __int16 v25 = 2112;
        id v26 = v8;
        __int16 v27 = 2048;
        uint64_t v28 = v10;
        __int16 v29 = 2112;
        v30 = v17;
        _os_log_debug_impl(&dword_1D7739000, v18, OS_LOG_TYPE_DEBUG, "Container class path cache miss, creating type = [%@], userIdentity = [%@], class = %llu: %@", (uint8_t *)&v23, 0x2Au);
      }

      if (v17)
      {
        v19 = [NSNumber numberWithUnsignedLongLong:v10];
        [v15 setObject:v17 forKeyedSubscript:v19];
      }
    }
    v20 = v17;

    v21 = v20;
  }
  else
  {
    v20 = container_log_handle_for_category();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      int v23 = 136315138;
      v24 = "-[MCMContainerClassPathCache _lock_containerClassPathForUserIdentity:containerConfig:typeClass:]";
      _os_log_fault_impl(&dword_1D7739000, v20, OS_LOG_TYPE_FAULT, "Cannot call %s with a nil user identity.", (uint8_t *)&v23, 0xCu);
    }
    v21 = 0;
  }

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityCache, 0);

  objc_storeStrong((id *)&self->_lookup, 0);
}

- (void)_lock_flush
{
  os_unfair_lock_assert_owner(&self->_lookupLock);
  self->_lookup = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];

  MEMORY[0x1F41817F8]();
}

- (void)userIdentityCache:(id)a3 didAddUserIdentity:(id)a4
{
}

- (void)userIdentityCache:(id)a3 didInvalidateUserIdentity:(id)a4
{
  [(MCMContainerClassPathCache *)self flush];
}

- (id)containerClassPathWithURL:(id)a3 reference:(id)a4
{
  v18  = *MEMORY[0x1E4F143B8];
  v5  = a4;
  v6  = [a3 path];
  v14  = 0u;
  v15  = 0u;
  v16  = 0u;
  v17  = 0u;
  v7  = v5;
  id v8 = (void *)[v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i  = 0; i != v8; i  = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        v11  = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if ([v6 hasPrefix:v11])
        {
          id v8 = [v7 objectForKeyedSubscript:v11];
          goto LABEL_11;
        }
      }
      id v8 = (void *)[v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)referenceForPOSIXUser:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4  = a3;
  v5  = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:30];
  v6  = [MEMORY[0x1E4F1CA48] array];
  v7  = [(MCMContainerClassPathCache *)self userIdentityCache];
  v23[0]  = MEMORY[0x1E4F143A8];
  v23[1]  = 3221225472;
  v23[2]  = __52__MCMContainerClassPathCache_referenceForPOSIXUser___block_invoke;
  v23[3]  = &unk_1E6A7F928;
  v24  = v4;
  id v8 = v6;
  id v25 = v8;
  id v9 = v4;
  [v7 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v23];

  id v10 = containermanager_copy_global_configuration();
  v11  = [v10 classIterator];
  v16  = MEMORY[0x1E4F143A8];
  v17  = 3221225472;
  v18  = __52__MCMContainerClassPathCache_referenceForPOSIXUser___block_invoke_2;
  v19  = &unk_1E6A7F950;
  v20  = v8;
  v21  = self;
  v22  = v5;
  v12  = v5;
  v13  = v8;
  [v11 selectWithIterator:&v16];

  v14  = objc_msgSend(v12, "copy", v16, v17, v18, v19);

  return v14;
}

void __52__MCMContainerClassPathCache_referenceForPOSIXUser___block_invoke(uint64_t a1, void *a2)
{
  v3  = [a2 userIdentityWithPOSIXUser:*(void *)(a1 + 32)];
  objc_msgSend(*(id *)(a1 + 40), "addObject:");
}

void __52__MCMContainerClassPathCache_referenceForPOSIXUser___block_invoke_2(id *a1, void *a2)
{
  v57[1]  = *MEMORY[0x1E4F143B8];
  v3  = a2;
  v4  = +[MCMUserIdentitySharedCache sharedInstance];
  v5  = [v4 defaultUserIdentity];
  v57[0]  = v5;
  v6  = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];

  v37  = v3;
  if (+[MCMUserIdentity isUserIdentityRequiredForContainerClass:](MCMUserIdentity, "isUserIdentityRequiredForContainerClass:", [v3 containerClass]))
  {
    v7  = a1[4];
LABEL_11:

    v6  = v7;
    goto LABEL_12;
  }
  unint64_t v8 = [v3 containerClass];
  if (v8 <= 8 && ((1 << v8) & 0x12A) != 0)
  {
    id v9 = containermanager_copy_global_configuration();
    int v10 = [v9 bundleContainerMode];

    if (v10 == 1)
    {
      v11  = +[MCMUserIdentitySharedCache sharedInstance];
      v12  = [v11 globalBundleUserIdentity];
      v56  = v12;
      v13  = (void *)MEMORY[0x1E4F1C978];
      v14  = &v56;
LABEL_10:
      v7  = [v13 arrayWithObjects:v14 count:1];

      v3  = v37;
      v6  = v11;
      goto LABEL_11;
    }
  }
  if (([v3 containerClass] & 0xFFFFFFFFFFFFFFFELL) == 0xC)
  {
    v15  = containermanager_copy_global_configuration();
    v16  = [v15 systemContainerMode];

    if (v16 == 1)
    {
      v11  = +[MCMUserIdentitySharedCache sharedInstance];
      v12  = [v11 globalSystemUserIdentity];
      v55  = v12;
      v13  = (void *)MEMORY[0x1E4F1C978];
      v14  = &v55;
      goto LABEL_10;
    }
  }
LABEL_12:
  v53  = 0u;
  v54  = 0u;
  v51  = 0u;
  v52  = 0u;
  obj  = v6;
  v34  = [obj countByEnumeratingWithState:&v51 objects:v50 count:16];
  if (v34)
  {
    v33  = *(void *)v52;
    do
    {
      v17  = 0;
      do
      {
        if (*(void *)v52 != v33) {
          objc_enumerationMutation(obj);
        }
        v35  = v17;
        v18  = *(void **)(*((void *)&v51 + 1) + 8 * v17);
        v46  = 0u;
        v47  = 0u;
        v48  = 0u;
        v49  = 0u;
        v44[0]  = objc_opt_class();
        v44[1]  = objc_opt_class();
        v19  = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
        v20  = [v19 countByEnumeratingWithState:&v46 objects:v45 count:16];
        if (v20)
        {
          v21  = v20;
          v22  = *(void *)v47;
          do
          {
            for (i  = 0; i != v21; ++i)
            {
              if (*(void *)v47 != v22) {
                objc_enumerationMutation(v19);
              }
              v24  = *(objc_class **)(*((void *)&v46 + 1) + 8 * i);
              id v25 = [a1[5] containerClassPathForUserIdentity:v18 containerConfig:v3 typeClass:v24];
              uint64_t v26 = v25;
              if (v25)
              {
                __int16 v27 = [v25 classURL];
                uint64_t v28 = [v27 path];
                __int16 v29 = [v28 stringByAppendingString:@"/"];

                v3  = v37;
                [a1[6] setObject:v26 forKeyedSubscript:v29];
              }
              else
              {
                __int16 v29 = container_log_handle_for_category();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  v36  = [v18 shortDescription];
                  v30  = [v3 containerClass];
                  uint64_t v31 = NSStringFromClass(v24);
                  *(_DWORD *)buf  = 138412802;
                  v39  = v36;
                  v40  = 2048;
                  v41  = v30;
                  v3  = v37;
                  v42  = 2112;
                  v43  = v31;
                  _os_log_error_impl(&dword_1D7739000, v29, OS_LOG_TYPE_ERROR, "Could not fetch a class path; userIdentity  = %@, class  = %llu, type  = %@",
                    buf,
                    0x20u);
                }
              }
            }
            v21  = [v19 countByEnumeratingWithState:&v46 objects:v45 count:16];
          }
          while (v21);
        }

        v17  = v35 + 1;
      }
      while (v35 + 1 != v34);
      v34  = [obj countByEnumeratingWithState:&v51 objects:v50 count:16];
    }
    while (v34);
  }
}

- (void)flush
{
  p_lookupLock  = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  [(MCMContainerClassPathCache *)self _lock_flush];

  os_unfair_lock_unlock(p_lookupLock);
}

- (id)containerClassPathForContainerIdentity:(id)a3 typeClass:(Class)a4
{
  v6  = a3;
  v7  = [v6 userIdentity];
  unint64_t v8 = [v6 containerConfig];

  id v9 = [(MCMContainerClassPathCache *)self containerClassPathForUserIdentity:v7 containerConfig:v8 typeClass:a4];

  return v9;
}

- (MCMContainerClassPathCache)initWithUserIdentityCache:(id)a3
{
  v11  = *MEMORY[0x1E4F143B8];
  v5  = a3;
  v10.receiver  = self;
  v10.super_class  = (Class)MCMContainerClassPathCache;
  v6  = [(MCMContainerClassPathCache *)&v10 init];
  if (v6)
  {
    v7  = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    lookup  = v6->_lookup;
    v6->_lookup  = (NSMutableDictionary *)v7;

    v6->_lookupLock._os_unfair_lock_opaque  = 0;
    objc_storeStrong((id *)&v6->_userIdentityCache, a3);
  }

  return v6;
}

@end