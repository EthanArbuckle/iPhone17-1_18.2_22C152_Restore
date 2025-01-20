@interface _GCDeviceConfigurationEvaluator
- (NSDictionary)deviceManagersIN;
- (NSDictionary)deviceOwnersOUT;
- (NSDictionary)physicalDevicesIN;
- (NSSet)configurationsIN;
- (NSSet)viableConfigurationsOUT;
- (unint64_t)viableConfigurations:(id *)a3 deviceOwners:(id *)a4;
- (void)evaluate;
- (void)setConfigurationsIN:(id)a3;
- (void)setDeviceManagersIN:(id)a3;
- (void)setPhysicalDevicesIN:(id)a3;
@end

@implementation _GCDeviceConfigurationEvaluator

- (unint64_t)viableConfigurations:(id *)a3 deviceOwners:(id *)a4
{
  v5 = [(_GCDeviceConfigurationEvaluator *)self configurationsIN];
  v6 = [v5 allObjects];

  v75 = self;
  v78 = [(_GCDeviceConfigurationEvaluator *)self physicalDevicesIN];
  v7 = _gc_log_device_configuration();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_GCDeviceConfigurationEvaluator viableConfigurations:deviceOwners:].cold.8();
  }

  v8 = _gc_log_device_configuration();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_GCDeviceConfigurationEvaluator viableConfigurations:deviceOwners:].cold.7(v78, v8);
  }

  id v74 = (id)objc_msgSend(objc_alloc((Class)&off_26BEEB1B8), "initWithCapacity:", objc_msgSend(v6, "count"));
  v9 = _gc_log_device_configuration();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[_GCDeviceConfigurationEvaluator viableConfigurations:deviceOwners:].cold.6();
  }

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  obuint64_t j = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v93 objects:v104 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v76 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v94 != v76) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v93 + 1) + 8 * i);
        v14 = [(_GCDeviceConfigurationEvaluator *)v75 deviceManagersIN];
        v15 = [v13 deviceBuilderIdentifier];
        v16 = [v14 objectForKey:v15];

        if (v16)
        {
          v17 = [v13 deviceDependencies];
          v18 = objc_msgSend(objc_alloc((Class)&off_26BEEB428), "initWithCapacity:", objc_msgSend(v17, "count"));
          long long v89 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          v19 = v17;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v89 objects:v103 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v90;
LABEL_15:
            uint64_t v23 = 0;
            while (1)
            {
              if (*(void *)v90 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = [v78 objectForKey:*(void *)(*((void *)&v89 + 1) + 8 * v23)];
              if (!v24) {
                break;
              }
              v25 = (void *)v24;
              [v18 addObject:v24];

              if (v21 == ++v23)
              {
                uint64_t v21 = [v19 countByEnumeratingWithState:&v89 objects:v103 count:16];
                if (v21) {
                  goto LABEL_15;
                }
                break;
              }
            }
          }

          uint64_t v26 = [v19 count];
          if (v26 == [v18 count])
          {
            [v74 addObject:v13];
          }
          else
          {
            v27 = _gc_log_device_configuration();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v98 = v13;
              _os_log_debug_impl(&dword_20AD04000, v27, OS_LOG_TYPE_DEBUG, "Eliminating configuration because a dependency is missing: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          v19 = _gc_log_device_configuration();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v98 = v13;
            _os_log_debug_impl(&dword_20AD04000, v19, OS_LOG_TYPE_DEBUG, "Eliminating configuration because its manager is not registered: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v93 objects:v104 count:16];
    }
    while (v11);
  }

  [v74 sortUsingComparator:&__block_literal_global_0];
  v28 = _gc_log_device_configuration();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    -[_GCDeviceConfigurationEvaluator viableConfigurations:deviceOwners:].cold.5();
  }

  v29 = objc_msgSend(objc_alloc((Class)&off_26BEEE5A8), "initWithCapacity:", objc_msgSend(v74, "count"));
  v30 = _gc_log_device_configuration();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
    -[_GCDeviceConfigurationEvaluator viableConfigurations:deviceOwners:].cold.4();
  }

  uint64_t v31 = [v74 count];
  if (!v31) {
    goto LABEL_73;
  }
  do
  {
    uint64_t v71 = v31;
    [v29 removeAllObjects];
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v32 = [v78 allKeys];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v85 objects:v102 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v86;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v86 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v37 = *(void *)(*((void *)&v85 + 1) + 8 * j);
          v38 = +[NSNull null];
          [v29 setObject:v38 forKey:v37];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v85 objects:v102 count:16];
      }
      while (v34);
    }

    v39 = v74;
    if (![v74 count]) {
      goto LABEL_72;
    }
    uint64_t v40 = 0;
    while (1)
    {
      v41 = [v39 objectAtIndexedSubscript:v40];
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      v77 = v41;
      v42 = [v41 deviceDependencies];
      uint64_t v43 = [v42 countByEnumeratingWithState:&v81 objects:v101 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v72 = v40;
        uint64_t v45 = *(void *)v82;
        while (2)
        {
          for (uint64_t k = 0; k != v44; ++k)
          {
            if (*(void *)v82 != v45) {
              objc_enumerationMutation(v42);
            }
            v47 = *(void **)(*((void *)&v81 + 1) + 8 * k);
            v48 = [v29 objectForKey:v47];
            v49 = +[NSNull null];
            char v50 = [v48 isEqual:v49];

            if ((v50 & 1) == 0)
            {
              v52 = _gc_log_device_configuration();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v98 = v47;
                __int16 v99 = 2112;
                v100 = v77;
                _os_log_debug_impl(&dword_20AD04000, v52, OS_LOG_TYPE_DEBUG, "Eliminating configuration because device dependency with identifier '%@' has already been claimed: %@", buf, 0x16u);
              }

              int v51 = 0;
              goto LABEL_57;
            }
            [v29 setObject:v77 forKey:v47];
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v81 objects:v101 count:16];
          if (v44) {
            continue;
          }
          break;
        }
        int v51 = 1;
LABEL_57:
        uint64_t v40 = v72;
      }
      else
      {
        int v51 = 1;
      }

      v53 = [(_GCDeviceConfigurationEvaluator *)v75 deviceManagersIN];
      v54 = [v77 deviceBuilderIdentifier];
      v55 = [v53 objectForKey:v54];

      if (v55)
      {
        if (!v51) {
          goto LABEL_71;
        }
      }
      else
      {
        v60 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
        objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, v75, @"_GCDeviceConfigurationEvaluator.m", 128, @"Bug in %s", "-[_GCDeviceConfigurationEvaluator viableConfigurations:deviceOwners:]");

        if (!v51) {
          goto LABEL_71;
        }
      }
      v39 = v74;
      if (objc_opt_respondsToSelector()) {
        break;
      }
LABEL_64:

      if (++v40 >= (unint64_t)[v74 count]) {
        goto LABEL_72;
      }
    }
    v56 = [v77 deviceDependencies];
    v57 = +[NSNull null];
    v58 = [v78 objectsForKeys:v56 notFoundMarker:v57];

    v59 = +[NSSet setWithArray:v58];
    LODWORD(v57) = [v55 canMakeDeviceWithConfiguration:v77 dependencies:v59];

    if (v57)
    {

      goto LABEL_64;
    }
    v61 = _gc_log_device_configuration();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v98 = v77;
      _os_log_debug_impl(&dword_20AD04000, v61, OS_LOG_TYPE_DEBUG, "Eliminating configuration because its manager can not make the device: %@", buf, 0xCu);
    }

LABEL_71:
    [v74 removeObjectAtIndex:v40];

LABEL_72:
    uint64_t v31 = v71 - 1;
  }
  while (v71 != 1);
LABEL_73:
  v62 = _gc_log_device_configuration();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
    -[_GCDeviceConfigurationEvaluator viableConfigurations:deviceOwners:]();
  }

  v63 = _gc_log_device_configuration();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
    -[_GCDeviceConfigurationEvaluator viableConfigurations:deviceOwners:](v74, v63);
  }

  [v74 enumerateObjectsUsingBlock:&__block_literal_global_13];
  v64 = _gc_log_device_configuration();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
    -[_GCDeviceConfigurationEvaluator viableConfigurations:deviceOwners:]();
  }

  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = __69___GCDeviceConfigurationEvaluator_viableConfigurations_deviceOwners___block_invoke_14;
  v79[3] = &unk_26BEC3BC8;
  id v80 = v78;
  id v65 = v78;
  [v29 enumerateKeysAndObjectsUsingBlock:v79];
  if (a3) {
    *a3 = v74;
  }
  if (a4) {
    *a4 = v29;
  }
  unint64_t v66 = [v74 count];

  return v66;
}

- (void)evaluate
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20AD04000, v0, v1, "+++ <Evaluate viable configurations> +++", v2, v3, v4, v5, v6);
}

- (NSSet)configurationsIN
{
  return self->_configurationsIN;
}

- (void)setConfigurationsIN:(id)a3
{
}

- (NSDictionary)deviceManagersIN
{
  return self->_deviceManagersIN;
}

- (void)setDeviceManagersIN:(id)a3
{
}

- (NSDictionary)physicalDevicesIN
{
  return self->_physicalDevicesIN;
}

- (void)setPhysicalDevicesIN:(id)a3
{
}

- (NSSet)viableConfigurationsOUT
{
  return self->_viableConfigurationsOUT;
}

- (NSDictionary)deviceOwnersOUT
{
  return self->_deviceOwnersOUT;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceOwnersOUT, 0);
  objc_storeStrong((id *)&self->_viableConfigurationsOUT, 0);
  objc_storeStrong((id *)&self->_physicalDevicesIN, 0);
  objc_storeStrong((id *)&self->_deviceManagersIN, 0);

  objc_storeStrong((id *)&self->_configurationsIN, 0);
}

- (void)viableConfigurations:deviceOwners:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20AD04000, v0, v1, "Devices:", v2, v3, v4, v5, v6);
}

- (void)viableConfigurations:(void *)a1 deviceOwners:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  [a1 count];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20AD04000, a2, v3, "Viable Configurations (%llu):", v4);
}

- (void)viableConfigurations:deviceOwners:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20AD04000, v0, v1, "> Results", v2, v3, v4, v5, v6);
}

- (void)viableConfigurations:deviceOwners:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20AD04000, v0, v1, "> Step (2)", v2, v3, v4, v5, v6);
}

- (void)viableConfigurations:deviceOwners:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20AD04000, v0, v1, "Viable Configurations: %@", v2);
}

- (void)viableConfigurations:deviceOwners:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20AD04000, v0, v1, "> Step (1)", v2, v3, v4, v5, v6);
}

- (void)viableConfigurations:(void *)a1 deviceOwners:(NSObject *)a2 .cold.7(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 allValues];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20AD04000, a2, v4, "Devices: %@", v5);
}

- (void)viableConfigurations:deviceOwners:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20AD04000, v0, v1, "Registered Configurations: %@", v2);
}

@end