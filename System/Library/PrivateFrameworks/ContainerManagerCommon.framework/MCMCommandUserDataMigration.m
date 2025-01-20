@interface MCMCommandUserDataMigration
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)_bundleContainerExistsForDataContainer:(id)a3 error:(id *)a4;
- (BOOL)preflightClientAllowed;
- (int)_intendedDataProtectionClassBasedOnEntitlementsForIdentifier:(id)a3;
- (void)_setDataProtectionIfNecessaryOnContainer:(id)a3;
- (void)execute;
@end

@implementation MCMCommandUserDataMigration

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 30;
}

- (BOOL)_bundleContainerExistsForDataContainer:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v46 = 1;
  if ([v6 containerClass] == 2)
  {
    id v7 = containermanager_copy_global_configuration();
    int v8 = [v7 dispositionForContainerClass:1];

    if (v8 == 2)
    {
      container_query_create();
      container_query_set_class();
      id v9 = [v6 identifier];
      xpc_object_t v10 = xpc_string_create((const char *)[v9 UTF8String]);
      container_query_set_identifiers();

      uint64_t count_results = container_query_count_results();
      BOOL v12 = count_results > 0;
      if (count_results < 0) {
        v13 = [[MCMError alloc] initWithLibsystemError:container_query_get_last_error()];
      }
      else {
        v13 = 0;
      }
      container_query_free();
      goto LABEL_41;
    }
    v21 = [(MCMCommand *)self context];
    v22 = [v21 globalConfiguration];
    v23 = [v22 staticConfig];
    v16 = [v23 configForContainerClass:1];

    v24 = [v6 userIdentity];
    v25 = [v6 identifier];
    v26 = [(MCMCommand *)self context];
    v27 = [v26 userIdentityCache];
    v28 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v24 identifier:v25 containerConfig:v16 platform:0 userIdentityCache:v27 error:&v46];

    if (v28)
    {
      id v45 = 0;
      v29 = [(id)gContainerCache entryForContainerIdentity:v28 error:&v45];
      v30 = (MCMError *)v45;
      v13 = v30;
      if (v29)
      {
        BOOL v12 = 1;
LABEL_39:

        goto LABEL_40;
      }
      if (v30 && [(MCMError *)v30 type] == 21)
      {

        v29 = 0;
        v13 = 0;
      }
      else
      {
        v29 = 0;
      }
    }
    else
    {
      v32 = [MCMError alloc];
      v13 = [(MCMError *)v32 initWithErrorType:v46];
      v29 = container_log_handle_for_category();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v33 = [v6 identifier];
        *(_DWORD *)buf = 138412546;
        uint64_t v48 = (uint64_t)v33;
        __int16 v49 = 2112;
        v50 = v13;
        _os_log_error_impl(&dword_1D7739000, v29, OS_LOG_TYPE_ERROR, "Could not create container identity from [%@]: %@", buf, 0x16u);
      }
    }
    BOOL v12 = 0;
    goto LABEL_39;
  }
  if ([v6 containerClass] == 4)
  {
    v14 = [(id)gCodeSigningMapping childParentMapCache];
    v15 = [v6 identifier];
    v16 = [v14 parentIdentifierForChildIdentifier:v15];

    if (!v16)
    {
      v13 = 0;
      BOOL v12 = 0;
LABEL_40:

      goto LABEL_41;
    }
    id v17 = containermanager_copy_global_configuration();
    int v18 = [v17 dispositionForContainerClass:1];

    if (v18 == 2)
    {
      container_query_create();
      container_query_set_class();
      xpc_object_t v19 = xpc_string_create((const char *)[v16 UTF8String]);
      container_query_set_identifiers();

      uint64_t v20 = container_query_count_results();
      BOOL v12 = v20 > 0;
      if (v20 < 0) {
        v13 = [[MCMError alloc] initWithLibsystemError:container_query_get_last_error()];
      }
      else {
        v13 = 0;
      }
      container_query_free();
      goto LABEL_40;
    }
    v34 = [(MCMCommand *)self context];
    v35 = [v34 globalConfiguration];
    v36 = [v35 staticConfig];
    v28 = [v36 configForContainerClass:1];

    v37 = [v6 userIdentity];
    v38 = [(MCMCommand *)self context];
    v39 = [v38 userIdentityCache];
    v29 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v37 identifier:v16 containerConfig:v28 platform:0 userIdentityCache:v39 error:&v46];

    if (v29)
    {
      id v44 = 0;
      v40 = [(id)gContainerCache entryForContainerIdentity:v29 error:&v44];
      v41 = (MCMError *)v44;
      v13 = v41;
      if (v40)
      {
        BOOL v12 = 1;
LABEL_38:

        goto LABEL_39;
      }
      if (v41 && [(MCMError *)v41 type] == 21)
      {

        v40 = 0;
        v13 = 0;
      }
      else
      {
        v40 = 0;
      }
    }
    else
    {
      v42 = [MCMError alloc];
      v13 = [(MCMError *)v42 initWithErrorType:v46];
      v40 = container_log_handle_for_category();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v48 = (uint64_t)v16;
        __int16 v49 = 2112;
        v50 = v13;
        _os_log_error_impl(&dword_1D7739000, v40, OS_LOG_TYPE_ERROR, "Could not create container identity from [%@]: %@", buf, 0x16u);
      }
    }
    BOOL v12 = 0;
    goto LABEL_38;
  }
  v13 = [[MCMError alloc] initWithErrorType:20];
  v31 = container_log_handle_for_category();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v48 = [v6 containerClass];
    _os_log_error_impl(&dword_1D7739000, v31, OS_LOG_TYPE_ERROR, "Passed an unexpected container type: %llu", buf, 0xCu);
  }

  BOOL v12 = 0;
LABEL_41:
  if (a4 && v13) {
    *a4 = v13;
  }

  return v12;
}

- (int)_intendedDataProtectionClassBasedOnEntitlementsForIdentifier:(id)a3
{
  v3 = [(id)gCodeSigningMapping entitlementsForIdentifier:a3];
  v4 = v3;
  if (v3) {
    int v5 = [v3 intendedDataProtectionClass];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (void)_setDataProtectionIfNecessaryOnContainer:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 containerPath];
  id v6 = [v5 containerClassPath];
  int v7 = [v6 supportsDataProtection];

  if (v7)
  {
    id v21 = 0;
    BOOL v8 = [(MCMCommandUserDataMigration *)self _bundleContainerExistsForDataContainer:v4 error:&v21];
    id v9 = v21;
    xpc_object_t v10 = [v4 identifier];
    if (v9)
    {
      v11 = container_log_handle_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v10;
        __int16 v24 = 2112;
        id v25 = v9;
        _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "Error looking up bundle container for %@ : %@", buf, 0x16u);
      }
    }
    else
    {
      if (v8)
      {
LABEL_8:

        goto LABEL_9;
      }
      uint64_t v12 = [(MCMCommandUserDataMigration *)self _intendedDataProtectionClassBasedOnEntitlementsForIdentifier:v10];
      v13 = [MCMResultPromise alloc];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __72__MCMCommandUserDataMigration__setDataProtectionIfNecessaryOnContainer___block_invoke;
      v19[3] = &unk_1E6A7F860;
      uint64_t v20 = v10;
      v14 = [(MCMResultPromise *)v13 initWithCompletion:v19];
      v15 = [MCMCommandSetDataProtection alloc];
      v16 = [v4 containerIdentity];
      id v17 = [(MCMCommand *)self context];
      int v18 = [(MCMCommandSetDataProtection *)v15 initWithContainerIdentity:v16 thirdParty:0 dataProtectionClass:v12 retryIfLocked:0 skipIfUnchanged:1 context:v17 resultPromise:v14];

      [(MCMCommandSetDataProtection *)v18 execute];
      v11 = v20;
    }

    goto LABEL_8;
  }
LABEL_9:
}

id __72__MCMCommandUserDataMigration__setDataProtectionIfNecessaryOnContainer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    int v5 = container_log_handle_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      BOOL v8 = [v3 error];
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "Error processing restored system container %@: %@", (uint8_t *)&v9, 0x16u);
    }
  }

  return v3;
}

- (void)execute
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D9478DF0](self, a2);
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__2311;
  v82 = __Block_byref_object_dispose__2312;
  id v83 = 0;
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__2311;
  v76 = __Block_byref_object_dispose__2312;
  id v77 = 0;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  char v71 = 1;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x2020000000;
  char v67 = 1;
  v2 = container_log_handle_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [(MCMCommand *)self context];
    id v4 = [v3 clientIdentity];
    id v5 = containermanager_copy_global_configuration();
    id v6 = [v5 defaultUser];
    *(_DWORD *)buf = 138412546;
    *(void *)v85 = v4;
    *(_WORD *)&v85[8] = 2112;
    *(void *)&v85[10] = v6;
    _os_log_impl(&dword_1D7739000, v2, OS_LOG_TYPE_DEFAULT, "Container data migration requested by %@ for default user: %@", buf, 0x16u);
  }
  uint64_t v7 = (void *)gCodeSigningMapping;
  BOOL v8 = [(MCMCommand *)self context];
  [v7 performAllCodeSigningMigrationAndReconciliationWithContext:v8];

  id v55 = [[MCMMigrationStatus alloc] initForMobileUserMigration];
  if (([v55 hasMigrationOccurredForType:@"SubdirectoryMigration"] & 1) == 0)
  {
    int v9 = [(MCMCommand *)self context];
    uint64_t v10 = [v9 userIdentityCache];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __38__MCMCommandUserDataMigration_execute__block_invoke;
    v63[3] = &unk_1E6A7F810;
    v63[4] = self;
    v63[5] = &v78;
    v63[6] = &v68;
    v63[7] = &v72;
    [v10 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v63];

    if (*((unsigned char *)v69 + 24)) {
      [v55 setMigrationCompleteForType:@"SubdirectoryMigration"];
    }
  }
  __int16 v11 = (void *)v73[5];
  v73[5] = 0;

  uint64_t v12 = [(MCMCommand *)self context];
  uint64_t v13 = [v12 userIdentityCache];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __38__MCMCommandUserDataMigration_execute__block_invoke_15;
  v62[3] = &unk_1E6A7F9C8;
  v62[4] = self;
  v62[5] = &v78;
  v62[6] = &v64;
  [v13 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v62];

  v14 = (void *)v73[5];
  v73[5] = 0;

  uint64_t v61 = 1;
  v56 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(&unk_1F2F10F68, "count"));
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  uint64_t v15 = [&unk_1F2F10F68 countByEnumeratingWithState:&v91 objects:v90 count:16];
  if (v15)
  {
    uint64_t v57 = *(void *)v92;
    do
    {
      uint64_t v58 = v15;
      for (uint64_t i = 0; i != v58; ++i)
      {
        if (*(void *)v92 != v57) {
          objc_enumerationMutation(&unk_1F2F10F68);
        }
        uint64_t v17 = *(void *)(*((void *)&v91 + 1) + 8 * i);
        int v18 = objc_msgSend(&unk_1F2F10F68, "objectForKeyedSubscript:", v17, context);
        uint64_t v19 = [v18 unsignedLongLongValue];

        uint64_t v61 = 1;
        uint64_t v20 = [(MCMCommand *)self context];
        id v21 = [v20 globalConfiguration];
        v22 = [v21 staticConfig];
        v23 = [v22 configForContainerClass:v19];

        __int16 v24 = [(MCMCommand *)self context];
        id v25 = [v24 userIdentityCache];
        uint64_t v26 = [(MCMCommand *)self context];
        v27 = [v26 clientIdentity];
        v28 = [v27 posixUser];
        v29 = [v25 userIdentityForPersonalPersonaWithPOSIXUser:v28];

        v30 = [(MCMCommand *)self context];
        v31 = [v30 userIdentityCache];
        v32 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v29 identifier:v17 containerConfig:v23 platform:0 userIdentityCache:v31 error:&v61];

        if (v32)
        {
          v33 = (id *)(v79 + 5);
          id obj = (id)v79[5];
          v34 = [(id)gContainerCache entryForContainerIdentity:v32 error:&obj];
          objc_storeStrong(v33, obj);
          v35 = [v34 metadataMinimal];
          if (v35)
          {
            [v56 addObject:v32];
          }
          else
          {
            if ([(id)v79[5] type] == 21)
            {
              v38 = v79[5];
              v79[5] = 0;
            }
            else
            {
              v38 = container_log_handle_for_category();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                uint64_t v39 = v79[5];
                *(_DWORD *)buf = 134218498;
                *(void *)v85 = v19;
                *(_WORD *)&v85[8] = 2112;
                *(void *)&v85[10] = v17;
                __int16 v86 = 2112;
                uint64_t v87 = v39;
                _os_log_error_impl(&dword_1D7739000, v38, OS_LOG_TYPE_ERROR, "Failed lookup when trying to remove deprecated [%llu:%@]: %@", buf, 0x20u);
              }
            }
          }
        }
        else
        {
          v34 = container_log_handle_for_category();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            uint64_t v36 = v61;
            uint64_t error_description = container_get_error_description();
            *(_DWORD *)buf = 134218754;
            *(void *)v85 = v19;
            *(_WORD *)&v85[8] = 2112;
            *(void *)&v85[10] = v17;
            __int16 v86 = 2048;
            uint64_t v87 = v36;
            __int16 v88 = 2080;
            uint64_t v89 = error_description;
            _os_log_error_impl(&dword_1D7739000, v34, OS_LOG_TYPE_ERROR, "Could not create container identity when trying to remove deprecated [%llu:%@]: (%llu) %s", buf, 0x2Au);
          }
        }
      }
      uint64_t v15 = [&unk_1F2F10F68 countByEnumeratingWithState:&v91 objects:v90 count:16];
    }
    while (v15);
  }
  if (objc_msgSend(v56, "count", context))
  {
    v40 = objc_alloc_init(MCMResultPromise);
    v41 = (void *)[v56 copy];
    v42 = [(MCMCommand *)self context];
    v43 = +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:v41 removeAllCodeSignInfo:1 context:v42 resultPromise:v40];

    [v43 execute];
    id v44 = [(MCMResultPromise *)v40 result];
    id v45 = [v44 error];

    if (v45)
    {
      uint64_t v46 = container_log_handle_for_category();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v85 = v45;
        _os_log_error_impl(&dword_1D7739000, v46, OS_LOG_TYPE_ERROR, "Failed to destroy container(s) during user data migration; error = %@",
          buf,
          0xCu);
      }
    }
  }
  if (*((unsigned char *)v69 + 24)) {
    int v47 = *((unsigned __int8 *)v65 + 24);
  }
  else {
    int v47 = 0;
  }
  uint64_t v48 = container_log_handle_for_category();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v49 = v79[5];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v85 = v47;
    *(_WORD *)&v85[4] = 2112;
    *(void *)&v85[6] = v49;
    _os_log_impl(&dword_1D7739000, v48, OS_LOG_TYPE_DEFAULT, "Per user data migration result: %d, error = %@", buf, 0x12u);
  }

  v50 = [MCMResultBase alloc];
  uint64_t v51 = [(MCMResultBase *)v50 initWithError:v79[5]];
  v52 = [(MCMCommand *)self resultPromise];
  [v52 completeWithResult:v51];

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);

  _Block_object_dispose(&v78, 8);
}

void __38__MCMCommandUserDataMigration_execute__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) context];
  id v5 = [v4 userIdentityCache];
  id v6 = +[MCMCommandContext privilegedWithUserIdentity:v3 userIdentityCache:v5];

  uint64_t v7 = container_log_handle_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = +[MCMMigrationStatus currentBuildVersion];
    *(_DWORD *)buf = 138412546;
    id v23 = v3;
    __int16 v24 = 2112;
    uint64_t v25 = (uint64_t)v8;
    _os_log_impl(&dword_1D7739000, v7, OS_LOG_TYPE_DEFAULT, "Performing Per User Subdirectory Migration for %@ on %@", buf, 0x16u);
  }
  int v9 = [*(id *)(a1 + 32) context];
  uint64_t v10 = [v9 classIterator];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __38__MCMCommandUserDataMigration_execute__block_invoke_3;
  v17[3] = &unk_1E6A7F7E8;
  id v11 = v6;
  id v18 = v11;
  id v12 = v3;
  id v19 = v12;
  long long v20 = *(_OWORD *)(a1 + 40);
  uint64_t v21 = *(void *)(a1 + 56);
  [v10 selectUserWithIterator:v17];

  uint64_t v13 = container_log_handle_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = +[MCMMigrationStatus currentBuildVersion];
    uint64_t v15 = (void *)v14;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      int v16 = 89;
    }
    else {
      int v16 = 78;
    }
    *(_DWORD *)buf = 138412802;
    id v23 = v12;
    __int16 v24 = 2112;
    uint64_t v25 = v14;
    __int16 v26 = 1024;
    int v27 = v16;
    _os_log_impl(&dword_1D7739000, v13, OS_LOG_TYPE_DEFAULT, "Completed Per User Subdirectory Migration for %@ on %@ : Success: %c", buf, 0x1Cu);
  }
}

void __38__MCMCommandUserDataMigration_execute__block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = container_log_handle_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = +[MCMMigrationStatus currentBuildVersion];
    *(_DWORD *)buf = 138412546;
    id v21 = v3;
    __int16 v22 = 2112;
    uint64_t v23 = (uint64_t)v5;
    _os_log_impl(&dword_1D7739000, v4, OS_LOG_TYPE_DEFAULT, "Performing User Data Protection Migration for %@ on %@", buf, 0x16u);
  }
  id v6 = [*(id *)(a1 + 32) context];
  uint64_t v7 = [v6 classIterator];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __38__MCMCommandUserDataMigration_execute__block_invoke_16;
  int v16 = &unk_1E6A7F838;
  uint64_t v17 = *(void *)(a1 + 32);
  id v8 = v3;
  id v18 = v8;
  long long v19 = *(_OWORD *)(a1 + 40);
  [v7 selectDataProtectedWithIterator:&v13];

  int v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = +[MCMMigrationStatus currentBuildVersion];
    id v11 = (void *)v10;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      int v12 = 89;
    }
    else {
      int v12 = 78;
    }
    *(_DWORD *)buf = 138412802;
    id v21 = v8;
    __int16 v22 = 2112;
    uint64_t v23 = v10;
    __int16 v24 = 1024;
    int v25 = v12;
    _os_log_impl(&dword_1D7739000, v9, OS_LOG_TYPE_DEFAULT, "Completed User Data Protection Migration for %@ on %@ : Success: %c", buf, 0x1Cu);
  }
}

void __38__MCMCommandUserDataMigration_execute__block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) context];
  id v5 = [v4 containerCache];
  id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
  uint64_t v7 = [v3 containerClass];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = [v5 entriesForUserIdentities:v6 contentClass:v7 transient:0 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);

  if (v9)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
          int v16 = (void *)MEMORY[0x1D9478DF0]();
          uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
          id v23 = *(id *)(v17 + 40);
          id v18 = [v15 metadataWithError:&v23];
          objc_storeStrong((id *)(v17 + 40), v23);
          if (v18) {
            [*(id *)(a1 + 32) _setDataProtectionIfNecessaryOnContainer:v18];
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v25 count:16];
      }
      while (v12);
    }
  }
  else
  {
    long long v19 = container_log_handle_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      uint64_t v21 = [v3 containerClass];
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v31 = v20;
      __int16 v32 = 2048;
      uint64_t v33 = v21;
      __int16 v34 = 2112;
      uint64_t v35 = v22;
      _os_log_error_impl(&dword_1D7739000, v19, OS_LOG_TYPE_ERROR, "Failed to fetch list of data containers for userIdentity: %@, class: %ld: %@", buf, 0x20u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

void __38__MCMCommandUserDataMigration_execute__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) containerCache];
  id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
  v30 = v3;
  uint64_t v6 = [v3 containerClass];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = [v4 entriesForUserIdentities:v5 contentClass:v6 transient:0 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);

  if (v8)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v28 = v8;
    id v29 = v8;
    uint64_t v9 = [v29 countByEnumeratingWithState:&v38 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v39;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v39 != v11) {
            objc_enumerationMutation(v29);
          }
          uint64_t v13 = *(void **)(*((void *)&v38 + 1) + 8 * v12);
          uint64_t v14 = (void *)MEMORY[0x1D9478DF0]();
          uint64_t v15 = [v13 metadataMinimal];
          int v16 = objc_alloc_init(MCMResultPromise);
          uint64_t v17 = [MCMCommandRecreateContainerStructure alloc];
          id v18 = [v15 containerIdentity];
          long long v19 = [(MCMCommandRecreateContainerStructure *)v17 initWithConcreteContainerIdentity:v18 context:*(void *)(a1 + 32) resultPromise:v16];

          [(MCMCommandRecreateContainerStructure *)v19 execute];
          uint64_t v20 = [(MCMResultPromise *)v16 result];
          uint64_t v21 = [v20 error];

          if (v21)
          {
            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v31[2] = __38__MCMCommandUserDataMigration_execute__block_invoke_7;
            v31[3] = &unk_1E6A7F7C0;
            id v32 = v15;
            id v33 = v30;
            __int16 v34 = v16;
            uint64_t v35 = 1;
            uint64_t v22 = __38__MCMCommandUserDataMigration_execute__block_invoke_7((uint64_t)v31);
            uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
            __int16 v24 = *(void **)(v23 + 40);
            *(void *)(v23 + 40) = v22;

            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v29 countByEnumeratingWithState:&v38 objects:v37 count:16];
      }
      while (v10);
    }

    uint64_t v8 = v28;
  }
  else
  {
    int v25 = container_log_handle_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = *(void *)(a1 + 40);
      uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v43 = v26;
      __int16 v44 = 2048;
      uint64_t v45 = 0;
      __int16 v46 = 2112;
      uint64_t v47 = v27;
      _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "Failed to fetch list of containers for userIdentity: %@, class %ld : %@", buf, 0x20u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

id __38__MCMCommandUserDataMigration_execute__block_invoke_7(uint64_t a1)
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  id v3 = [*(id *)(a1 + 32) userIdentity];
  uint64_t v4 = [*(id *)(a1 + 40) containerClass];
  id v5 = [*(id *)(a1 + 32) identifier];
  uint64_t v6 = [*(id *)(a1 + 48) result];
  uint64_t v7 = [v6 error];
  uint64_t v8 = (void *)[v2 initWithFormat:@"Failed to recreate container directory structure for %@:%ld:%@ : %@", v3, v4, v5, v7];

  v17[0] = @"FunctionName";
  uint64_t v9 = [NSString stringWithUTF8String:"-[MCMCommandUserDataMigration execute]_block_invoke"];
  v18[0] = v9;
  v18[1] = &unk_1F2F119A8;
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v17[1] = @"SourceFileLine";
  v17[2] = v10;
  v18[2] = v8;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];

  uint64_t v12 = container_log_handle_for_category();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v16 = v8;
    _os_log_error_impl(&dword_1D7739000, v12, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:*(void *)(a1 + 56) userInfo:v11];

  return v13;
}

- (BOOL)preflightClientAllowed
{
  id v2 = [(MCMCommand *)self context];
  id v3 = [v2 clientIdentity];
  char v4 = [v3 isAllowedToStartUserDataMigration];

  return v4;
}

@end