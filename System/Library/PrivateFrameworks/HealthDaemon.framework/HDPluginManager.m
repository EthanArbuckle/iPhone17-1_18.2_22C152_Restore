@interface HDPluginManager
- (HDDaemon)daemon;
- (HDPluginManager)initWithDaemon:(id)a3;
- (NSArray)allowablePluginDirectoryPaths;
- (NSArray)notificationInstructionCriteriaClasses;
- (id)_builtInPluginClasses;
- (id)_createPluginsFromClasses:(id)a3;
- (id)_internalPluginsDirectoryPaths;
- (id)_pluginClasses;
- (id)_pluginDirectoryPaths;
- (id)_pluginsDirectoryPath;
- (id)createExtensionsForDaemon:(id)a3;
- (id)createExtensionsForProfile:(id)a3;
- (id)pluginsConformingToProtocol:(id)a3;
- (void)notifyPluginsOfDatabaseObliteration;
- (void)setAllowablePluginDirectoryPaths:(id)a3;
- (void)setDaemon:(id)a3;
@end

@implementation HDPluginManager

- (id)_builtInPluginClasses
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

- (HDPluginManager)initWithDaemon:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HDPluginManager.m", 26, @"Invalid parameter not satisfying: %@", @"daemon != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)HDPluginManager;
  v6 = [(HDPluginManager *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_daemon, v5);
    v8 = [(HDPluginManager *)v7 _pluginClasses];
    uint64_t v9 = [(HDPluginManager *)v7 _createPluginsFromClasses:v8];
    plugins = v7->_plugins;
    v7->_plugins = (NSArray *)v9;
  }
  return v7;
}

- (id)_pluginsDirectoryPath
{
  if (a1)
  {
    a1 = [(id)GSSystemRootDirectory() stringByAppendingPathComponent:@"/System/Library/Health/Plugins"];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_internalPluginsDirectoryPaths
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = [(id)GSSystemRootDirectory() stringByAppendingPathComponent:@"/AppleInternal/Library/Health/Plugins"];
    v4[0] = v1;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)_pluginDirectoryPaths
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = -[HDPluginManager _pluginsDirectoryPath](self);
  id v5 = [v3 arrayWithObject:v4];

  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall])
  {
    v6 = -[HDPluginManager _internalPluginsDirectoryPaths]((uint64_t)self);
    [v5 addObjectsFromArray:v6];
  }

  return v5;
}

- (NSArray)allowablePluginDirectoryPaths
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = -[HDPluginManager _pluginsDirectoryPath](self);
  [v3 addObject:v4];

  id v5 = -[HDPluginManager _internalPluginsDirectoryPaths]((uint64_t)self);
  [v3 addObjectsFromArray:v5];

  v6 = [(id)GSSystemRootDirectory() stringByAppendingPathComponent:*MEMORY[0x1E4F2A308]];
  [v3 addObject:v6];

  return (NSArray *)v3;
}

- (id)_pluginClasses
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(HDPluginManager *)self _builtInPluginClasses];
  id v51 = v3;
  [v3 addObjectsFromArray:v4];

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = [(HDPluginManager *)self _pluginDirectoryPaths];
  uint64_t v53 = [obj countByEnumeratingWithState:&v67 objects:v80 count:16];
  if (v53)
  {
    id v5 = (os_log_t *)MEMORY[0x1E4F29F28];
    uint64_t v52 = *(void *)v68;
    unint64_t v6 = 0x1E4F28000uLL;
    v50 = self;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v68 != v52) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v67 + 1) + 8 * v7);
        uint64_t v9 = (void *)MEMORY[0x1C187C0E0]();
        if (self)
        {
          *(void *)buf = &unk_1F17FE3E0;
          v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
        }
        else
        {
          v10 = 0;
        }
        id v66 = 0;
        id v62 = v10;
        id v11 = v8;
        if (self)
        {
          id v12 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
          objc_super v13 = [v12 contentsOfDirectoryAtPath:v11 error:&v66];
          if (v13)
          {
            id v55 = v12;
            v56 = v9;
            uint64_t v57 = v7;
            id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v71 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            v54 = v13;
            id v63 = v13;
            uint64_t v65 = [v63 countByEnumeratingWithState:&v71 objects:v81 count:16];
            if (v65)
            {
              uint64_t v14 = *(void *)v72;
              id v58 = v11;
              uint64_t v61 = *(void *)v72;
              do
              {
                uint64_t v15 = 0;
                do
                {
                  if (*(void *)v72 != v14) {
                    objc_enumerationMutation(v63);
                  }
                  v16 = *(void **)(*((void *)&v71 + 1) + 8 * v15);
                  v17 = (void *)MEMORY[0x1C187C0E0]();
                  v18 = [v16 pathExtension];
                  int v19 = [v18 isEqualToString:@"bundle"];

                  if (v19)
                  {
                    v20 = [v11 stringByAppendingPathComponent:v16];
                    id v21 = v62;
                    id v22 = v20;
                    v23 = (void *)[objc_alloc(*(Class *)(v6 + 2896)) initWithPath:v22];
                    if (v23)
                    {
                      char v24 = [MEMORY[0x1E4F2B860] processHasLoadedUIKit];
                      id v79 = 0;
                      char v25 = [v23 loadAndReturnError:&v79];
                      id v64 = v79;
                      if (v25)
                      {
                        if ((v24 & 1) == 0)
                        {
                          if ([MEMORY[0x1E4F2B860] processHasLoadedUIKit])
                          {
                            _HKInitializeLogging();
                            v26 = *v5;
                            if (os_log_type_enabled(*v5, OS_LOG_TYPE_FAULT))
                            {
                              *(_DWORD *)buf = 138543362;
                              *(void *)&buf[4] = v22;
                              _os_log_fault_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_FAULT, "**** IMPROPER LOADING OF UIKIT BY HEALTHD PLUGIN *** (%{public}@)", buf, 0xCu);
                            }
                          }
                        }
                        v60 = v21;
                        v27 = (void *)[v23 principalClass];
                        if (!v27)
                        {
                          _HKInitializeLogging();
                          v28 = *v5;
                          if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138543362;
                            *(void *)&buf[4] = v22;
                            _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "Error: failed to get principal class from bundle \"%{public}@\"", buf, 0xCu);
                          }
                        }
                        v29 = v5;
                        long long v77 = 0u;
                        long long v78 = 0u;
                        long long v75 = 0u;
                        long long v76 = 0u;
                        id v30 = v60;
                        uint64_t v31 = [v30 countByEnumeratingWithState:&v75 objects:buf count:16];
                        if (v31)
                        {
                          uint64_t v32 = v31;
                          uint64_t v33 = *(void *)v76;
                          while (2)
                          {
                            for (uint64_t i = 0; i != v32; ++i)
                            {
                              if (*(void *)v76 != v33) {
                                objc_enumerationMutation(v30);
                              }
                              if ([v27 conformsToProtocol:*(void *)(*((void *)&v75 + 1) + 8 * i)])
                              {
                                _HKInitializeLogging();
                                id v5 = v29;
                                v39 = *v29;
                                if (os_log_type_enabled(*v29, OS_LOG_TYPE_DEBUG))
                                {
                                  *(_DWORD *)v82 = 138543362;
                                  id v83 = v22;
                                  _os_log_debug_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_DEBUG, "Loaded bundle \"%{public}@\"", v82, 0xCu);
                                }
                                id v36 = v27;

                                unint64_t v6 = 0x1E4F28000;
                                id v11 = v58;
                                id v21 = v60;
                                goto LABEL_45;
                              }
                            }
                            uint64_t v32 = [v30 countByEnumeratingWithState:&v75 objects:buf count:16];
                            if (v32) {
                              continue;
                            }
                            break;
                          }
                        }

                        _HKInitializeLogging();
                        id v5 = v29;
                        v35 = *v29;
                        id v21 = v60;
                        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                        {
                          v41 = @"<>";
                          if (v27)
                          {
                            NSStringFromClass((Class)v27);
                            v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
                          }
                          v42 = objc_msgSend(v30, "hk_map:", &__block_literal_global_140);
                          *(_DWORD *)v82 = 138543874;
                          id v83 = v22;
                          __int16 v84 = 2114;
                          v85 = v41;
                          __int16 v86 = 2114;
                          v87 = v42;
                          _os_log_error_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_ERROR, "Error: failed to load bundle \"%{public}@\": principal class %{public}@ doesn't conform to any of: %{public}@", v82, 0x20u);
                          if (v27) {
                        }
                          }
                        id v36 = 0;
                        unint64_t v6 = 0x1E4F28000;
                      }
                      else
                      {
                        _HKInitializeLogging();
                        v38 = *v5;
                        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138543618;
                          *(void *)&buf[4] = v22;
                          __int16 v89 = 2114;
                          id v90 = v64;
                          _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "Error: failed to load bundle \"%{public}@\": %{public}@", buf, 0x16u);
                        }
                        id v36 = 0;
                      }
                      id v11 = v58;
LABEL_45:
                    }
                    else
                    {
                      _HKInitializeLogging();
                      v37 = *v5;
                      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543362;
                        *(void *)&buf[4] = v22;
                        _os_log_error_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_ERROR, "Error: failed to instantiate bundle \"%{public}@\"", buf, 0xCu);
                      }
                      id v36 = 0;
                    }

                    id v40 = v36;
                    if (v40) {
                      [v59 addObject:v40];
                    }

                    uint64_t v14 = v61;
                  }
                  ++v15;
                }
                while (v15 != v65);
                uint64_t v43 = [v63 countByEnumeratingWithState:&v71 objects:v81 count:16];
                uint64_t v65 = v43;
              }
              while (v43);
            }

            self = v50;
            uint64_t v9 = v56;
            uint64_t v7 = v57;
            v44 = v59;
            objc_super v13 = v54;
            id v12 = v55;
          }
          else
          {
            v44 = 0;
          }
        }
        else
        {
          v44 = 0;
        }

        id v45 = v66;
        if (v44)
        {
          [v51 addObjectsFromArray:v44];
        }
        else if ((objc_msgSend(v45, "hk_isCocoaNoSuchFileError") & 1) == 0)
        {
          _HKInitializeLogging();
          v46 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v11;
            __int16 v89 = 2114;
            id v90 = v45;
            _os_log_error_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_ERROR, "Failed to load plugins at \"%{public}@\": %{public}@", buf, 0x16u);
          }
        }

        ++v7;
      }
      while (v7 != v53);
      uint64_t v47 = [obj countByEnumeratingWithState:&v67 objects:v80 count:16];
      uint64_t v53 = v47;
    }
    while (v47);
  }

  return v51;
}

- (id)_createPluginsFromClasses:(id)a3
{
  id v4 = a3;
  id v5 = [(HDPluginManager *)self daemon];
  unint64_t v6 = &unk_1F17FE3E0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__HDPluginManager__createPluginsFromClasses___block_invoke;
  v11[3] = &unk_1E6303AF8;
  id v13 = v5;
  uint64_t v14 = sel_shouldLoadPluginForDaemon_;
  id v12 = v6;
  id v7 = v5;
  id v8 = v6;
  uint64_t v9 = objc_msgSend(v4, "hk_map:", v11);

  return v9;
}

id __45__HDPluginManager__createPluginsFromClasses___block_invoke(uint64_t a1, objc_class *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(objc_class *)a2 conformsToProtocol:*(void *)(a1 + 32)])
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([(objc_class *)a2 shouldLoadPluginForDaemon:*(void *)(a1 + 40)] & 1) != 0)
    {
      id v4 = objc_alloc_init(a2);
      goto LABEL_8;
    }
    _HKInitializeLogging();
    id v5 = (void *)*MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v6 = v5;
      id v7 = NSStringFromClass(a2);
      int v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "Will NOT load %@", (uint8_t *)&v9, 0xCu);
    }
  }
  id v4 = 0;
LABEL_8:

  return v4;
}

- (id)createExtensionsForDaemon:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v6 = self->_plugins;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "extensionForHealthDaemon:", v4, (void)v15);
        if (v12)
        {
          id v13 = [v11 pluginIdentifier];
          [v5 setObject:v12 forKeyedSubscript:v13];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)createExtensionsForProfile:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v6 = self->_plugins;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "extensionForProfile:", v4, (void)v15);
        if (v12)
        {
          id v13 = [v11 pluginIdentifier];
          [v5 setObject:v12 forKeyedSubscript:v13];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)notifyPluginsOfDatabaseObliteration
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_plugins;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "handleDatabaseObliteration", (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)pluginsConformingToProtocol:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_plugins)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"HDPluginManager.m" lineNumber:155 description:@"Plugins not loaded when looking up plugins for protocol. Plugins should have been loaded during init; what happened?"];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = self->_plugins;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "conformsToProtocol:", v5, (void)v16))
        {
          uint64_t v13 = [v12 pluginIdentifier];
          [v6 setObject:v12 forKeyedSubscript:v13];
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

NSString *__77__HDPluginManager__loadPrincipalClassConformingToProtocols_fromBundleAtPath___block_invoke(int a1, Protocol *proto)
{
  return NSStringFromProtocol(proto);
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);

  return (HDDaemon *)WeakRetained;
}

- (void)setDaemon:(id)a3
{
}

- (void)setAllowablePluginDirectoryPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowablePluginDirectoryPaths, 0);
  objc_destroyWeak((id *)&self->_daemon);

  objc_storeStrong((id *)&self->_plugins, 0);
}

- (NSArray)notificationInstructionCriteriaClasses
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  uint64_t v4 = (void *)[v3 mutableCopy];
  id v5 = [(HDPluginManager *)self pluginsConformingToProtocol:&unk_1F18A87C8];
  id v6 = [v5 allValues];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "notificationInstructionCriteriaClasses", (void)v15);
        [v4 addObjectsFromArray:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  uint64_t v13 = (void *)[v4 copy];

  return (NSArray *)v13;
}

@end