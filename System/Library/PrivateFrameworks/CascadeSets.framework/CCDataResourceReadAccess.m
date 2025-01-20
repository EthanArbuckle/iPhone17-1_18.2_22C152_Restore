@interface CCDataResourceReadAccess
+ (id)defaultInstanceWithUseCase:(id)a3;
- (BOOL)_enumerateReadableSets:(id *)a3 resourceOptions:(unsigned __int8)a4 itemType:(unsigned __int16)a5 usingBlock:(id)a6;
- (BOOL)_shouldSkipAccessRequestForResource:(id)a3;
- (BOOL)enumerateReadableSets:(id *)a3 withOptions:(unsigned __int16)a4 itemType:(unsigned __int16)a5 usingBlock:(id)a6;
- (CCDataResourceReadAccess)initWithContainerOverride:(id)a3 useCase:(id)a4;
- (id)_requestAccessToResource:(id)a3 outAccessAssertion:(id *)a4 error:(id *)a5;
- (id)_requestAccessToSetsDirectoryWithOptions:(unsigned __int8)a3 outAccessAssertion:(id *)a4 error:(id *)a5;
- (id)databaseReadAccessForSet:(id)a3;
- (id)localDeviceIdForSet:(id)a3;
@end

@implementation CCDataResourceReadAccess

+ (id)defaultInstanceWithUseCase:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContainerOverride:0 useCase:v3];

  return v4;
}

- (CCDataResourceReadAccess)initWithContainerOverride:(id)a3 useCase:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CCDataResourceReadAccess;
  v9 = [(CCDataResourceReadAccess *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_containerOverride, a3);
    objc_storeStrong((id *)&v10->_useCase, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x263F29E48]) initWithUseCase:v8];
    accessClient = v10->_accessClient;
    v10->_accessClient = (BMAccessClient *)v11;
  }
  return v10;
}

- (id)databaseReadAccessForSet:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 toResourceSpecifier];
  id v19 = 0;
  v6 = [(CCDataResourceReadAccess *)self _requestAccessToResource:v5 outAccessAssertion:&v19 error:0];
  id v7 = v19;
  if (!v6)
  {
    uint64_t v11 = 0;
    goto LABEL_17;
  }
  id v8 = +[CCDataResource dataResourceForSet:v4 inContainer:v6];
  v9 = v8;
  if (v8)
  {
    if (!CCDataResourceStatusIsNotDiscoverable([v8 resourceStatus]))
    {
      v10 = [v9 databaseURL];
      v12 = [MEMORY[0x263F08850] defaultManager];
      v13 = [v10 path];
      int v14 = [v12 fileExistsAtPath:v13];

      if (v14)
      {
        v15 = +[CCDatabaseReader readerForDatabaseAtURL:v10 accessAssertion:v7];
      }
      else
      {
        v16 = __biome_log_for_category();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = [v10 path];
          *(_DWORD *)buf = 138412546;
          v21 = v9;
          __int16 v22 = 2112;
          v23 = v17;
          _os_log_impl(&dword_249B92000, v16, OS_LOG_TYPE_DEFAULT, "(%@) Database has not been created at path: %@", buf, 0x16u);
        }
        v15 = objc_alloc_init(CCDatabaseEmptyAccess);
      }
      uint64_t v11 = v15;
      goto LABEL_16;
    }
    v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CCDataResourceReadAccess databaseReadAccessForSet:]((uint64_t)v4, v10);
    }
  }
  else
  {
    v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CCDataResourceReadAccess databaseReadAccessForSet:]();
    }
  }
  uint64_t v11 = 0;
LABEL_16:

LABEL_17:

  return v11;
}

- (BOOL)enumerateReadableSets:(id *)a3 withOptions:(unsigned __int16)a4 itemType:(unsigned __int16)a5 usingBlock:(id)a6
{
  return [(CCDataResourceReadAccess *)self _enumerateReadableSets:a3 resourceOptions:0 itemType:a5 usingBlock:a6];
}

- (BOOL)_enumerateReadableSets:(id *)a3 resourceOptions:(unsigned __int8)a4 itemType:(unsigned __int16)a5 usingBlock:(id)a6
{
  uint64_t v6 = a5;
  unsigned int v36 = a4;
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v35 = a6;
  if ((unsigned __int16)CCTypeIdentifierUnknown == v6)
  {
    id v7 = 0;
  }
  else
  {
    id v8 = CCTypeIdentifierRegistryBridge();
    id v7 = [v8 setIdentifierForItemType:v6];

    if (!v7)
    {
      v26 = CCInvalidSetItemTypeIdentifierErrorForIdentifier(v6);
      CCSetError(a3, v26);

      char v39 = 0;
      goto LABEL_40;
    }
  }
  v32 = v7;
  v33 = [MEMORY[0x263F29E80] current];
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  char v63 = 0;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  uint64_t v61 = 0;
  if (([v33 hasDatavaultEntitlement] & 1) != 0 || objc_msgSend(v33, "processType") == 3)
  {
    id v57 = 0;
    id obj = [(CCDataResourceReadAccess *)self _requestAccessToSetsDirectoryWithOptions:v36 outAccessAssertion:&v57 error:a3];
    id v31 = v57;
    if (obj)
    {
      id v56 = 0;
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __87__CCDataResourceReadAccess__enumerateReadableSets_resourceOptions_itemType_usingBlock___block_invoke;
      v52[3] = &unk_26527A740;
      id v53 = v35;
      v54 = v62;
      v55 = &v58;
      char v39 = +[CCDataResource enumerateDataResources:&v56 setIdentifier:v7 descriptors:0 container:obj includingTombstoned:0 usingBlock:v52];
      id v9 = v56;
      v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = v59[3];
        if (v39)
        {
          v12 = @"Success";
        }
        else
        {
          v12 = [NSString stringWithFormat:@"Failure, error: %@", v9];
        }
        *(_DWORD *)buf = 134218242;
        uint64_t v66 = v11;
        __int16 v67 = 2112;
        v68 = v12;
        _os_log_impl(&dword_249B92000, v10, OS_LOG_TYPE_DEFAULT, "Enumerated %lu readable sets for datavault-entitled process with result: %@", buf, 0x16u);
        if ((v39 & 1) == 0) {
      }
        }
      if (v9) {
        CCSetError(a3, v9);
      }
    }
    else
    {
      id v9 = 0;
      char v39 = 0;
    }
  }
  else
  {
    id v31 = [MEMORY[0x263F29E58] policyForProcess:v33 connectionFlags:0 useCase:self->_useCase];
    v13 = [v31 explicitlyAuthorizedResourcesOfType:4 withAccessMode:1];
    if (v7)
    {
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __87__CCDataResourceReadAccess__enumerateReadableSets_resourceOptions_itemType_usingBlock___block_invoke_12;
      v50[3] = &unk_26527A768;
      id v51 = v7;
      uint64_t v14 = [v13 objectsPassingTest:v50];

      v13 = (void *)v14;
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v46 objects:v64 count:16];
    id obj = v15;
    id v9 = 0;
    if (v16)
    {
      uint64_t v17 = *(void *)v47;
      char v39 = 1;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v47 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          id v20 = objc_alloc(MEMORY[0x263F29E98]);
          v21 = (void *)[v20 initWithType:4 name:v19 descriptors:MEMORY[0x263EFFA68] options:v36];
          id v45 = 0;
          __int16 v22 = [(CCDataResourceReadAccess *)self _requestAccessToResource:v21 outAccessAssertion:&v45 error:a3];
          id v23 = v45;
          if (v22)
          {
            id v44 = v9;
            v40[0] = MEMORY[0x263EF8330];
            v40[1] = 3221225472;
            v40[2] = __87__CCDataResourceReadAccess__enumerateReadableSets_resourceOptions_itemType_usingBlock___block_invoke_2;
            v40[3] = &unk_26527A740;
            id v41 = v35;
            v42 = v62;
            v43 = &v58;
            BOOL v24 = +[CCDataResource enumerateDataResources:&v44 setIdentifier:v19 descriptors:0 container:v22 includingTombstoned:0 usingBlock:v40];
            id v25 = v44;

            v39 &= v24;
            id v9 = v25;
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v46 objects:v64 count:16];
      }
      while (v16);
    }
    else
    {
      char v39 = 1;
    }

    v27 = __biome_log_for_category();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = v59[3];
      if (v39)
      {
        v29 = @"Success";
      }
      else
      {
        v29 = [NSString stringWithFormat:@"Failure, error: %@", v9];
      }
      *(_DWORD *)buf = 134218242;
      uint64_t v66 = v28;
      __int16 v67 = 2112;
      v68 = v29;
      _os_log_impl(&dword_249B92000, v27, OS_LOG_TYPE_DEFAULT, "Enumerated %lu readable sets for sets-entitled process with result: %@", buf, 0x16u);
      if ((v39 & 1) == 0) {
    }
      }
    if (v9) {
      CCSetError(a3, v9);
    }
  }

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(v62, 8);

LABEL_40:
  return v39 & 1;
}

void __87__CCDataResourceReadAccess__enumerateReadableSets_resourceOptions_itemType_usingBlock___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v8 = 0;
  v5 = [a2 setWithError:&v8];
  id v6 = v8;
  id v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      (*(void (**)(void))(a1[4] + 16))();
      ++*(void *)(*(void *)(a1[6] + 8) + 24);
      if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
        *a3 = 1;
      }
    }
  }
}

uint64_t __87__CCDataResourceReadAccess__enumerateReadableSets_resourceOptions_itemType_usingBlock___block_invoke_12(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*(void *)(a1 + 32)];
}

void __87__CCDataResourceReadAccess__enumerateReadableSets_resourceOptions_itemType_usingBlock___block_invoke_2(void *a1, void *a2, unsigned char *a3)
{
  id v8 = 0;
  v5 = [a2 setWithError:&v8];
  id v6 = v8;
  id v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      (*(void (**)(void))(a1[4] + 16))();
      ++*(void *)(*(void *)(a1[6] + 8) + 24);
      if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
        *a3 = 1;
      }
    }
  }
}

- (id)localDeviceIdForSet:(id)a3
{
  id v4 = a3;
  v5 = [(CCDataResourceReadAccess *)self databaseReadAccessForSet:v4];
  if (v5)
  {
    id v6 = [[CCDatabaseSetStateReader alloc] initWithDatabaseAccess:v5];
    id v11 = 0;
    id v7 = [(CCDatabaseSetStateReader *)v6 localDeviceIdentifier:&v11];
    id v8 = v11;
    if (!v7)
    {
      id v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CCDataResourceReadAccess localDeviceIdForSet:]();
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_requestAccessToResource:(id)a3 outAccessAssertion:(id *)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = (BMResourceContainer *)a3;
  if (self->_containerOverride)
  {
    id v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      containerOverride = self->_containerOverride;
      *(_DWORD *)buf = 138412290;
      __int16 v22 = containerOverride;
      _os_log_impl(&dword_249B92000, v9, OS_LOG_TYPE_INFO, "Skipping read only access request with container override: %@", buf, 0xCu);
    }

    id v11 = self->_containerOverride;
  }
  else if ([(CCDataResourceReadAccess *)self _shouldSkipAccessRequestForResource:v8])
  {
    id v11 = 0;
  }
  else
  {
    accessClient = self->_accessClient;
    id v20 = 0;
    v13 = [(BMAccessClient *)accessClient requestAccessToResource:v8 mode:1 error:&v20];
    id v14 = v20;
    id v15 = __biome_log_for_category();
    uint64_t v16 = v15;
    if (!v13 || v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        useCase = self->_useCase;
        *(_DWORD *)buf = 138412802;
        __int16 v22 = v8;
        __int16 v23 = 2112;
        BOOL v24 = useCase;
        __int16 v25 = 2112;
        id v26 = v14;
        _os_log_error_impl(&dword_249B92000, v16, OS_LOG_TYPE_ERROR, "[BiomeAccess] CCDataResourceReadAccess could not obtain access assertion for %@ using useCase: %@ with error: %@", buf, 0x20u);
      }

      CCSetError(a5, v14);
      id v11 = 0;
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = self->_useCase;
        *(_DWORD *)buf = 138412546;
        __int16 v22 = v8;
        __int16 v23 = 2112;
        BOOL v24 = v17;
        _os_log_impl(&dword_249B92000, v16, OS_LOG_TYPE_DEFAULT, "[BiomeAccess] CCDataResourceReadAccess obtained access assertion for %@ using useCase: %@", buf, 0x16u);
      }

      if (a4) {
        *a4 = v13;
      }
      id v11 = [v13 container];
    }
  }

  return v11;
}

- (id)_requestAccessToSetsDirectoryWithOptions:(unsigned __int8)a3 outAccessAssertion:(id *)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (self->_containerOverride)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      containerOverride = self->_containerOverride;
      *(_DWORD *)buf = 138412290;
      __int16 v25 = containerOverride;
      _os_log_impl(&dword_249B92000, v6, OS_LOG_TYPE_INFO, "Skipping access request with container override: %@", buf, 0xCu);
    }

    id v8 = self->_containerOverride;
  }
  else
  {
    uint64_t v11 = a3;
    id v12 = objc_alloc(MEMORY[0x263F29E98]);
    v13 = (void *)[v12 initWithType:5 name:*MEMORY[0x263F29E10] descriptors:MEMORY[0x263EFFA68] options:v11];
    accessClient = self->_accessClient;
    id v23 = 0;
    id v15 = [(BMAccessClient *)accessClient requestAccessToResource:v13 mode:1 error:&v23];
    id v16 = v23;
    uint64_t v17 = __biome_log_for_category();
    v18 = v17;
    if (v15) {
      BOOL v19 = v16 == 0;
    }
    else {
      BOOL v19 = 0;
    }
    if (v19)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        useCase = self->_useCase;
        v21 = [v15 container];
        *(_DWORD *)buf = 138412546;
        __int16 v25 = useCase;
        __int16 v26 = 2112;
        uint64_t v27 = v21;
        _os_log_impl(&dword_249B92000, v18, OS_LOG_TYPE_DEFAULT, "[BiomeAccess] CCDataResourceReadAccess obtained access assertion for sets directory using useCase: %@ container: %@", buf, 0x16u);
      }
      if (a4) {
        *a4 = v15;
      }
      id v8 = [v15 container];
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[CCDataResourceReadAccess _requestAccessToSetsDirectoryWithOptions:outAccessAssertion:error:]((uint64_t)self, (uint64_t)v16, v18);
      }

      CCSetError(a5, v16);
      id v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_shouldSkipAccessRequestForResource:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([MEMORY[0x263F29E78] currentPersonaIsDefault]
    && ([v3 name],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = BMServiceDomainOverrideLookupFromConfigurationForSet(),
        v4,
        v5 != 1))
  {
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [MEMORY[0x263F29E78] currentPersonaIdentifierLoggingDescription];
      int v10 = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_249B92000, v7, OS_LOG_TYPE_DEFAULT, "Skipping access request for user-domain resource: %@ as persona: %@", (uint8_t *)&v10, 0x16u);
    }
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerOverride, 0);
  objc_storeStrong((id *)&self->_accessClient, 0);

  objc_storeStrong((id *)&self->_useCase, 0);
}

- (void)databaseReadAccessForSet:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_249B92000, v0, v1, "Failed to resolve resource for set: %@ in container: %@");
}

- (void)databaseReadAccessForSet:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "Attempting to obtain read access on a tombstoned set: %@", (uint8_t *)&v2, 0xCu);
}

- (void)localDeviceIdForSet:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_249B92000, v0, v1, "Failed to resolve localDeviceIdentifier for set: %@ error: %@");
}

- (void)_requestAccessToSetsDirectoryWithOptions:(uint64_t)a1 outAccessAssertion:(uint64_t)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 8);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_249B92000, a2, a3, "[BiomeAccess] CCDataResourceReadAccess could not obtain access assertion for sets directory using useCase: %@ with error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end