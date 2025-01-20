@interface MCMContainerClassIterator
- (MCMContainerClassIterator)initWithStaticConfig:(id)a3;
- (MCMContainerClassIterator)initWithStaticConfig:(id)a3 userIdentityCache:(id)a4;
- (MCMStaticConfiguration)staticConfig;
- (MCMUserIdentityCache)userIdentityCache;
- (void)_selectWithFlags:(unint64_t)a3 includeUserIdentities:(BOOL)a4 iterator:(id)a5;
- (void)selectAutorollingWithIterator:(id)a3;
- (void)selectAutorollingWithUserIdentityIterator:(id)a3;
- (void)selectBundleWithIterator:(id)a3;
- (void)selectBundleWithUserIdentityIterator:(id)a3;
- (void)selectDataProtectedWithIterator:(id)a3;
- (void)selectDataProtectedWithUserIdentityIterator:(id)a3;
- (void)selectGlobalWithIterator:(id)a3;
- (void)selectGlobalWithUserIdentityIterator:(id)a3;
- (void)selectRemoteWithIterator:(id)a3;
- (void)selectRemoteWithUserIdentityIterator:(id)a3;
- (void)selectSystemWithIterator:(id)a3;
- (void)selectSystemWithUserIdentityIterator:(id)a3;
- (void)selectUserDataWithIterator:(id)a3;
- (void)selectUserDataWithUserIdentityIterator:(id)a3;
- (void)selectUserWithIterator:(id)a3;
- (void)selectUserWithUserIdentityIterator:(id)a3;
- (void)selectWithFlags:(unint64_t)a3 iterator:(id)a4;
- (void)selectWithFlags:(unint64_t)a3 userIdentityIterator:(id)a4;
- (void)selectWithIterator:(id)a3;
@end

@implementation MCMContainerClassIterator

- (MCMContainerClassIterator)initWithStaticConfig:(id)a3 userIdentityCache:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MCMContainerClassIterator;
  v9 = [(MCMContainerClassIterator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_staticConfig, a3);
    objc_storeStrong((id *)&v10->_userIdentityCache, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticConfig, 0);

  objc_storeStrong((id *)&self->_userIdentityCache, 0);
}

- (MCMStaticConfiguration)staticConfig
{
  return self->_staticConfig;
}

- (void)_selectWithFlags:(unint64_t)a3 includeUserIdentities:(BOOL)a4 iterator:(id)a5
{
  BOOL v5 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (!v5
    || ([(MCMContainerClassIterator *)self userIdentityCache],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v10 = [(MCMContainerClassIterator *)self staticConfig];
    v11 = [v10 containerConfigMap];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v48 objects:v47 count:16];
    if (!v12) {
      goto LABEL_63;
    }
    uint64_t v13 = v12;
    uint64_t v38 = *(void *)v49;
    BOOL v37 = v5;
    v35 = self;
    id v36 = v8;
    v34 = v11;
    while (1)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v49 != v38) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        v16 = [(MCMContainerClassIterator *)self staticConfig];
        v17 = [v16 containerConfigMap];
        v18 = [v17 objectForKeyedSubscript:v15];

        if ((a3 & 0x10000) != 0 || [v18 supportedOnPlatform])
        {
          unint64_t v19 = [v18 containerClass];
          if ((a3 & 0x20000) != 0 || (uint64_t v20 = [v18 containerClass], v20 == container_class_normalized()))
          {
            if ((a3 & 0xB0000) != 0
              || ([v18 handledDirectly] & 1) != 0
              || [v18 handledByProxy])
            {
              if ((a3 & 0x200040000) != 0)
              {
                if ((a3 & 0x200000000) != 0 && ![v18 handledByProxy]) {
                  goto LABEL_61;
                }
              }
              else if ([v18 handledByProxy])
              {
                goto LABEL_61;
              }
              if (((a3 & 0x400000000) == 0 || v19 <= 0xB && ((1 << v19) & 0xED4) != 0)
                && ((a3 & 0x800000000) == 0 || v19 <= 0xE && ((1 << v19) & 0x4ED4) != 0))
              {
                unint64_t v21 = v19 & 0xFFFFFFFFFFFFFFFELL;
                if (((a3 & 0x1000000000) == 0 || v21 == 12)
                  && ((a3 & 0x2000000000) == 0 || v19 <= 0xE && ((1 << v19) & 0x412A) != 0)
                  && ((a3 & 0x4000000000) == 0 || v19 == 4 || v19 == 2)
                  && ((a3 & 0x20000000000) == 0 || v21 == 12 || v19 <= 8 && ((1 << v19) & 0x12A) != 0)
                  && ((a3 & 0x8000000000) == 0 || [v18 autoRollsPathOnBuildUpdate])
                  && ((a3 & 0x10000000000) == 0
                   || [v18 migrateCodeSignInfoFromMetadataToDB]))
                {
                  v39[0] = MEMORY[0x1E4F143A8];
                  v39[1] = 3221225472;
                  v39[2] = __77__MCMContainerClassIterator__selectWithFlags_includeUserIdentities_iterator___block_invoke;
                  v39[3] = &unk_1E6A80040;
                  unint64_t v41 = a3;
                  id v40 = v8;
                  uint64_t v22 = MEMORY[0x1D9479020](v39);
                  v23 = (void (**)(void, void, void))v22;
                  if (v5)
                  {
                    if ([v18 usesGlobalSystemUserIdentity])
                    {
                      v24 = (void *)MEMORY[0x1E4F1CAD0];
                      v25 = [(MCMContainerClassIterator *)self userIdentityCache];
                      uint64_t v26 = [v25 globalSystemUserIdentity];
                      goto LABEL_51;
                    }
                    if ([v18 usesGlobalBundleUserIdentity])
                    {
                      v24 = (void *)MEMORY[0x1E4F1CAD0];
                      v25 = [(MCMContainerClassIterator *)self userIdentityCache];
                      uint64_t v26 = [v25 globalBundleUserIdentity];
                      goto LABEL_51;
                    }
                    if ([v18 personaAndUserSpecific])
                    {
                      v25 = [(MCMContainerClassIterator *)self userIdentityCache];
                      v27 = [v25 allAccessibleUserIdentities];
                    }
                    else
                    {
                      v24 = (void *)MEMORY[0x1E4F1CAD0];
                      v25 = [(MCMContainerClassIterator *)self userIdentityCache];
                      uint64_t v26 = [v25 defaultUserIdentity];
LABEL_51:
                      v28 = (void *)v26;
                      v27 = [v24 setWithObject:v26];
                    }
                    long long v45 = 0u;
                    long long v46 = 0u;
                    long long v43 = 0u;
                    long long v44 = 0u;
                    id v29 = v27;
                    uint64_t v30 = [v29 countByEnumeratingWithState:&v43 objects:v42 count:16];
                    if (v30)
                    {
                      uint64_t v31 = v30;
                      uint64_t v32 = *(void *)v44;
                      do
                      {
                        for (uint64_t j = 0; j != v31; ++j)
                        {
                          if (*(void *)v44 != v32) {
                            objc_enumerationMutation(v29);
                          }
                          ((void (**)(void, void *, void))v23)[2](v23, v18, *(void *)(*((void *)&v43 + 1) + 8 * j));
                        }
                        uint64_t v31 = [v29 countByEnumeratingWithState:&v43 objects:v42 count:16];
                      }
                      while (v31);
                    }

                    BOOL v5 = v37;
                    self = v35;
                    id v8 = v36;
                    v11 = v34;
                  }
                  else
                  {
                    (*(void (**)(uint64_t, void *, void))(v22 + 16))(v22, v18, 0);
                  }
                }
              }
            }
          }
        }
LABEL_61:
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v48 objects:v47 count:16];
      if (!v13)
      {
LABEL_63:

        return;
      }
    }
  }
  _os_crash();
  __break(1u);
}

void __77__MCMContainerClassIterator__selectWithFlags_includeUserIdentities_iterator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (*(unsigned char *)(a1 + 40))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = (void *)MEMORY[0x1D9478DF0]();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)selectAutorollingWithIterator:(id)a3
{
  [(MCMContainerClassIterator *)self selectWithFlags:0x8000000000 iterator:a3];
}

- (void)selectDataProtectedWithIterator:(id)a3
{
  [(MCMContainerClassIterator *)self selectWithFlags:0x4000000000 iterator:a3];
}

- (void)selectGlobalWithIterator:(id)a3
{
  [(MCMContainerClassIterator *)self selectWithFlags:0x20000000000 iterator:a3];
}

- (void)selectBundleWithIterator:(id)a3
{
  [(MCMContainerClassIterator *)self selectWithFlags:0x2000000000 iterator:a3];
}

- (void)selectSystemWithIterator:(id)a3
{
  [(MCMContainerClassIterator *)self selectWithFlags:0x1000000000 iterator:a3];
}

- (void)selectUserWithIterator:(id)a3
{
  [(MCMContainerClassIterator *)self selectWithFlags:0x800000000 iterator:a3];
}

- (void)selectRemoteWithIterator:(id)a3
{
  [(MCMContainerClassIterator *)self selectWithFlags:0x200000000 iterator:a3];
}

- (void)selectUserDataWithIterator:(id)a3
{
  [(MCMContainerClassIterator *)self selectWithFlags:0x400000000 iterator:a3];
}

- (void)selectWithIterator:(id)a3
{
  [(MCMContainerClassIterator *)self selectWithFlags:0 iterator:a3];
}

- (void)selectWithFlags:(unint64_t)a3 iterator:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__MCMContainerClassIterator_selectWithFlags_iterator___block_invoke;
  v8[3] = &unk_1E6A80018;
  id v9 = v6;
  id v7 = v6;
  [(MCMContainerClassIterator *)self _selectWithFlags:a3 includeUserIdentities:0 iterator:v8];
}

uint64_t __54__MCMContainerClassIterator_selectWithFlags_iterator___block_invoke(uint64_t a1)
{
  v1 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v1();
}

- (MCMContainerClassIterator)initWithStaticConfig:(id)a3
{
  return [(MCMContainerClassIterator *)self initWithStaticConfig:a3 userIdentityCache:0];
}

- (void)selectAutorollingWithUserIdentityIterator:(id)a3
{
  [(MCMContainerClassIterator *)self selectWithFlags:0x8000000000 userIdentityIterator:a3];
}

- (void)selectDataProtectedWithUserIdentityIterator:(id)a3
{
  [(MCMContainerClassIterator *)self selectWithFlags:0x4000000000 userIdentityIterator:a3];
}

- (void)selectGlobalWithUserIdentityIterator:(id)a3
{
  [(MCMContainerClassIterator *)self selectWithFlags:0x20000000000 userIdentityIterator:a3];
}

- (void)selectBundleWithUserIdentityIterator:(id)a3
{
  [(MCMContainerClassIterator *)self selectWithFlags:0x2000000000 userIdentityIterator:a3];
}

- (void)selectSystemWithUserIdentityIterator:(id)a3
{
  [(MCMContainerClassIterator *)self selectWithFlags:0x1000000000 userIdentityIterator:a3];
}

- (void)selectUserWithUserIdentityIterator:(id)a3
{
  [(MCMContainerClassIterator *)self selectWithFlags:0x800000000 userIdentityIterator:a3];
}

- (void)selectRemoteWithUserIdentityIterator:(id)a3
{
  [(MCMContainerClassIterator *)self selectWithFlags:0x200000000 userIdentityIterator:a3];
}

- (void)selectUserDataWithUserIdentityIterator:(id)a3
{
  [(MCMContainerClassIterator *)self selectWithFlags:0x20000000000 userIdentityIterator:a3];
}

- (void)selectWithFlags:(unint64_t)a3 userIdentityIterator:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__MCMContainerClassIterator_UserIdentity__selectWithFlags_userIdentityIterator___block_invoke;
  v8[3] = &unk_1E6A80018;
  id v9 = v6;
  id v7 = v6;
  [(MCMContainerClassIterator *)self _selectWithFlags:a3 includeUserIdentities:1 iterator:v8];
}

uint64_t __80__MCMContainerClassIterator_UserIdentity__selectWithFlags_userIdentityIterator___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v3 = *(uint64_t (**)(void))(*(void *)(result + 32) + 16);
    return v3();
  }
  return result;
}

- (MCMUserIdentityCache)userIdentityCache
{
  userIdentityCache = self->_userIdentityCache;

  return userIdentityCache;
}

@end