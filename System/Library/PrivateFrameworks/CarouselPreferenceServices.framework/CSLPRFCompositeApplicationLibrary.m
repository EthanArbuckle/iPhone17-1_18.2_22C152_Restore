@interface CSLPRFCompositeApplicationLibrary
- (BOOL)_application:(void *)a3 isUniqueAndNotCounterpartInApplications:(void *)a4 orApplicationsByCounterpart:;
- (CSLPRFCompositeApplicationLibrary)initWithPrimaryLibrary:(id)a3 secondaryLibrary:(id)a4;
- (NSArray)allApplications;
- (NSDictionary)allApplicationsDictionary;
- (id)_applicationOrCounterpartsForApplication:(void *)a3 inApplications:(void *)a4 orApplicationsByCounterpart:;
- (id)_applicationsByCounterpartFromApplications:(uint64_t)a1;
- (id)_cachedApplications;
- (id)_loadApplications;
- (id)applicationWithBundleIdentifier:(id)a3;
- (void)_applicationLibrary:(void *)a3 didAddOrUpdateApplications:;
- (void)_stopObserving;
- (void)addObserver:(id)a3;
- (void)allApplicationsWithCompletion:(id)a3;
- (void)applicationLibrary:(id)a3 didAddApplications:(id)a4;
- (void)applicationLibrary:(id)a3 didRemoveApplications:(id)a4;
- (void)applicationLibrary:(id)a3 didUpdateApplications:(id)a4;
- (void)applicationWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation CSLPRFCompositeApplicationLibrary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_secondaryApplicationsByCounterpart, 0);
  objc_storeStrong((id *)&self->_lock_secondaryApplications, 0);
  objc_storeStrong((id *)&self->_lock_primaryApplicationsByCounterpart, 0);
  objc_storeStrong((id *)&self->_lock_primaryApplications, 0);
  objc_storeStrong((id *)&self->_lock_applications, 0);
  objc_storeStrong((id *)&self->_observationHelper, 0);
  objc_storeStrong((id *)&self->_secondaryLibrary, 0);
  objc_storeStrong((id *)&self->_primaryLibrary, 0);
}

- (void)applicationLibrary:(id)a3 didRemoveApplications:(id)a4
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  v7 = (CSLPRFApplicationLibrary *)a3;
  id v8 = a4;
  primaryLibrary = self->_primaryLibrary;
  if (primaryLibrary != v7 && self->_secondaryLibrary != v7)
  {
    v49 = [NSString stringWithFormat:@"unknownLibrary:%p primary:%p, secondary:%p, %@", v7, primaryLibrary, self->_secondaryLibrary, v7];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v50 = (CSLPRFCompositeApplicationLibrary *)objc_claimAutoreleasedReturnValue();
      v51 = (objc_class *)objc_opt_class();
      v52 = NSStringFromClass(v51);
      *(_DWORD *)buf = 138544642;
      v94 = v50;
      __int16 v95 = 2114;
      v96 = v52;
      __int16 v97 = 2048;
      v98 = self;
      __int16 v99 = 2114;
      v100 = @"CSLPRFCompositeApplicationLibrary.m";
      __int16 v101 = 1024;
      *(_DWORD *)v102 = 240;
      *(_WORD *)&v102[4] = 2114;
      *(void *)&v102[6] = v49;
      _os_log_error_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v49 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x22F4F5498);
  }
  uint64_t v9 = [MEMORY[0x263EFF980] array];
  v54 = [MEMORY[0x263EFF980] array];
  v10 = [MEMORY[0x263EFF980] array];
  if (primaryLibrary == v7)
  {
    v11 = [(CSLPRFApplicationLibrary *)self->_secondaryLibrary allApplicationsDictionary];
  }
  else
  {
    v11 = 0;
  }
  v58 = v11;
  v57 = -[CSLPRFCompositeApplicationLibrary _applicationsByCounterpartFromApplications:]((uint64_t)self, v11);
  os_unfair_lock_lock(&self->_lock);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  obuint64_t j = v8;
  v66 = (void *)v9;
  uint64_t v63 = [obj countByEnumeratingWithState:&v85 objects:v92 count:16];
  if (v63)
  {
    uint64_t v61 = *(void *)v86;
    v53 = v7;
    v56 = v10;
    do
    {
      for (uint64_t i = 0; i != v63; ++i)
      {
        if (*(void *)v86 != v61) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        v14 = [(NSMutableDictionary *)self->_lock_applications objectForKey:v13];
        v15 = [(__CFString *)v14 counterpartIdentifiers];
        if (primaryLibrary != v7)
        {
          v16 = [(NSMutableDictionary *)self->_lock_primaryApplications objectForKey:v13];

          if (v14) {
            BOOL v17 = v16 == 0;
          }
          else {
            BOOL v17 = 0;
          }
          if (v17)
          {
            [v10 addObject:v13];
            [(NSMutableDictionary *)self->_lock_applications removeObjectForKey:v13];
          }
          [(NSMutableDictionary *)self->_lock_secondaryApplications removeObjectForKey:v13];
          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          id v18 = v15;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v73 objects:v89 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            v21 = v15;
            v22 = v14;
            uint64_t v23 = i;
            uint64_t v24 = *(void *)v74;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v74 != v24) {
                  objc_enumerationMutation(v18);
                }
                [(NSMutableDictionary *)self->_lock_primaryApplicationsByCounterpart removeObjectForKey:*(void *)(*((void *)&v73 + 1) + 8 * j)];
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v73 objects:v89 count:16];
            }
            while (v20);
            uint64_t i = v23;
            v14 = v22;
            v15 = v21;
          }
          goto LABEL_55;
        }
        v26 = -[CSLPRFCompositeApplicationLibrary _applicationOrCounterpartsForApplication:inApplications:orApplicationsByCounterpart:]((uint64_t)self, v14, v58, v57);
        id v18 = v26;
        uint64_t v60 = i;
        v64 = v15;
        if (v26)
        {
          uint64_t v27 = [v26 count];
          if (v14)
          {
            if (v27)
            {
              long long v83 = 0u;
              long long v84 = 0u;
              long long v81 = 0u;
              long long v82 = 0u;
              id v28 = v18;
              uint64_t v29 = [v28 countByEnumeratingWithState:&v81 objects:v91 count:16];
              if (v29)
              {
                uint64_t v30 = v29;
                id v65 = v28;
                v55 = v14;
                char v31 = 0;
                uint64_t v32 = *(void *)v82;
                do
                {
                  for (uint64_t k = 0; k != v30; ++k)
                  {
                    if (*(void *)v82 != v32) {
                      objc_enumerationMutation(v65);
                    }
                    v34 = *(void **)(*((void *)&v81 + 1) + 8 * k);
                    v35 = [v34 bundleIdentifier];
                    int v36 = [v13 isEqual:v35];
                    v37 = v66;
                    if (v36) {
                      v37 = v54;
                    }
                    v31 |= v36;
                    [v37 addObject:v34];
                    [(NSMutableDictionary *)self->_lock_applications setObject:v34 forKey:v35];
                  }
                  uint64_t v30 = [v65 countByEnumeratingWithState:&v81 objects:v91 count:16];
                }
                while (v30);
                id v28 = v65;

                v7 = v53;
                v14 = v55;
                if (v31) {
                  goto LABEL_44;
                }
              }
              else
              {
              }
              [v56 addObject:v13];
              [(NSMutableDictionary *)self->_lock_applications removeObjectForKey:v13];
LABEL_44:
              v38 = cslprf_app_library_log();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v28, "bs_mapNoNulls:", &__block_literal_global_656);
                v45 = (CSLPRFCompositeApplicationLibrary *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134219010;
                v94 = self;
                __int16 v95 = 2114;
                v96 = v13;
                __int16 v97 = 2114;
                v98 = v45;
                __int16 v99 = 2114;
                v100 = v14;
                __int16 v101 = 2114;
                *(void *)v102 = v28;
                _os_log_debug_impl(&dword_22F4EA000, v38, OS_LOG_TYPE_DEBUG, "%p did remove application:%{public}@ will replace with applications:%{public}@ \nremoved application:%{public}@ \nreplacement applications:%{public}@", buf, 0x34u);
              }
              v10 = v56;
              goto LABEL_47;
            }
LABEL_41:
            [v10 addObject:v13];
            [(NSMutableDictionary *)self->_lock_applications removeObjectForKey:v13];
          }
        }
        else if (v14)
        {
          goto LABEL_41;
        }
LABEL_47:
        v39 = v14;
        [(NSMutableDictionary *)self->_lock_primaryApplications removeObjectForKey:v13];
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v40 = v64;
        uint64_t v41 = [v40 countByEnumeratingWithState:&v77 objects:v90 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v78;
          do
          {
            for (uint64_t m = 0; m != v42; ++m)
            {
              if (*(void *)v78 != v43) {
                objc_enumerationMutation(v40);
              }
              [(NSMutableDictionary *)self->_lock_primaryApplicationsByCounterpart removeObjectForKey:*(void *)(*((void *)&v77 + 1) + 8 * m)];
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v77 objects:v90 count:16];
          }
          while (v42);
        }

        uint64_t i = v60;
        v14 = v39;
        v15 = v64;
LABEL_55:
      }
      uint64_t v63 = [obj countByEnumeratingWithState:&v85 objects:v92 count:16];
    }
    while (v63);
  }

  os_unfair_lock_unlock(&self->_lock);
  if ([v66 count])
  {
    observationHelper = self->_observationHelper;
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __78__CSLPRFCompositeApplicationLibrary_applicationLibrary_didRemoveApplications___block_invoke_17;
    v71[3] = &unk_264A0AE98;
    v71[4] = self;
    id v72 = v66;
    [(CSLPRFObservationHelper *)observationHelper notifyObserversWithBlock:v71];
  }
  if ([v54 count])
  {
    v47 = self->_observationHelper;
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __78__CSLPRFCompositeApplicationLibrary_applicationLibrary_didRemoveApplications___block_invoke_2;
    v69[3] = &unk_264A0AE98;
    v69[4] = self;
    id v70 = v54;
    [(CSLPRFObservationHelper *)v47 notifyObserversWithBlock:v69];
  }
  if ([v10 count])
  {
    v48 = self->_observationHelper;
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __78__CSLPRFCompositeApplicationLibrary_applicationLibrary_didRemoveApplications___block_invoke_3;
    v67[3] = &unk_264A0AE98;
    v67[4] = self;
    id v68 = v10;
    [(CSLPRFObservationHelper *)v48 notifyObserversWithBlock:v67];
  }
}

- (id)_applicationsByCounterpartFromApplications:(uint64_t)a1
{
  if (a1)
  {
    v2 = (void *)MEMORY[0x263EFF9A0];
    id v3 = a2;
    v4 = [v2 dictionary];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __80__CSLPRFCompositeApplicationLibrary__applicationsByCounterpartFromApplications___block_invoke;
    v7[3] = &unk_264A0AEC0;
    id v5 = v4;
    id v8 = v5;
    [v3 enumerateKeysAndObjectsUsingBlock:v7];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)_applicationOrCounterpartsForApplication:(void *)a3 inApplications:(void *)a4 orApplicationsByCounterpart:
{
  v33[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v10 = [v7 bundleIdentifier];
    uint64_t v11 = [v8 objectForKey:v10];
    if (v11)
    {
      v12 = (void *)v11;
      v33[0] = v11;
      v13 = (void *)MEMORY[0x263EFF8C0];
      v14 = v33;
    }
    else
    {
      uint64_t v15 = [v9 objectForKey:v10];
      if (!v15)
      {
        id v26 = v9;
        id v18 = [v7 counterpartIdentifiers];
        uint64_t v19 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v18, "count"));
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v20 = v18;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          v12 = 0;
          uint64_t v23 = *(void *)v28;
          do
          {
            uint64_t v24 = 0;
            v25 = v12;
            do
            {
              if (*(void *)v28 != v23) {
                objc_enumerationMutation(v20);
              }
              v12 = [v8 objectForKey:*(void *)(*((void *)&v27 + 1) + 8 * v24)];

              if (v12) {
                [v19 addObject:v12];
              }
              ++v24;
              v25 = v12;
            }
            while (v22 != v24);
            uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v22);
        }
        else
        {
          v12 = 0;
        }

        if ([v19 count]) {
          v16 = (void *)[v19 copy];
        }
        else {
          v16 = 0;
        }
        id v9 = v26;

        goto LABEL_7;
      }
      v12 = (void *)v15;
      uint64_t v32 = v15;
      v13 = (void *)MEMORY[0x263EFF8C0];
      v14 = &v32;
    }
    v16 = [v13 arrayWithObjects:v14 count:1];
LABEL_7:

    goto LABEL_8;
  }
  v16 = 0;
LABEL_8:

  return v16;
}

uint64_t __78__CSLPRFCompositeApplicationLibrary_applicationLibrary_didRemoveApplications___block_invoke_17(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didAddApplications:*(void *)(a1 + 40)];
}

uint64_t __78__CSLPRFCompositeApplicationLibrary_applicationLibrary_didRemoveApplications___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didUpdateApplications:*(void *)(a1 + 40)];
}

uint64_t __78__CSLPRFCompositeApplicationLibrary_applicationLibrary_didRemoveApplications___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didRemoveApplications:*(void *)(a1 + 40)];
}

uint64_t __78__CSLPRFCompositeApplicationLibrary_applicationLibrary_didRemoveApplications___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

void __80__CSLPRFCompositeApplicationLibrary__applicationsByCounterpartFromApplications___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 counterpartIdentifiers];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(a1 + 32) setObject:v4 forKey:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)applicationLibrary:(id)a3 didUpdateApplications:(id)a4
{
}

- (void)_applicationLibrary:(void *)a3 didAddOrUpdateApplications:
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v47 = *(id *)(a1 + 8);
    if (v47 != v5 && *(id *)(a1 + 16) != v5)
    {
      v35 = [NSString stringWithFormat:@"unknownLibrary:%p primary:%p, secondary:%p, %@", v5, v47, *(void *)(a1 + 16), v5];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        int v36 = NSStringFromSelector(sel__applicationLibrary_didAddOrUpdateApplications_);
        v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        *(_DWORD *)buf = 138544642;
        long long v82 = v36;
        __int16 v83 = 2114;
        long long v84 = v38;
        __int16 v85 = 2048;
        uint64_t v86 = a1;
        __int16 v87 = 2114;
        long long v88 = @"CSLPRFCompositeApplicationLibrary.m";
        __int16 v89 = 1024;
        int v90 = 154;
        __int16 v91 = 2114;
        v92 = v35;
        _os_log_error_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v35 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x22F4F605CLL);
    }
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    v45 = [MEMORY[0x263EFF980] array];
    uint64_t v42 = [MEMORY[0x263EFF980] array];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v39 = v6;
    obuint64_t j = v6;
    uint64_t v48 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
    if (v48)
    {
      uint64_t v46 = *(void *)v74;
      id v40 = v7;
      id v41 = v5;
      do
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v74 != v46) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          long long v10 = [v9 bundleIdentifier];
          long long v11 = [v9 counterpartIdentifiers];
          long long v12 = [*(id *)(a1 + 32) objectForKey:v10];

          v49 = v11;
          if (v47 == v5)
          {
            if (v12)
            {
              [v45 addObject:v9];
            }
            else
            {
              [v7 addObject:v9];
              v68[0] = MEMORY[0x263EF8330];
              v68[1] = 3221225472;
              v68[2] = __84__CSLPRFCompositeApplicationLibrary__applicationLibrary_didAddOrUpdateApplications___block_invoke;
              v68[3] = &unk_264A0AE70;
              id v43 = v10;
              id v69 = v43;
              uint64_t v70 = a1;
              v71 = v9;
              id v72 = v42;
              uint64_t v19 = (void (**)(void, void))MEMORY[0x230FB9060](v68);
              long long v64 = 0u;
              long long v65 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              id v20 = v11;
              uint64_t v21 = [v20 countByEnumeratingWithState:&v64 objects:v79 count:16];
              if (v21)
              {
                uint64_t v22 = v21;
                uint64_t v23 = *(void *)v65;
                do
                {
                  for (uint64_t j = 0; j != v22; ++j)
                  {
                    if (*(void *)v65 != v23) {
                      objc_enumerationMutation(v20);
                    }
                    v19[2](v19, *(void *)(*((void *)&v64 + 1) + 8 * j));
                  }
                  uint64_t v22 = [v20 countByEnumeratingWithState:&v64 objects:v79 count:16];
                }
                while (v22);
              }

              v25 = [*(id *)(a1 + 64) objectForKey:v43];
              id v26 = [v25 bundleIdentifier];
              ((void (**)(void, void *))v19)[2](v19, v26);

              uint64_t v7 = v40;
              id v5 = v41;
              long long v11 = v49;
            }
            [*(id *)(a1 + 32) setObject:v9 forKey:v10];
            [*(id *)(a1 + 40) setObject:v9 forKey:v10];
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            id v27 = v11;
            uint64_t v28 = [v27 countByEnumeratingWithState:&v60 objects:v78 count:16];
            if (v28)
            {
              uint64_t v29 = v28;
              uint64_t v30 = *(void *)v61;
              do
              {
                for (uint64_t k = 0; k != v29; ++k)
                {
                  if (*(void *)v61 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  [*(id *)(a1 + 48) setObject:v9 forKey:*(void *)(*((void *)&v60 + 1) + 8 * k)];
                }
                uint64_t v29 = [v27 countByEnumeratingWithState:&v60 objects:v78 count:16];
              }
              while (v29);
            }
          }
          else
          {
            if (-[CSLPRFCompositeApplicationLibrary _application:isUniqueAndNotCounterpartInApplications:orApplicationsByCounterpart:](a1, v9, *(void **)(a1 + 40), *(void **)(a1 + 48)))
            {
              if (v12) {
                long long v13 = v45;
              }
              else {
                long long v13 = v7;
              }
              [v13 addObject:v9];
              [*(id *)(a1 + 32) setObject:v9 forKey:v10];
            }
            [*(id *)(a1 + 56) setObject:v9 forKey:v10];
            long long v58 = 0u;
            long long v59 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            id v14 = v11;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v56 objects:v77 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v57;
              do
              {
                for (uint64_t m = 0; m != v16; ++m)
                {
                  if (*(void *)v57 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  objc_msgSend(*(id *)(a1 + 64), "bs_setSafeObject:forKey:", v9, *(void *)(*((void *)&v56 + 1) + 8 * m));
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v56 objects:v77 count:16];
              }
              while (v16);
            }
          }
        }
        uint64_t v48 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
      }
      while (v48);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    if ([v7 count])
    {
      uint64_t v32 = *(void **)(a1 + 24);
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __84__CSLPRFCompositeApplicationLibrary__applicationLibrary_didAddOrUpdateApplications___block_invoke_14;
      v54[3] = &unk_264A0AE98;
      v54[4] = a1;
      id v55 = v7;
      [v32 notifyObserversWithBlock:v54];
    }
    if ([v45 count])
    {
      v33 = *(void **)(a1 + 24);
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __84__CSLPRFCompositeApplicationLibrary__applicationLibrary_didAddOrUpdateApplications___block_invoke_2;
      v52[3] = &unk_264A0AE98;
      v52[4] = a1;
      id v53 = v45;
      [v33 notifyObserversWithBlock:v52];
    }
    if ([v42 count])
    {
      v34 = *(void **)(a1 + 24);
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __84__CSLPRFCompositeApplicationLibrary__applicationLibrary_didAddOrUpdateApplications___block_invoke_3;
      v50[3] = &unk_264A0AE98;
      v50[4] = a1;
      id v51 = v42;
      [v34 notifyObserversWithBlock:v50];
    }
    id v6 = v39;
  }
}

void __84__CSLPRFCompositeApplicationLibrary__applicationLibrary_didAddOrUpdateApplications___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3 && ([v3 isEqual:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v5 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKey:v4];
    if (v5)
    {
      id v6 = cslprf_app_library_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = *(void *)(a1 + 48);
        int v9 = 134219010;
        uint64_t v10 = v7;
        __int16 v11 = 2114;
        uint64_t v12 = v8;
        __int16 v13 = 2114;
        id v14 = v5;
        __int16 v15 = 2114;
        uint64_t v16 = v8;
        __int16 v17 = 2114;
        id v18 = v5;
        _os_log_debug_impl(&dword_22F4EA000, v6, OS_LOG_TYPE_DEBUG, "%p did add application:%{public}@ will remove counterpart application:%{public}@ \napplication:%{public}@ \ncounterpart:%{public}@", (uint8_t *)&v9, 0x34u);
      }

      [*(id *)(a1 + 56) addObject:v4];
      [*(id *)(*(void *)(a1 + 40) + 32) removeObjectForKey:v4];
    }
  }
}

- (BOOL)_application:(void *)a3 isUniqueAndNotCounterpartInApplications:(void *)a4 orApplicationsByCounterpart:
{
  if (!a1) {
    return 0;
  }
  id v4 = -[CSLPRFCompositeApplicationLibrary _applicationOrCounterpartsForApplication:inApplications:orApplicationsByCounterpart:](a1, a2, a3, a4);
  id v5 = v4;
  if (v4) {
    BOOL v6 = [v4 count] == 0;
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

uint64_t __84__CSLPRFCompositeApplicationLibrary__applicationLibrary_didAddOrUpdateApplications___block_invoke_14(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didAddApplications:*(void *)(a1 + 40)];
}

uint64_t __84__CSLPRFCompositeApplicationLibrary__applicationLibrary_didAddOrUpdateApplications___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didUpdateApplications:*(void *)(a1 + 40)];
}

uint64_t __84__CSLPRFCompositeApplicationLibrary__applicationLibrary_didAddOrUpdateApplications___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didRemoveApplications:*(void *)(a1 + 40)];
}

- (void)applicationLibrary:(id)a3 didAddApplications:(id)a4
{
}

- (void)removeObserver:(id)a3
{
  [(CSLPRFObservationHelper *)self->_observationHelper removeObserver:a3];
  if (![(CSLPRFObservationHelper *)self->_observationHelper observerCount])
  {
    -[CSLPRFCompositeApplicationLibrary _stopObserving]((uint64_t)self);
  }
}

- (void)_stopObserving
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 72);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    int v3 = *(unsigned __int8 *)(a1 + 76);
    *(unsigned char *)(a1 + 76) = 0;
    os_unfair_lock_unlock(v2);
    if (v3)
    {
      [*(id *)(a1 + 8) removeObserver:a1];
      id v4 = *(void **)(a1 + 16);
      [v4 removeObserver:a1];
    }
  }
}

- (void)addObserver:(id)a3
{
  id v8 = a3;
  unint64_t v4 = [(CSLPRFObservationHelper *)self->_observationHelper observerCount];
  [(CSLPRFObservationHelper *)self->_observationHelper addObserver:v8];
  if (v4)
  {
    id v5 = -[CSLPRFCompositeApplicationLibrary _cachedApplications]((uint64_t)self);
    BOOL v6 = [v5 allValues];
    [v8 applicationLibrary:self didAddApplications:v6];
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    BOOL lock_observing = self->_lock_observing;
    self->_BOOL lock_observing = 1;
    os_unfair_lock_unlock(&self->_lock);
    if (!lock_observing)
    {
      [(CSLPRFApplicationLibrary *)self->_primaryLibrary addObserver:self];
      [(CSLPRFApplicationLibrary *)self->_secondaryLibrary addObserver:self];
    }
  }
}

- (id)_cachedApplications
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 72);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    id v3 = *(id *)(a1 + 32);
    os_unfair_lock_unlock(v2);
    if (!v3)
    {
      -[CSLPRFCompositeApplicationLibrary _loadApplications]((id *)a1);
      id v3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)_loadApplications
{
  v1 = a1;
  if (a1)
  {
    v2 = [a1[1] allApplicationsDictionary];
    id v3 = -[CSLPRFCompositeApplicationLibrary _applicationsByCounterpartFromApplications:]((uint64_t)v1, v2);
    unint64_t v4 = [v1[2] allApplicationsDictionary];
    id v5 = (void *)[v2 mutableCopy];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __54__CSLPRFCompositeApplicationLibrary__loadApplications__block_invoke;
    v25[3] = &unk_264A0AE48;
    v25[4] = v1;
    id v26 = v2;
    id v6 = v3;
    id v27 = v6;
    id v7 = v5;
    id v28 = v7;
    id v8 = v2;
    [v4 enumerateKeysAndObjectsUsingBlock:v25];
    os_unfair_lock_lock((os_unfair_lock_t)v1 + 18);
    id v9 = v1[4];
    objc_storeStrong(v1 + 4, v5);
    uint64_t v10 = [v8 mutableCopy];
    id v11 = v1[5];
    v1[5] = (id)v10;

    id v12 = v1[6];
    v1[6] = v6;
    id v13 = v6;

    uint64_t v14 = [v4 mutableCopy];
    id v15 = v1[7];
    v1[7] = (id)v14;

    uint64_t v16 = -[CSLPRFCompositeApplicationLibrary _applicationsByCounterpartFromApplications:]((uint64_t)v1, v4);
    id v17 = v1[8];
    v1[8] = (id)v16;

    os_unfair_lock_unlock((os_unfair_lock_t)v1 + 18);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__CSLPRFCompositeApplicationLibrary__loadApplications__block_invoke_2;
    block[3] = &unk_264A0BAB0;
    block[4] = v1;
    id v18 = v7;
    id v23 = v18;
    id v24 = v9;
    id v19 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
    id v20 = v24;
    v1 = (id *)v18;
  }
  return v1;
}

void __54__CSLPRFCompositeApplicationLibrary__loadApplications__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (-[CSLPRFCompositeApplicationLibrary _application:isUniqueAndNotCounterpartInApplications:orApplicationsByCounterpart:](*(void *)(a1 + 32), v5, *(void **)(a1 + 40), *(void **)(a1 + 48)))
  {
    [*(id *)(a1 + 56) setObject:v5 forKey:v6];
  }
}

void __54__CSLPRFCompositeApplicationLibrary__loadApplications__block_invoke_2(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    id v5 = [MEMORY[0x263EFF980] array];
    id v6 = [MEMORY[0x263EFF980] array];
    id v7 = [MEMORY[0x263EFF980] array];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __95__CSLPRFCompositeApplicationLibrary__notifyObserversOfChangesWithApplications_oldApplications___block_invoke;
    void v33[3] = &unk_264A0B4A0;
    id v22 = v4;
    id v8 = v4;
    id v34 = v8;
    id v21 = v6;
    id v35 = v21;
    id v9 = v5;
    id v36 = v9;
    [v3 enumerateKeysAndObjectsUsingBlock:v33];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(v3, "objectForKey:", v15, v21);

          if (!v16) {
            [v7 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v12);
    }

    if ([v9 count])
    {
      id v17 = *(void **)(v1 + 24);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __95__CSLPRFCompositeApplicationLibrary__notifyObserversOfChangesWithApplications_oldApplications___block_invoke_2;
      v27[3] = &unk_264A0AE98;
      v27[4] = v1;
      id v28 = v9;
      [v17 notifyObserversWithBlock:v27];
    }
    id v18 = v21;
    if (objc_msgSend(v21, "count", v21))
    {
      id v19 = *(void **)(v1 + 24);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __95__CSLPRFCompositeApplicationLibrary__notifyObserversOfChangesWithApplications_oldApplications___block_invoke_3;
      v25[3] = &unk_264A0AE98;
      v25[4] = v1;
      id v26 = v18;
      [v19 notifyObserversWithBlock:v25];
    }
    if ([v7 count])
    {
      id v20 = *(void **)(v1 + 24);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __95__CSLPRFCompositeApplicationLibrary__notifyObserversOfChangesWithApplications_oldApplications___block_invoke_4;
      v23[3] = &unk_264A0AE98;
      v23[4] = v1;
      id v24 = v7;
      [v20 notifyObserversWithBlock:v23];
    }
    id v4 = v22;
  }
}

void __95__CSLPRFCompositeApplicationLibrary__notifyObserversOfChangesWithApplications_oldApplications___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v5 = [a1[4] objectForKey:a2];
  if (v5)
  {
    if ([v8 isEqual:v5]) {
      goto LABEL_6;
    }
    id v6 = v8;
    id v7 = a1 + 5;
  }
  else
  {
    id v6 = v8;
    id v7 = a1 + 6;
  }
  [*v7 addObject:v6];
LABEL_6:
}

uint64_t __95__CSLPRFCompositeApplicationLibrary__notifyObserversOfChangesWithApplications_oldApplications___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didAddApplications:*(void *)(a1 + 40)];
}

uint64_t __95__CSLPRFCompositeApplicationLibrary__notifyObserversOfChangesWithApplications_oldApplications___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didUpdateApplications:*(void *)(a1 + 40)];
}

uint64_t __95__CSLPRFCompositeApplicationLibrary__notifyObserversOfChangesWithApplications_oldApplications___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didRemoveApplications:*(void *)(a1 + 40)];
}

- (void)allApplicationsWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = [(CSLPRFCompositeApplicationLibrary *)self allApplications];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (NSDictionary)allApplicationsDictionary
{
  v2 = -[CSLPRFCompositeApplicationLibrary _loadApplications]((id *)&self->super.isa);
  id v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (NSArray)allApplications
{
  v2 = -[CSLPRFCompositeApplicationLibrary _loadApplications]((id *)&self->super.isa);
  id v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (void)applicationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = [(CSLPRFCompositeApplicationLibrary *)self applicationWithBundleIdentifier:a3];
  (*((void (**)(id, id))a4 + 2))(v7, v8);
}

- (id)applicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = -[CSLPRFCompositeApplicationLibrary _cachedApplications]((uint64_t)self);
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)dealloc
{
  -[CSLPRFCompositeApplicationLibrary _stopObserving]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)CSLPRFCompositeApplicationLibrary;
  [(CSLPRFCompositeApplicationLibrary *)&v3 dealloc];
}

- (CSLPRFCompositeApplicationLibrary)initWithPrimaryLibrary:(id)a3 secondaryLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CSLPRFCompositeApplicationLibrary;
  id v9 = [(CSLPRFCompositeApplicationLibrary *)&v20 init];
  id v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_primaryLibrary, a3);
    objc_storeStrong((id *)&v10->_secondaryLibrary, a4);
    uint64_t v11 = objc_alloc_init(CSLPRFObservationHelper);
    observationHelper = v10->_observationHelper;
    v10->_observationHelper = v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    lock_applications = v10->_lock_applications;
    v10->_lock_applications = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    lock_primaryApplications = v10->_lock_primaryApplications;
    v10->_lock_primaryApplications = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    lock_secondaryApplications = v10->_lock_secondaryApplications;
    v10->_lock_secondaryApplications = (NSMutableDictionary *)v17;
  }
  return v10;
}

@end