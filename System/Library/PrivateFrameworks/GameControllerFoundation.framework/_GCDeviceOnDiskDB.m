@interface _GCDeviceOnDiskDB
- (NSArray)configurationBundles;
- (_GCDeviceOnDiskDB)init;
- (_GCDeviceOnDiskDB)initWithBundles:(id)a3;
- (id)bestModelMatchingDevice:(id)a3;
@end

@implementation _GCDeviceOnDiskDB

- (_GCDeviceOnDiskDB)initWithBundles:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCDeviceOnDiskDB.m", 24, @"Invalid parameter not satisfying: %s", "configurationBundles != nil");
  }
  v13.receiver = self;
  v13.super_class = (Class)_GCDeviceOnDiskDB;
  v6 = [(_GCDeviceOnDiskDB *)&v13 init];
  uint64_t v7 = [v5 copy];
  configurationBundles = v6->_configurationBundles;
  v6->_configurationBundles = (NSArray *)v7;

  uint64_t v9 = objc_msgSend(v5, "gc_arrayByTransformingElementsWithOptions:usingBlock:", 1, &__block_literal_global_8);
  bundles = v6->_bundles;
  v6->_bundles = (NSArray *)v9;

  return v6;
}

- (_GCDeviceOnDiskDB)init
{
  return [(_GCDeviceOnDiskDB *)self initWithBundles:&__NSArray0__struct];
}

- (id)bestModelMatchingDevice:(id)a3
{
  id v4 = a3;
  id v5 = _gc_log_devicedb();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_GCDeviceOnDiskDB bestModelMatchingDevice:].cold.7(v4, v5);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  obj = self->_bundles;
  uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v60 objects:v69 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v61;
    uint64_t v38 = *(void *)v61;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v61 != v7) {
          objc_enumerationMutation(obj);
        }
        v39 = *(void **)(*((void *)&v60 + 1) + 8 * v8);
        uint64_t v9 = _gc_log_devicedb();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v66 = v39;
          _os_log_debug_impl(&dword_20AD04000, v9, OS_LOG_TYPE_DEBUG, "  > Searching bundle '%{public}@'...", buf, 0xCu);
        }

        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v43 = [v39 devices];
        uint64_t v10 = [v43 countByEnumeratingWithState:&v56 objects:v68 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v57;
          uint64_t v42 = *(void *)v57;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v57 != v11) {
                objc_enumerationMutation(v43);
              }
              v41 = *(void **)(*((void *)&v56 + 1) + 8 * v12);
              objc_super v13 = _gc_log_devicedb();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                v66 = v41;
                _os_log_debug_impl(&dword_20AD04000, v13, OS_LOG_TYPE_DEBUG, "    > Trying '%{public}@'...", buf, 0xCu);
              }

              v14 = [v41 ioMatchingPredicates];
              long long v54 = 0u;
              long long v55 = 0u;
              long long v52 = 0u;
              long long v53 = 0u;
              id v15 = v14;
              uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v67 count:16];
              if (v16)
              {
                uint64_t v17 = *(void *)v53;
                while (2)
                {
                  for (uint64_t i = 0; i != v16; ++i)
                  {
                    if (*(void *)v53 != v17) {
                      objc_enumerationMutation(v15);
                    }
                    if ([*(id *)(*((void *)&v52 + 1) + 8 * i) evaluateWithObject:v4])
                    {

                      v24 = _gc_log_devicedb();
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
                        -[_GCDeviceOnDiskDB bestModelMatchingDevice:].cold.6((uint64_t)v41, v24);
                      }

                      long long v50 = 0u;
                      long long v51 = 0u;
                      long long v48 = 0u;
                      long long v49 = 0u;
                      v25 = [v41 personalities];
                      uint64_t v26 = [v25 countByEnumeratingWithState:&v48 objects:v64 count:16];
                      if (v26)
                      {
                        uint64_t v27 = *(void *)v49;
                        while (2)
                        {
                          uint64_t v28 = 0;
                          do
                          {
                            if (*(void *)v49 != v27) {
                              objc_enumerationMutation(v25);
                            }
                            v29 = *(void **)(*((void *)&v48 + 1) + 8 * v28);
                            v30 = _gc_log_devicedb();
                            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                            {
                              *(_DWORD *)buf = 138543362;
                              v66 = v29;
                              _os_log_debug_impl(&dword_20AD04000, v30, OS_LOG_TYPE_DEBUG, "      > Trying %{public}@...", buf, 0xCu);
                            }

                            v31 = [v29 ioMatchingPredicate];
                            if (!v31) {
                              goto LABEL_51;
                            }
                            v32 = _gc_log_devicedb();
                            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
                              [(_GCDeviceOnDiskDB *)&v46 bestModelMatchingDevice:v32];
                            }

                            if ([v31 evaluateWithObject:v4])
                            {
LABEL_51:
                              v34 = _gc_log_devicedb();
                              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
                                [(_GCDeviceOnDiskDB *)v34 bestModelMatchingDevice:v36];
                              }

                              v23 = [v29 model];

                              goto LABEL_54;
                            }
                            v33 = _gc_log_devicedb();
                            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
                              [(_GCDeviceOnDiskDB *)&v44 bestModelMatchingDevice:v33];
                            }

                            ++v28;
                          }
                          while (v26 != v28);
                          uint64_t v26 = [v25 countByEnumeratingWithState:&v48 objects:v64 count:16];
                          if (v26) {
                            continue;
                          }
                          break;
                        }
                      }

                      v25 = _gc_log_devicedb();
                      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
                        -[_GCDeviceOnDiskDB bestModelMatchingDevice:]();
                      }
                      v23 = 0;
LABEL_54:

                      v20 = obj;
                      goto LABEL_56;
                    }
                  }
                  uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v67 count:16];
                  if (v16) {
                    continue;
                  }
                  break;
                }
              }

              ++v12;
              uint64_t v11 = v42;
            }
            while (v12 != v10);
            uint64_t v10 = [v43 countByEnumeratingWithState:&v56 objects:v68 count:16];
            uint64_t v11 = v42;
          }
          while (v10);
        }

        ++v8;
        uint64_t v7 = v38;
      }
      while (v8 != v6);
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v60 objects:v69 count:16];
      uint64_t v7 = v38;
    }
    while (v6);
  }

  v19 = _gc_log_devicedb();
  v20 = (NSArray *)v19;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    [(_GCDeviceOnDiskDB *)v19 bestModelMatchingDevice:v22];
    v23 = 0;
    v20 = (NSArray *)v19;
  }
  else
  {
    v23 = 0;
  }
LABEL_56:

  return v23;
}

- (NSArray)configurationBundles
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundles, 0);

  objc_storeStrong((id *)&self->_configurationBundles, 0);
}

- (void)bestModelMatchingDevice:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_2_1(&dword_20AD04000, a1, a3, "  > No device definition found.", v3);
}

- (void)bestModelMatchingDevice:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_20AD04000, v0, v1, "📦 Found matching device definition %{public}@ in bundle '%{public}@', but did not find a compatible personality.");
}

- (void)bestModelMatchingDevice:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_2_1(&dword_20AD04000, a1, a3, "      > Passed all requirements.", v3);
}

- (void)bestModelMatchingDevice:(NSObject *)a3 .cold.4(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_2_1(&dword_20AD04000, a3, (uint64_t)a3, "        > Failed IO property requirements...", a1);
}

- (void)bestModelMatchingDevice:(NSObject *)a3 .cold.5(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_2_1(&dword_20AD04000, a3, (uint64_t)a3, "        > Checking IO property requirements...", a1);
}

- (void)bestModelMatchingDevice:(uint64_t)a1 .cold.6(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_20AD04000, a2, OS_LOG_TYPE_DEBUG, "    > Matched %{public}@.  Checking personalities...", (uint8_t *)&v2, 0xCu);
}

- (void)bestModelMatchingDevice:(void *)a1 .cold.7(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 debugDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_20AD04000, a2, OS_LOG_TYPE_DEBUG, "Find model for device %@", (uint8_t *)&v4, 0xCu);
}

@end