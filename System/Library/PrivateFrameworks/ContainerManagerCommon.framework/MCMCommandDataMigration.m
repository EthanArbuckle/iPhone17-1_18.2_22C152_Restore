@interface MCMCommandDataMigration
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)_performBundleContainerOwnershipMigrationWithError:(id *)a3;
- (BOOL)_performInternalACLMigrationWithError:(id *)a3;
- (BOOL)preflightClientAllowed;
- (void)execute;
@end

@implementation MCMCommandDataMigration

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 24;
}

- (BOOL)_performInternalACLMigrationWithError:(id *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_new();
  v6 = [(MCMCommand *)self context];
  v7 = [v6 userIdentityCache];
  v8 = [v7 defaultUserIdentity];

  id v9 = containermanager_copy_global_configuration();
  v10 = [v9 staticConfig];
  v11 = [v10 configForContainerClass:12];

  id v12 = containermanager_copy_global_configuration();
  v13 = [v12 staticConfig];
  v14 = [v13 configForContainerClass:13];

  id v15 = containermanager_copy_global_configuration();
  LODWORD(v13) = [v15 systemContainerMode];

  if v13 != 1 || ([v5 hasMigrationOccurredForType:@"ACLMigration"])
  {
    v16 = 0;
    v17 = 0;
    v18 = 0;
    id v19 = 0;
LABEL_4:
    BOOL v20 = 1;
    goto LABEL_5;
  }
  id v22 = containermanager_copy_global_configuration();
  v23 = [v22 classPathCache];
  v24 = [v23 containerClassPathForUserIdentity:v8 containerConfig:v11 typeClass:objc_opt_class()];
  v17 = [v24 classURL];

  v25 = +[MCMFileManager defaultManager];
  LODWORD(v23) = [v25 itemExistsAtURL:v17];

  v39 = a3;
  if (!v23)
  {
    id v40 = 0;
    goto LABEL_12;
  }
  v26 = +[MCMFileManager defaultManager];
  id v42 = 0;
  char v27 = [v26 standardizeAllSystemContainerACLsAtURL:v17 error:&v42];
  id v40 = v42;

  if (v27)
  {
LABEL_12:
    v16 = 0;
    int v38 = 1;
    goto LABEL_13;
  }
  v28 = container_log_handle_for_category();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v40;
    _os_log_error_impl(&dword_1D7739000, v28, OS_LOG_TYPE_ERROR, "Failed to set ACLs on system containers : %@", buf, 0xCu);
  }

  v16 = [[MCMError alloc] initWithNSError:v40 url:v17 defaultErrorType:63];
  int v38 = 0;
LABEL_13:
  id v29 = containermanager_copy_global_configuration();
  v30 = [v29 classPathCache];
  v31 = [v30 containerClassPathForUserIdentity:v8 containerConfig:v14 typeClass:objc_opt_class()];
  v18 = [v31 classURL];

  v32 = +[MCMFileManager defaultManager];
  LODWORD(v31) = [v32 itemExistsAtURL:v18];

  if (v31)
  {
    v33 = +[MCMFileManager defaultManager];
    id v41 = v40;
    char v34 = [v33 standardizeAllSystemContainerACLsAtURL:v18 error:&v41];
    id v19 = v41;

    if ((v34 & 1) == 0)
    {
      v35 = container_log_handle_for_category();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v19;
        _os_log_error_impl(&dword_1D7739000, v35, OS_LOG_TYPE_ERROR, "Failed to set ACLs on system group containers : %@", buf, 0xCu);
      }

      v36 = [[MCMError alloc] initWithNSError:v19 url:v18 defaultErrorType:63];
      v16 = v36;
      v37 = v39;
      goto LABEL_21;
    }
  }
  else
  {
    id v19 = v40;
  }
  v37 = v39;
  if (v38)
  {
    [v5 setMigrationCompleteForType:@"ACLMigration"];
    goto LABEL_4;
  }
LABEL_21:
  if (v37)
  {
    v16 = v16;
    BOOL v20 = 0;
    void *v37 = v16;
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_5:

  return v20;
}

- (BOOL)_performBundleContainerOwnershipMigrationWithError:(id *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v4 = [(MCMCommand *)self context];
  v5 = [v4 userIdentityCache];
  v6 = [v5 defaultUserIdentity];

  id v7 = containermanager_copy_global_configuration();
  v8 = [v7 staticConfig];
  BOOL v9 = 1;
  v10 = [v8 configForContainerClass:1];

  id v11 = containermanager_copy_global_configuration();
  id v12 = [v11 classPathCache];
  v13 = [v12 containerClassPathForUserIdentity:v6 containerConfig:v10 typeClass:objc_opt_class()];

  v14 = objc_opt_new();
  id v15 = v14;
  if (v13)
  {
    if ([v14 hasMigrationOccurredForType:@"BundleMigration"])
    {
      v16 = 0;
      id v17 = 0;
LABEL_9:
      BOOL v9 = 1;
      goto LABEL_10;
    }
    v32 = a3;
    v18 = container_log_handle_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7739000, v18, OS_LOG_TYPE_DEFAULT, "Changing ownership of bundle container content.", buf, 2u);
    }

    id v19 = +[MCMFileManager defaultManager];
    BOOL v20 = [v13 categoryURL];
    id v21 = containermanager_copy_global_configuration();
    id v22 = [v21 bundleContainerOwner];
    id v33 = 0;
    char v23 = [v19 standardizeOwnershipAtURL:v20 toPOSIXUser:v22 error:&v33];
    id v17 = v33;

    if (v23)
    {
LABEL_8:
      objc_msgSend(v15, "setMigrationCompleteForType:", @"BundleMigration", v32);
      v16 = 0;
      goto LABEL_9;
    }
    v25 = [v17 domain];
    if ([v25 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v26 = [v17 code];

      if (v26 == 2) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    char v27 = [MCMError alloc];
    v28 = [v13 categoryURL];
    v16 = [(MCMError *)v27 initWithNSError:v17 url:v28 defaultErrorType:127];

    id v29 = container_log_handle_for_category();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = [v13 categoryURL];
      v31 = [v30 path];
      *(_DWORD *)buf = 138412546;
      v35 = v31;
      __int16 v36 = 2112;
      id v37 = v17;
      _os_log_error_impl(&dword_1D7739000, v29, OS_LOG_TYPE_ERROR, "Failed to change owner of %@: %@", buf, 0x16u);
    }
    if (v32)
    {
      v16 = v16;
      BOOL v9 = 0;
      id *v32 = v16;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    v16 = 0;
    id v17 = 0;
  }
LABEL_10:

  return v9;
}

- (void)execute
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  v4 = container_log_handle_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = +[MCMMigrationStatus currentBuildVersion];
    *(_DWORD *)buf = 138412290;
    id v21 = v5;
    _os_log_impl(&dword_1D7739000, v4, OS_LOG_TYPE_DEFAULT, "Performing Data Migration on %@", buf, 0xCu);
  }
  id v19 = 0;
  BOOL v6 = [(MCMCommandDataMigration *)self _performInternalACLMigrationWithError:&v19];
  id v7 = v19;
  if (!v6)
  {
    v8 = container_log_handle_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      _os_log_error_impl(&dword_1D7739000, v8, OS_LOG_TYPE_ERROR, "Failed to migrate ACLs on system containers : %@", buf, 0xCu);
    }
  }
  id v9 = containermanager_copy_global_configuration();
  int v10 = [v9 dispositionForContainerClass:1];

  if (v10 != 1)
  {
    id v12 = v7;
LABEL_13:
    if (v6) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  id v18 = v7;
  BOOL v11 = [(MCMCommandDataMigration *)self _performBundleContainerOwnershipMigrationWithError:&v18];
  id v12 = v18;

  if (v11) {
    goto LABEL_13;
  }
  v13 = container_log_handle_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v12;
    _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "Failed to migrate bundle containers to system location : %@", buf, 0xCu);
  }

LABEL_14:
  v14 = container_log_handle_for_category();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v12;
    _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Failed to perform data migration : %@", buf, 0xCu);
  }

LABEL_17:
  id v15 = container_log_handle_for_category();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v12;
    _os_log_impl(&dword_1D7739000, v15, OS_LOG_TYPE_DEFAULT, "System data migration; error = %@", buf, 0xCu);
  }

  v16 = [[MCMResultBase alloc] initWithError:v12];
  id v17 = [(MCMCommand *)self resultPromise];
  [v17 completeWithResult:v16];
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  v3 = [v2 clientIdentity];
  char v4 = [v3 isAllowedToStartDataMigration];

  return v4;
}

@end