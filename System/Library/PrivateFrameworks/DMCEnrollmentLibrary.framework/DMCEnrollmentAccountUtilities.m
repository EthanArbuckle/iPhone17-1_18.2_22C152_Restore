@interface DMCEnrollmentAccountUtilities
+ (void)removeOrphanedEnrollmentAccounts;
@end

@implementation DMCEnrollmentAccountUtilities

+ (void)removeOrphanedEnrollmentAccounts
{
  v2 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_DEFAULT, "DMCAccountUtilities: Searching for orphaned enrollment account...", v5, 2u);
  }
  v3 = [MEMORY[0x263EFB210] defaultStore];
  v4 = objc_msgSend(v3, "dmc_accountsWithPredicateBlock:", &__block_literal_global);
  objc_msgSend(v3, "dmc_removeAccounts:asynchronous:", v4, 0);
}

uint64_t __65__DMCEnrollmentAccountUtilities_removeOrphanedEnrollmentAccounts__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (objc_msgSend(v2, "dmc_isPrimaryAccount"))
  {
    uint64_t v3 = 0;
    goto LABEL_20;
  }
  uint64_t v4 = objc_msgSend(v2, "dmc_personaIdentifier");
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)MEMORY[0x263F38BB8];
    v7 = objc_msgSend(v2, "dmc_personaIdentifier");
    LOBYTE(v6) = [v6 personaWithUniqueIdentifierExists:v7];

    if ((v6 & 1) == 0)
    {
      v15 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        v17 = objc_msgSend(v2, "dmc_personaIdentifier");
        v18 = [v2 identifier];
        v19 = [v2 accountType];
        v20 = [v19 identifier];
        int v30 = 138543874;
        v31 = v17;
        __int16 v32 = 2114;
        v33 = v18;
        __int16 v34 = 2114;
        v35 = v20;
        v21 = "DMCAccountUtilities: Persona (%{public}@) for orphaned account (%{public}@, %{public}@) does not exist.";
LABEL_18:
        _os_log_impl(&dword_225D9B000, v16, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v30, 0x20u);
      }
LABEL_19:
      uint64_t v3 = 1;
      goto LABEL_20;
    }
  }
  uint64_t v8 = objc_msgSend(v2, "dmc_remoteManagingAccountIdentifier");
  if (v8)
  {
    v9 = (void *)v8;
    v10 = objc_msgSend(v2, "dmc_remoteManagementAccount");

    if (!v10)
    {
      v28 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v16 = v28;
        v17 = objc_msgSend(v2, "dmc_remoteManagingAccountIdentifier");
        v18 = [v2 identifier];
        v19 = [v2 accountType];
        v20 = [v19 identifier];
        int v30 = 138543874;
        v31 = v17;
        __int16 v32 = 2114;
        v33 = v18;
        __int16 v34 = 2114;
        v35 = v20;
        v21 = "DMCAccountUtilities: Remote Management account (%{public}@) for orphaned account (%{public}@, %{public}@) does not exist.";
        goto LABEL_18;
      }
      goto LABEL_19;
    }
  }
  v11 = [MEMORY[0x263F52810] sharedConfiguration];
  v12 = [v11 memberQueueManagingProfileIdentifier];

  uint64_t v3 = objc_msgSend(v2, "dmc_managementProfileIdentifier");
  if (v3)
  {
    v13 = objc_msgSend(v2, "dmc_managementProfileIdentifier");
    char v14 = [v12 isEqualToString:v13];

    if (v14)
    {
      uint64_t v3 = 0;
    }
    else
    {
      v22 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = v22;
        v24 = objc_msgSend(v2, "dmc_managementProfileIdentifier");
        v25 = [v2 identifier];
        v26 = [v2 accountType];
        v27 = [v26 identifier];
        int v30 = 138543874;
        v31 = v24;
        __int16 v32 = 2114;
        v33 = v25;
        __int16 v34 = 2114;
        v35 = v27;
        _os_log_impl(&dword_225D9B000, v23, OS_LOG_TYPE_ERROR, "DMCAccountUtilities: Enrollment profile (%{public}@) for orphaned account (%{public}@, %{public}@) does not exist.", (uint8_t *)&v30, 0x20u);
      }
      uint64_t v3 = 1;
    }
  }

LABEL_20:
  return v3;
}

@end