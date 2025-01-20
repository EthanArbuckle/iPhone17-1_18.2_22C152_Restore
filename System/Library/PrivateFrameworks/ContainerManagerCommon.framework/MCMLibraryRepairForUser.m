@interface MCMLibraryRepairForUser
- (BOOL)_canRepairLocally;
- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 containerPath:(id)a4 containerIdentifier:(id)a5 error:(id *)a6 duringBlock:(id)a7;
- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 containerRootURL:(id)a4 error:(id *)a5 duringBlock:(id)a6;
- (BOOL)performRepairForContainerPath:(id)a3 containerIdentifier:(id)a4 error:(id *)a5;
- (MCMLibraryRepairForUser)initWithManagedUserPathRegistry:(id)a3 fileManager:(id)a4 classIterator:(id)a5;
- (MCMManagedUserPathRegistry)userRegistry;
- (id)_managedPathFromContainerClassPath:(id)a3 registry:(id)a4;
- (id)_managedPathsForGenericRepair;
- (id)_setByAddingContainerClassPathsToSet:(id)a3 registry:(id)a4;
@end

@implementation MCMLibraryRepairForUser

- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 containerPath:(id)a4 containerIdentifier:(id)a5 error:(id *)a6 duringBlock:(id)a7
{
  v18[1] = *(id *)MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v15 = v14;
  if (v14)
  {
    v18[0] = 0;
    char v16 = (*((uint64_t (**)(id, id, id *))v14 + 2))(v14, v11, v18);
    id v14 = v18[0];
    if (a6 && (v16 & 1) == 0)
    {
      id v14 = v14;
      char v16 = 0;
      *a6 = v14;
    }
  }
  else
  {
    char v16 = 1;
  }

  return v16;
}

- (void).cxx_destruct
{
  p_userRegistry = &self->_userRegistry;

  objc_storeStrong((id *)p_userRegistry, 0);
}

- (MCMManagedUserPathRegistry)userRegistry
{
  return self->_userRegistry;
}

- (BOOL)_canRepairLocally
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)MCMLibraryRepairForUser;
  BOOL v3 = [(MCMLibraryRepair *)&v9 _canRepairLocally];
  getpid();
  v4 = [(MCMLibraryRepairForUser *)self userRegistry];
  v5 = [v4 userIdentity];
  id v6 = [v5 homeDirectoryURL];
  [v6 fileSystemRepresentation];
  int v7 = sandbox_check();

  return v7 && v3;
}

- (id)_managedPathFromContainerClassPath:(id)a3 registry:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [v5 userIdentity];
  v8 = [v7 posixUser];

  objc_super v9 = [v6 baseURL];
  uint64_t v10 = [v5 managedPathForURL:v9];

  id v11 = [MCMManagedPath alloc];
  id v12 = [v6 categoryURL];
  id v13 = -[MCMManagedPath initWithURL:flags:ACLConfig:mode:dpClass:owner:parent:](v11, "initWithURL:flags:ACLConfig:mode:dpClass:owner:parent:", v12, 1, 1, [v6 posixMode], 0xFFFFFFFFLL, v8, v10);

  id v14 = [MCMManagedPath alloc];
  v15 = [v6 classURL];
  uint64_t v16 = [v6 posixMode];

  v17 = [(MCMManagedPath *)v14 initWithURL:v15 flags:1 ACLConfig:1 mode:v16 dpClass:0xFFFFFFFFLL owner:v8 parent:v13];

  return v17;
}

- (id)_setByAddingContainerClassPathsToSet:(id)a3 registry:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = (void *)[a3 mutableCopy];
  v8 = [v6 userIdentity];
  objc_super v9 = +[MCMContainerClassPath containerPathTypeClasses];
  uint64_t v10 = [(MCMLibraryRepair *)self classIterator];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __73__MCMLibraryRepairForUser__setByAddingContainerClassPathsToSet_registry___block_invoke;
  v20 = &unk_1E6A805C8;
  id v21 = v9;
  id v22 = v8;
  v23 = self;
  id v24 = v6;
  id v25 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v8;
  id v14 = v9;
  [v10 selectUserWithIterator:&v17];

  v15 = objc_msgSend(v11, "copy", v17, v18, v19, v20);

  return v15;
}

void __73__MCMLibraryRepairForUser__setByAddingContainerClassPathsToSet_registry___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v34 = a2;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v42 objects:v41 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v33 = *(void *)v43;
    *(void *)&long long v4 = 138412802;
    long long v31 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v43 != v33) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "containerPathForUserIdentity:containerClass:", *(void *)(a1 + 40), objc_msgSend(v34, "containerClass", v31));
        objc_super v9 = [v8 baseURL];
        uint64_t v10 = [v9 path];
        id v11 = [*(id *)(a1 + 40) homeDirectoryURL];
        id v12 = [v11 path];
        int v13 = [v10 hasPrefix:v12];

        id v14 = container_log_handle_for_category();
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);

        if (v13)
        {
          if (v15)
          {
            uint64_t v16 = container_log_handle_for_category();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              id v21 = NSStringFromClass((Class)v7);
              id v22 = [v8 baseURL];
              v23 = [v22 path];
              id v24 = [*(id *)(a1 + 40) homeDirectoryURL];
              id v25 = [v24 path];
              *(_DWORD *)buf = v31;
              v36 = v21;
              __int16 v37 = 2112;
              v38 = v23;
              __int16 v39 = 2112;
              v40 = v25;
              _os_log_debug_impl(&dword_1D7739000, v16, OS_LOG_TYPE_DEBUG, "Including [%@:%@] since it is under [%@]", buf, 0x20u);
            }
          }
          uint64_t v17 = [*(id *)(a1 + 48) _managedPathFromContainerClassPath:v8 registry:*(void *)(a1 + 56)];
          if (v17)
          {
            uint64_t v18 = (void *)v17;
            do
            {
              [*(id *)(a1 + 64) addObject:v18];
              uint64_t v19 = [v18 parent];

              uint64_t v18 = (void *)v19;
            }
            while (v19);
          }
        }
        else if (v15)
        {
          v20 = container_log_handle_for_category();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v26 = NSStringFromClass((Class)v7);
            v27 = [v8 baseURL];
            v28 = [v27 path];
            v29 = [*(id *)(a1 + 40) homeDirectoryURL];
            v30 = [v29 path];
            *(_DWORD *)buf = v31;
            v36 = v26;
            __int16 v37 = 2112;
            v38 = v28;
            __int16 v39 = 2112;
            v40 = v30;
            _os_log_debug_impl(&dword_1D7739000, v20, OS_LOG_TYPE_DEBUG, "Skipping [%@:%@] since it isn't under [%@]", buf, 0x20u);
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v42 objects:v41 count:16];
    }
    while (v5);
  }
}

- (id)_managedPathsForGenericRepair
{
  uint64_t v3 = [(MCMLibraryRepairForUser *)self userRegistry];
  long long v4 = [v3 paths];
  uint64_t v5 = [(MCMLibraryRepairForUser *)self _setByAddingContainerClassPathsToSet:v4 registry:v3];

  return v5;
}

- (BOOL)performRepairForContainerPath:(id)a3 containerIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [MEMORY[0x1E4F1CA80] set];
  objc_super v9 = [(MCMLibraryRepairForUser *)self userRegistry];
  uint64_t v10 = [v9 userIdentity];
  id v11 = [v10 posixUser];

  id v12 = [v7 containerClassPath];
  int v13 = [(MCMLibraryRepairForUser *)self _managedPathFromContainerClassPath:v12 registry:v9];

  id v14 = [v7 containerPathIdentifier];
  v56 = v13;
  uint64_t v15 = [v13 managedPathByAppendingPathComponent:v14 flags:5 ACLConfig:1 mode:493 dpClass:0xFFFFFFFFLL owner:v11];

  v57 = (void *)v15;
  [v8 addObject:v15];
  uint64_t v16 = [v9 userIdentity];
  uint64_t v17 = [v16 homeDirectoryURL];
  uint64_t v18 = [v17 path];

  if (!v18)
  {
    v38 = [v9 userIdentity];

    if (!v38)
    {
      long long v45 = container_log_handle_for_category();
      v41 = v56;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D7739000, v45, OS_LOG_TYPE_FAULT, "User path registry has no user identity", buf, 2u);
      }
      goto LABEL_39;
    }
    __int16 v39 = [v9 userIdentity];
    v40 = [v39 homeDirectoryURL];

    v41 = v56;
    if (v40)
    {
      long long v42 = [v9 userIdentity];
      long long v43 = [v42 homeDirectoryURL];
      long long v44 = [v43 path];

      if (v44) {
        goto LABEL_40;
      }
      long long v45 = container_log_handle_for_category();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        uint64_t v46 = [v9 userIdentity];
        v47 = [v46 homeDirectoryURL];
        *(_DWORD *)buf = 138412290;
        id v63 = v47;
        _os_log_fault_impl(&dword_1D7739000, v45, OS_LOG_TYPE_FAULT, "User identity has no home directory path cannot be computed (%@)", buf, 0xCu);

LABEL_45:
      }
    }
    else
    {
      long long v45 = container_log_handle_for_category();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        uint64_t v46 = [v9 userIdentity];
        *(_DWORD *)buf = 138412290;
        id v63 = v46;
        _os_log_fault_impl(&dword_1D7739000, v45, OS_LOG_TYPE_FAULT, "User identity has no home directory URL (%@)", buf, 0xCu);
        goto LABEL_45;
      }
    }
LABEL_39:

LABEL_40:
    id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:75 userInfo:0];
    BOOL v37 = 0;
    if (!a5) {
      goto LABEL_43;
    }
    goto LABEL_41;
  }
  id v61 = 0;
  BOOL v19 = [(MCMLibraryRepair *)self performGenericRepairWithError:&v61];
  id v20 = v61;
  if (!v19)
  {
    v48 = container_log_handle_for_category();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v63 = v20;
      _os_log_error_impl(&dword_1D7739000, v48, OS_LOG_TYPE_ERROR, "Failed to repair generic paths: %@", buf, 0xCu);
    }

    BOOL v37 = 0;
    v41 = v56;
    if (!a5) {
      goto LABEL_43;
    }
LABEL_41:
    if (!v37) {
      *a5 = v20;
    }
    goto LABEL_43;
  }
  v55 = v11;
  id v21 = [v9 orderedPathsFromPaths:v8];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = v21;
  uint64_t v22 = [obj countByEnumeratingWithState:&v67 objects:v66 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    v51 = v9;
    v52 = a5;
    v53 = v8;
    id v54 = v7;
    uint64_t v24 = *(void *)v68;
    uint64_t v58 = *MEMORY[0x1E4F28798];
    while (2)
    {
      uint64_t v25 = 0;
      uint64_t v26 = v20;
      do
      {
        if (*(void *)v68 != v24) {
          objc_enumerationMutation(obj);
        }
        v27 = *(void **)(*((void *)&v67 + 1) + 8 * v25);
        v28 = container_log_handle_for_category();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v63 = v27;
          _os_log_impl(&dword_1D7739000, v28, OS_LOG_TYPE_DEFAULT, "Examining %@ for repair.", buf, 0xCu);
        }

        v29 = [v27 owner];
        uint64_t v30 = [v29 UID];
        long long v31 = [v27 owner];
        uint64_t v32 = [v31 primaryGID];
        id v60 = v26;
        BOOL v33 = [(MCMLibraryRepair *)self fixPermissionsWithManagedPath:v27 uid:v30 gid:v32 error:&v60];
        id v20 = v60;

        if (!v33)
        {
          id v34 = [v20 domain];
          if (![v34 isEqualToString:v58])
          {

LABEL_32:
            v49 = container_log_handle_for_category();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v63 = v27;
              __int16 v64 = 2112;
              id v65 = v20;
              _os_log_error_impl(&dword_1D7739000, v49, OS_LOG_TYPE_ERROR, "Failed to repair [%@]: %@", buf, 0x16u);
            }

            BOOL v37 = 0;
            goto LABEL_35;
          }
          uint64_t v35 = [v20 code];

          if (v35 != 2) {
            goto LABEL_32;
          }
          v36 = container_log_handle_for_category();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v63 = v27;
            _os_log_impl(&dword_1D7739000, v36, OS_LOG_TYPE_DEFAULT, "Expected path [%@] does not exist, moving on", buf, 0xCu);
          }
        }
        ++v25;
        uint64_t v26 = v20;
      }
      while (v23 != v25);
      uint64_t v23 = [obj countByEnumeratingWithState:&v67 objects:v66 count:16];
      if (v23) {
        continue;
      }
      break;
    }
    BOOL v37 = 1;
LABEL_35:
    v8 = v53;
    id v7 = v54;
    objc_super v9 = v51;
    a5 = v52;
  }
  else
  {
    BOOL v37 = 1;
  }
  id v11 = v55;
  v41 = v56;

  if (a5) {
    goto LABEL_41;
  }
LABEL_43:

  return v37;
}

- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 containerRootURL:(id)a4 error:(id *)a5 duringBlock:(id)a6
{
  v15[1] = *(id *)MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = v11;
  if (v11)
  {
    v15[0] = 0;
    char v13 = (*((uint64_t (**)(id, id, id *))v11 + 2))(v11, v9, v15);
    id v11 = v15[0];
    if (a5 && (v13 & 1) == 0)
    {
      id v11 = v11;
      char v13 = 0;
      *a5 = v11;
    }
  }
  else
  {
    char v13 = 1;
  }

  return v13;
}

- (MCMLibraryRepairForUser)initWithManagedUserPathRegistry:(id)a3 fileManager:(id)a4 classIterator:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMLibraryRepairForUser;
  id v10 = [(MCMLibraryRepair *)&v13 initWithManagedPathRegistry:v9 fileManager:a4 classIterator:a5];
  id v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_userRegistry, a3);
  }

  return v11;
}

@end