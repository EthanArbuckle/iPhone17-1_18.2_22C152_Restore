@interface MCMContainerClassDeletedPath
+ (id)_posixOwnerForDeletedPathForContainerClass:(unint64_t)a3 user:(id)a4;
+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4;
+ (id)deletedGlobalURL;
+ (id)deletedURLWithUserIdentity:(id)a3;
@end

@implementation MCMContainerClassDeletedPath

+ (id)_posixOwnerForDeletedPathForContainerClass:(unint64_t)a3 user:(id)a4
{
  id v5 = a4;
  id v6 = containermanager_copy_global_configuration();
  LODWORD(a3) = [v6 isGlobalContainerClass:a3];

  if (a3)
  {
    id v7 = containermanager_copy_global_configuration();
    id v8 = [v7 currentUser];
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

+ (id)deletedURLWithUserIdentity:(id)a3
{
  id v3 = a3;
  v4 = +[MCMUserIdentitySharedCache sharedInstance];
  id v5 = [v4 libraryRepairForUserIdentity:v3];

  id v6 = [v5 userRegistry];
  id v7 = [v6 containermanagerUserDeathrow];

  id v8 = [v7 url];

  return v8;
}

+ (id)deletedGlobalURL
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = containermanager_copy_global_configuration();
  v4 = [v3 managedPathRegistry];
  id v5 = [v4 containermanagerDeathrow];

  if (!v5)
  {
    id v10 = 0;
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  id v6 = containermanager_copy_global_configuration();
  id v7 = [v6 libraryRepair];
  id v8 = [v5 url];
  v15[4] = a1;
  id v16 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__MCMContainerClassDeletedPath_deletedGlobalURL__block_invoke;
  v15[3] = &__block_descriptor_40_e19_B24__0__NSURL_8__16l;
  int v9 = [v7 fixAndRetryIfPermissionsErrorWithURL:v8 error:&v16 duringBlock:v15];
  id v10 = v16;

  if (!v9)
  {
    v12 = container_log_handle_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v5;
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_fault_impl(&dword_1D7739000, v12, OS_LOG_TYPE_FAULT, "Failed to create deathrow at %@: %{public}@", buf, 0x16u);
    }

    goto LABEL_8;
  }
  v11 = [v5 url];
LABEL_9:
  id v13 = v11;

  return v13;
}

uint64_t __48__MCMContainerClassDeletedPath_deletedGlobalURL__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = containermanager_copy_global_configuration();
  id v7 = [v6 currentUser];
  uint64_t v8 = objc_msgSend(v4, "_inLibraryRepairBlock_createURLIfNecessary:mode:owner:dataProtectionClass:exists:error:", v5, 493, v7, 0xFFFFFFFFLL, 0, a3);

  return v8;
}

+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 posixUser];
  uint64_t v8 = [a1 _posixOwnerForDeletedPathForContainerClass:a4 user:v7];

  uint64_t v9 = [a1 _modeForContainerClass:a4];
  id v10 = containermanager_copy_global_configuration();
  int v11 = [v10 isGlobalContainerClass:a4];

  if (v11)
  {
    uint64_t v12 = [a1 deletedGlobalURL];
LABEL_5:
    id v13 = (void *)v12;
    goto LABEL_6;
  }
  if (v6)
  {
    uint64_t v12 = [a1 deletedURLWithUserIdentity:v6];
    goto LABEL_5;
  }
  id v16 = container_log_handle_for_category();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v18 = a4;
    _os_log_fault_impl(&dword_1D7739000, v16, OS_LOG_TYPE_FAULT, "Container class [%llu] requires a user identity.", buf, 0xCu);
  }

  id v13 = 0;
LABEL_6:
  v14 = (void *)[objc_alloc((Class)a1) initWithBaseURL:v13 categoryComponent:0 classComponent:0 containerClass:a4 POSIXOwner:v8 POSIXMode:v9 userIdentity:v6];

  return v14;
}

@end