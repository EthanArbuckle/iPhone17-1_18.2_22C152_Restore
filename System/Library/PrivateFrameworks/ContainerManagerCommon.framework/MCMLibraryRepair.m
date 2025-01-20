@interface MCMLibraryRepair
- (BOOL)_canRepairLocally;
- (BOOL)createPathsIfNecessaryWithError:(id *)a3;
- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 error:(id *)a4 duringBlock:(id)a5;
- (BOOL)fixPermissionsWithManagedPath:(id)a3 uid:(unsigned int)a4 gid:(unsigned int)a5 error:(id *)a6;
- (BOOL)managedPathsHaveChanged;
- (BOOL)pathsCreated;
- (BOOL)performGenericRepairWithError:(id *)a3;
- (MCMContainerClassIterator)classIterator;
- (MCMFileManager)fileManager;
- (MCMLibraryRepair)initWithManagedPathRegistry:(id)a3 fileManager:(id)a4 classIterator:(id)a5;
- (MCMManagedPathRegistry)registry;
- (id)_managedPathsForGenericRepair;
- (void)setPathsCreated:(BOOL)a3;
@end

@implementation MCMLibraryRepair

- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 error:(id *)a4 duringBlock:(id)a5
{
  v12[1] = *(id *)MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  v9 = v8;
  if (v8)
  {
    v12[0] = 0;
    char v10 = (*((uint64_t (**)(id, id, id *))v8 + 2))(v8, v7, v12);
    id v8 = v12[0];
    if (a4 && (v10 & 1) == 0)
    {
      id v8 = v8;
      char v10 = 0;
      *a4 = v8;
    }
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classIterator, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);

  objc_storeStrong((id *)&self->_registry, 0);
}

- (MCMContainerClassIterator)classIterator
{
  return self->_classIterator;
}

- (MCMFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setPathsCreated:(BOOL)a3
{
  self->_pathsCreated = a3;
}

- (BOOL)pathsCreated
{
  return self->_pathsCreated;
}

- (MCMManagedPathRegistry)registry
{
  return self->_registry;
}

- (BOOL)_canRepairLocally
{
  if (_canRepairLocally_onceToken != -1) {
    dispatch_once(&_canRepairLocally_onceToken, &__block_literal_global_12159);
  }
  return _canRepairLocally_canRepairLocally;
}

void __37__MCMLibraryRepair__canRepairLocally__block_invoke()
{
  id v0 = +[MCMPOSIXUser currentPOSIXUser];
  _canRepairLocally_canRepairLocally = [v0 isRoot];
}

- (id)_managedPathsForGenericRepair
{
  v2 = [(MCMLibraryRepair *)self registry];
  v3 = [v2 paths];

  return v3;
}

- (BOOL)managedPathsHaveChanged
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [(MCMLibraryRepair *)self _managedPathsForGenericRepair];
  v4 = [(MCMLibraryRepair *)self registry];
  v5 = [v4 orderedPathsFromPaths:v3];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v35 count:16];
  if (!v7)
  {
    BOOL v19 = 0;
    goto LABEL_20;
  }
  uint64_t v8 = v7;
  v27 = v3;
  uint64_t v9 = *(void *)v37;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v37 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      v12 = objc_msgSend(v11, "fsNode", v27);

      if (v12)
      {
        v13 = +[MCMFileManager defaultManager];
        v14 = [v11 url];
        id v28 = 0;
        v15 = [v13 fsNodeOfURL:v14 followSymlinks:1 error:&v28];
        id v16 = v28;

        if (v15)
        {
          v17 = [v11 fsNode];
          char v18 = [v17 isEqual:v15];

          if (v18)
          {

            continue;
          }
          v20 = container_log_handle_for_category();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = [v11 url];
            v22 = [v21 path];
            v23 = [v11 fsNode];
            *(_DWORD *)buf = 138543874;
            v30 = v22;
            __int16 v31 = 2114;
            id v32 = v23;
            __int16 v33 = 2114;
            v34 = v15;
            _os_log_impl(&dword_1D7739000, v20, OS_LOG_TYPE_DEFAULT, "Path [%{public}@] changed: old = %{public}@, new = %{public}@", buf, 0x20u);
          }
        }
        else
        {
          v20 = container_log_handle_for_category();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v25 = [v11 url];
            v26 = [v25 path];
            *(_DWORD *)buf = 138543618;
            v30 = v26;
            __int16 v31 = 2114;
            id v32 = v16;
            _os_log_error_impl(&dword_1D7739000, v20, OS_LOG_TYPE_ERROR, "Failed to get fsNode for [%{public}@] when checking for file system changes: %{public}@", buf, 0x16u);
          }
          v15 = 0;
        }
        v3 = v27;

        BOOL v19 = 1;
        goto LABEL_20;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v35 count:16];
    if (v8) {
      continue;
    }
    break;
  }
  BOOL v19 = 0;
  v3 = v27;
LABEL_20:

  return v19;
}

- (BOOL)createPathsIfNecessaryWithError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = self;
  objc_sync_enter(v4);
  if ([(MCMLibraryRepair *)v4 pathsCreated])
  {
    v5 = 0;
  }
  else
  {
    id v6 = [(MCMLibraryRepair *)v4 _managedPathsForGenericRepair];
    uint64_t v7 = [(MCMLibraryRepair *)v4 registry];
    uint64_t v8 = [v7 orderedPathsFromPaths:v6];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v22 count:16];
    if (v10)
    {
      BOOL v19 = a3;
      v5 = 0;
      uint64_t v11 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ((objc_msgSend(v13, "flags", v19) & 2) != 0)
          {
            v14 = [v13 url];
            v20[4] = v13;
            id v21 = v5;
            v20[0] = MEMORY[0x1E4F143A8];
            v20[1] = 3221225472;
            v20[2] = __52__MCMLibraryRepair_createPathsIfNecessaryWithError___block_invoke;
            v20[3] = &unk_1E6A809E0;
            BOOL v15 = [(MCMLibraryRepair *)v4 fixAndRetryIfPermissionsErrorWithURL:v14 error:&v21 duringBlock:v20];
            id v16 = v21;

            if (!v15)
            {

              objc_sync_exit(v4);
              if (v19)
              {
                id v16 = v16;
                BOOL v17 = 0;
                *BOOL v19 = v16;
              }
              else
              {
                BOOL v17 = 0;
              }
              goto LABEL_19;
            }
            v5 = v16;
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      v5 = 0;
    }

    [(MCMLibraryRepair *)v4 setPathsCreated:1];
  }
  objc_sync_exit(v4);

  BOOL v17 = 1;
  id v16 = v5;
LABEL_19:

  return v17;
}

uint64_t __52__MCMLibraryRepair_createPathsIfNecessaryWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[MCMFileManager defaultManager];
  uint64_t v7 = [*(id *)(a1 + 32) mode];
  uint64_t v8 = [*(id *)(a1 + 32) owner];
  uint64_t v9 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:error:", v5, 0, v7, v8, objc_msgSend(*(id *)(a1 + 32), "dpClass"), a3);

  return v9;
}

- (BOOL)performGenericRepairWithError:(id *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = [(MCMLibraryRepair *)self registry];
  uint64_t v29 = [(MCMLibraryRepair *)self _managedPathsForGenericRepair];
  v30 = v5;
  objc_msgSend(v5, "orderedPathsFromPaths:");
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v39 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v28 = a3;
    id v8 = 0;
    uint64_t v9 = *(void *)v40;
    uint64_t v31 = *MEMORY[0x1E4F28798];
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8;
      do
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
        v13 = container_log_handle_for_category();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v12;
          _os_log_impl(&dword_1D7739000, v13, OS_LOG_TYPE_DEFAULT, "Examining %@ for repair.", buf, 0xCu);
        }

        v14 = [v12 owner];
        uint64_t v15 = [v14 UID];
        id v16 = [v12 owner];
        uint64_t v17 = [v16 primaryGID];
        id v33 = v11;
        BOOL v18 = [(MCMLibraryRepair *)self fixPermissionsWithManagedPath:v12 uid:v15 gid:v17 error:&v33];
        id v8 = v33;

        if (!v18)
        {
          BOOL v19 = [v8 domain];
          if (![v19 isEqualToString:v31])
          {

LABEL_20:
            long long v26 = container_log_handle_for_category();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v35 = v12;
              __int16 v36 = 2112;
              id v37 = v8;
              _os_log_error_impl(&dword_1D7739000, v26, OS_LOG_TYPE_ERROR, "Failed to repair [%@]: %@", buf, 0x16u);
            }

            v22 = obj;
            long long v25 = (void *)v29;
            long long v24 = v30;
            if (v28)
            {
              id v8 = v8;
              BOOL v23 = 0;
              *id v28 = v8;
            }
            else
            {
              BOOL v23 = 0;
            }
            goto LABEL_25;
          }
          uint64_t v20 = [v8 code];

          if (v20 != 2) {
            goto LABEL_20;
          }
          id v21 = container_log_handle_for_category();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v12;
            _os_log_impl(&dword_1D7739000, v21, OS_LOG_TYPE_DEFAULT, "Expected path [%@] does not exist, moving on", buf, 0xCu);
          }
        }
        ++v10;
        uint64_t v11 = v8;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v38 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v8 = 0;
  }
  v22 = obj;

  BOOL v23 = 1;
  long long v25 = (void *)v29;
  long long v24 = v30;
LABEL_25:

  return v23;
}

- (BOOL)fixPermissionsWithManagedPath:(id)a3 uid:(unsigned int)a4 gid:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  v19[1] = *(id *)MEMORY[0x1E4F143B8];
  id v10 = a3;
  char v11 = [v10 ACLConfig];
  uint64_t v12 = [v10 ACLConfig] & 2 | v11 & 1;
  unint64_t v13 = v12 & 0xFFFFFFFFFFFFFEFFLL | ((((unint64_t)[v10 flags] >> 2) & 1) << 8);
  v14 = [(MCMLibraryRepair *)self fileManager];
  uint64_t v15 = [v10 url];

  v19[0] = 0;
  char v16 = [v14 repairPermissionsAtURL:v15 uid:v8 gid:v7 options:v13 error:v19];
  id v17 = v19[0];

  if (a6) {
    *a6 = v17;
  }

  return v16;
}

- (MCMLibraryRepair)initWithManagedPathRegistry:(id)a3 fileManager:(id)a4 classIterator:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MCMLibraryRepair;
  uint64_t v12 = [(MCMLibraryRepair *)&v15 init];
  unint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_registry, a3);
    v13->_pathsCreated = 0;
    objc_storeStrong((id *)&v13->_fileManager, a4);
    objc_storeStrong((id *)&v13->_classIterator, a5);
  }

  return v13;
}

@end