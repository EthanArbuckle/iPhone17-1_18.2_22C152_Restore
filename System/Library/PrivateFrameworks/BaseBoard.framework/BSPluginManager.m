@interface BSPluginManager
+ (id)mainManager;
+ (id)managerForBundle:(uint64_t)a1;
- (NSArray)pluginBundles;
- (NSBundle)bundle;
- (NSString)pluginDirectory;
- (id)description;
- (id)initWithBundle:(void *)a1;
- (id)pluginBundleForIdentifier:(id)a3;
- (id)pluginBundleForName:(id)a3 type:(id)a4;
- (id)pluginBundlesForType:(id)a3;
@end

@implementation BSPluginManager

+ (id)mainManager
{
  v2 = +[BSPluginManagerCoordinator sharedInstance];
  v3 = [v2 mainPluginManager];

  return v3;
}

+ (id)managerForBundle:(uint64_t)a1
{
  id v2 = a2;
  id v3 = objc_alloc((Class)self);
  v4 = -[BSPluginManager initWithBundle:](v3, v2);

  return v4;
}

- (id)initWithBundle:(void *)a1
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v47 = v4;
  if (!a1) {
    goto LABEL_7;
  }
  id v5 = v4;
  NSClassFromString(&cfstr_Nsbundle.isa);
  if (!v5)
  {
    v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_initWithBundle_);
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      v38 = (objc_class *)objc_opt_class();
      v39 = NSStringFromClass(v38);
      *(_DWORD *)buf = 138544642;
      id v66 = v37;
      __int16 v67 = 2114;
      v68 = v39;
      __int16 v69 = 2048;
      v70 = a1;
      __int16 v71 = 2114;
      v72 = @"BSPluginManager.m";
      __int16 v73 = 1024;
      int v74 = 32;
      __int16 v75 = 2114;
      v76 = v36;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v36 UTF8String];
    __break(0);
    JUMPOUT(0x18AB1B838);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v40 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSBundleClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_initWithBundle_);
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      v42 = (objc_class *)objc_opt_class();
      v43 = NSStringFromClass(v42);
      *(_DWORD *)buf = 138544642;
      id v66 = v41;
      __int16 v67 = 2114;
      v68 = v43;
      __int16 v69 = 2048;
      v70 = a1;
      __int16 v71 = 2114;
      v72 = @"BSPluginManager.m";
      __int16 v73 = 1024;
      int v74 = 32;
      __int16 v75 = 2114;
      v76 = v40;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v40 UTF8String];
    __break(0);
    JUMPOUT(0x18AB1B944);
  }

  v60.receiver = a1;
  v60.super_class = (Class)BSPluginManager;
  v6 = (id *)objc_msgSendSuper2(&v60, sel_init);
  if (v6)
  {
    id v44 = v5;
    v51 = v6;
    v7 = v6 + 1;
    objc_storeStrong(v6 + 1, a2);
    v49 = [MEMORY[0x1E4F28CB8] defaultManager];
    v45 = _BSSearchPathForDirectoryInDomain(NSLibraryDirectory, 8uLL);
    v8 = [*v7 infoDictionary];
    v46 = objc_msgSend(v8, "bs_safeStringForKey:", @"BSPluginDirectoryName");

    if (v46)
    {
      v9 = objc_msgSend(v45, "stringByAppendingPathComponent:");
      v64 = v9;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
    }
    else
    {
      v11 = [v5 executablePath];
      v12 = [v11 lastPathComponent];
      v9 = [v45 stringByAppendingPathComponent:v12];

      v13 = [v9 stringByAppendingPathComponent:@"Plugins"];
      v63[0] = v13;
      v14 = [v9 stringByAppendingString:@"Plugins"];
      v63[1] = v14;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
    }
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    obuint64_t j = v10;
    uint64_t v15 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v57;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v57 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          buf[0] = 0;
          int v19 = [v49 fileExistsAtPath:v18 isDirectory:buf];
          if (buf[0]) {
            int v20 = v19;
          }
          else {
            int v20 = 0;
          }
          if (v20 == 1)
          {
            uint64_t v21 = [v18 copy];
            id v22 = v51[2];
            v51[2] = (id)v21;

            goto LABEL_22;
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_22:

    if (v51[2])
    {
      v23 = +[BSPluginSpecification specificationsFromHostBundle:]((uint64_t)BSPluginSpecification, *v7);
      v50 = [MEMORY[0x1E4F1CA48] array];
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v24 = [v49 contentsOfDirectoryAtPath:v51[2] error:0];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v52 objects:v61 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v53;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v53 != v26) {
              objc_enumerationMutation(v24);
            }
            uint64_t v28 = *(void *)(*((void *)&v52 + 1) + 8 * j);
            v29 = (void *)MEMORY[0x18C125360]();
            v30 = [v51[2] stringByAppendingPathComponent:v28];
            v31 = +[BSPluginBundle bundleWithPath:availableSpecifications:]((uint64_t)BSPluginBundle, v30, v23);
            if ([v31 isValid])
            {
              [v50 addObject:v31];
            }
            else
            {
              v32 = BSLogCommon();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                id v66 = v30;
                _os_log_error_impl(&dword_18AAA8000, v32, OS_LOG_TYPE_ERROR, "Ignoring invalid plugin found at %{public}@", buf, 0xCu);
              }
            }
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v52 objects:v61 count:16];
        }
        while (v25);
      }

      uint64_t v33 = [v50 copy];
      id v34 = v51[3];
      v51[3] = (id)v33;
    }
    else
    {
      v23 = BSLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v66 = v44;
        _os_log_error_impl(&dword_18AAA8000, v23, OS_LOG_TYPE_ERROR, "No plugin directory found for %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
LABEL_7:
    v51 = 0;
  }

  return v51;
}

- (id)pluginBundleForName:(id)a3 type:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = [v6 stringByDeletingPathExtension];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v10 = v8->_pluginBundles;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "name", (void)v20);
        if (([v15 isEqualToString:v6] & 1) != 0
          || [v15 isEqualToString:v9])
        {
          if (v7
            && ([v14 type],
                v17 = objc_claimAutoreleasedReturnValue(),
                int v18 = [v7 isEqualToString:v17],
                v17,
                !v18))
          {
            id v16 = 0;
          }
          else
          {
            id v16 = v14;
          }

          goto LABEL_17;
        }
      }
      uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      id v16 = 0;
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v16 = 0;
  }
LABEL_17:

  objc_sync_exit(v8);
  return v16;
}

- (id)pluginBundleForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5->_pluginBundles;
  id v7 = (id)[(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "identifier", (void)v13);
        if ([v11 isEqualToString:v4])
        {
          id v7 = v10;

          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);
  return v7;
}

- (id)pluginBundlesForType:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = self;
  objc_sync_enter(v6);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6->_pluginBundles;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "type", (void)v15);
        int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v6);
  return v5;
}

- (id)description
{
  p_isa = (id *)&self->super.isa;
  if (self)
  {
    id v3 = +[BSDescriptionBuilder builderWithObject:self];
    id v4 = [p_isa[1] bundleIdentifier];
    id v5 = (id)[v3 appendObject:v4 withName:0];

    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __57__BSPluginManager_descriptionBuilderWithMultilinePrefix___block_invoke;
    uint64_t v12 = &unk_1E54456B8;
    id v6 = v3;
    id v13 = v6;
    long long v14 = p_isa;
    [v6 appendBodySectionWithName:0 multilinePrefix:0 block:&v9];
    id v7 = v6;

    objc_msgSend(v7, "build", v9, v10, v11, v12);
    p_isa = (id *)objc_claimAutoreleasedReturnValue();
  }
  return p_isa;
}

uint64_t __57__BSPluginManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"directory"];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 24);
  return [v3 appendArraySection:v4 withName:@"bundles" skipIfEmpty:1];
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (NSString)pluginDirectory
{
  return self->_pluginDirectory;
}

- (NSArray)pluginBundles
{
  return self->_pluginBundles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginBundles, 0);
  objc_storeStrong((id *)&self->_pluginDirectory, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end