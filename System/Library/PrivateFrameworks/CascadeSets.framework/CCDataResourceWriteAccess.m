@interface CCDataResourceWriteAccess
+ (id)defaultInstance;
- (BOOL)performMaintenanceActivity:(id)a3 accessAssertion:(id)a4;
- (CCDataResourceWriteAccess)initWithContainerOverride:(id)a3;
- (id)_resolveContainer:(id)a3;
- (id)requestAccess:(id *)a3 forResource:(id)a4 withMode:(unint64_t)a5 error:(id *)a6;
- (id)setWriterForSet:(id)a3 accessAssertion:(id)a4;
@end

@implementation CCDataResourceWriteAccess

- (id)setWriterForSet:(id)a3 accessAssertion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CCDataResourceWriteAccess *)self _resolveContainer:v6];
  v9 = +[CCDataResource dataResourceForSet:v7 inContainer:v8];

  v10 = [[CCDataResourceWriter alloc] initWithDataResource:v9 accessAssertion:v6];

  return v10;
}

- (id)_resolveContainer:(id)a3
{
  p_containerOverride = (uint64_t *)&self->_containerOverride;
  if (self->_containerOverride)
  {
    v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[CCDataResourceWriteAccess _resolveContainer:](p_containerOverride, v4);
    }

    id v5 = (id)*p_containerOverride;
  }
  else
  {
    id v5 = [a3 container];
  }

  return v5;
}

- (id)requestAccess:(id *)a3 forResource:(id)a4 withMode:(unint64_t)a5 error:(id *)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v10 = a4;
  if (self->_containerOverride)
  {
    v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      containerOverride = self->_containerOverride;
      int v19 = 138412290;
      v20 = containerOverride;
      _os_log_impl(&dword_249B92000, v11, OS_LOG_TYPE_INFO, "Skipping access request with container override: %@", (uint8_t *)&v19, 0xCu);
    }

    v13 = self->_containerOverride;
  }
  else
  {
    id v14 = objc_alloc(MEMORY[0x263F29E48]);
    v15 = (void *)[v14 initWithUseCase:*MEMORY[0x263F29E40]];
    v16 = [v15 requestAccessToResource:v10 mode:a5 error:a6];
    v17 = v16;
    if (v16)
    {
      if (a3) {
        *a3 = v16;
      }
      v13 = [v17 container];
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

+ (id)defaultInstance
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContainerOverride:0];

  return v2;
}

- (CCDataResourceWriteAccess)initWithContainerOverride:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCDataResourceWriteAccess;
  id v6 = [(CCDataResourceWriteAccess *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_containerOverride, a3);
  }

  return v7;
}

- (BOOL)performMaintenanceActivity:(id)a3 accessAssertion:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(CCDataResourceWriteAccess *)self _resolveContainer:v7];
  objc_super v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_249B92000, v9, OS_LOG_TYPE_DEFAULT, "Starting maintenance at container: %@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__8;
  v47 = __Block_byref_object_dispose__8;
  id v48 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__8;
  v34 = __Block_byref_object_dispose__8;
  id v35 = (id)objc_opt_new();
  id v29 = 0;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  v22 = __72__CCDataResourceWriteAccess_performMaintenanceActivity_accessAssertion___block_invoke;
  v23 = &unk_26527AA08;
  v26 = &v30;
  id v10 = v7;
  id v24 = v10;
  id v11 = v6;
  id v25 = v11;
  v27 = &v36;
  p_long long buf = &buf;
  BOOL v12 = +[CCDataResource enumerateDataResources:&v29 setIdentifier:0 descriptors:0 container:v8 includingTombstoned:1 usingBlock:&v20];
  id v13 = v29;
  BOOL v14 = v12 && *((unsigned char *)v37 + 24) == 0;
  BOOL v15 = +[CCDataResourceWriter purgeTombstonedResources:](CCDataResourceWriter, "purgeTombstonedResources:", v31[5], v20, v21, v22, v23);
  v16 = __biome_log_for_category();
  int v17 = v14 && v15;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = @"aborted";
    if (v17) {
      v18 = @"completed";
    }
    *(_DWORD *)v40 = 138412546;
    v41 = v18;
    __int16 v42 = 2112;
    id v43 = v13;
    _os_log_impl(&dword_249B92000, v16, OS_LOG_TYPE_DEFAULT, "Maintenance for all resources finished with status: %@, error: %@", v40, 0x16u);
  }

  if (v17) {
    +[CCSetMetrics computeAndReportMetricsForAllSets:*(void *)(*((void *)&buf + 1) + 40) shouldDefer:v11];
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v36, 8);
  return v17;
}

void __72__CCDataResourceWriteAccess_performMaintenanceActivity_accessAssertion___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  unsigned int v6 = [(CCDataResourceWriter *)v5 resourceStatus];
  switch(v6)
  {
    case 0u:
    case 2u:
    case 3u:
      __biome_log_for_category();
      id v7 = (CCDataResourceWriter *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
      {
        v8 = CCDataResourceStatusToString(v6);
        *(_DWORD *)long long buf = 138412546;
        BOOL v15 = v5;
        __int16 v16 = 2112;
        int v17 = v8;
        _os_log_impl(&dword_249B92000, &v7->super, OS_LOG_TYPE_DEFAULT, "Skipping maintenance for resource: %@ with status: %@", buf, 0x16u);
      }
      goto LABEL_15;
    case 1u:
      id v7 = [[CCDataResourceWriter alloc] initWithDataResource:v5 accessAssertion:a1[4]];
      id v13 = 0;
      BOOL v9 = [(CCDataResourceWriter *)v7 performMaintenance:&v13 shouldDefer:a1[5]];
      id v10 = v13;
      id v11 = __biome_log_for_category();
      BOOL v12 = v11;
      if (v9)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          BOOL v15 = v7;
          _os_log_impl(&dword_249B92000, v12, OS_LOG_TYPE_DEFAULT, "Completed maintenance for resource (%@)", buf, 0xCu);
        }

        if (v10) {
          [*(id *)(*(void *)(a1[8] + 8) + 40) addObject:v10];
        }
      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __72__CCDataResourceWriteAccess_performMaintenanceActivity_accessAssertion___block_invoke_cold_1((uint64_t)v7, v12);
        }

        *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
        *a3 = 1;
      }

      goto LABEL_15;
    case 4u:
      [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v5];
      __biome_log_for_category();
      id v7 = (CCDataResourceWriter *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        BOOL v15 = v5;
        _os_log_impl(&dword_249B92000, &v7->super, OS_LOG_TYPE_DEFAULT, "Resource: %@ is in state deleting, will purge", buf, 0xCu);
      }
LABEL_15:

      break;
    default:
      break;
  }
}

- (void).cxx_destruct
{
}

- (void)_resolveContainer:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_249B92000, a2, OS_LOG_TYPE_DEBUG, "Using overridden container: %@", (uint8_t *)&v3, 0xCu);
}

void __72__CCDataResourceWriteAccess_performMaintenanceActivity_accessAssertion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "Aborted maintenance for resource: %@", (uint8_t *)&v2, 0xCu);
}

@end